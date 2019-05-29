//
//  JCModel_FinfoBase.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinfoBase.h"
#import "JCModel_FinfoData.h"


NSString *const kJCModel_FinfoBaseResult = @"result";
NSString *const kJCModel_FinfoBaseNum = @"num";
NSString *const kJCModel_FinfoBaseCode = @"code";
NSString *const kJCModel_FinfoBaseMsg = @"msg";
NSString *const kJCModel_FinfoBaseData = @"data";


@interface JCModel_FinfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinfoBase

@synthesize result = _result;
@synthesize num = _num;
@synthesize code = _code;
@synthesize msg = _msg;
@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.result = [self objectOrNilForKey:kJCModel_FinfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_FinfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_FinfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_FinfoBaseMsg fromDictionary:dict];
            self.data = [JCModel_FinfoData modelObjectWithDictionary:[dict objectForKey:kJCModel_FinfoBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_FinfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_FinfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_FinfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_FinfoBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_FinfoBaseData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.result = [aDecoder decodeObjectForKey:kJCModel_FinfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_FinfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_FinfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_FinfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_FinfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_FinfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_FinfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_FinfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_FinfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_FinfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinfoBase *copy = [[JCModel_FinfoBase alloc] init];
    
    
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
