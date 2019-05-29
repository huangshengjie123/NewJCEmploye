//
//  JCModel_CustomerBase.m
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CustomerBase.h"
#import "JCModel_CustomerData.h"


NSString *const kJCModel_CustomerBaseResult = @"result";
NSString *const kJCModel_CustomerBaseNum = @"num";
NSString *const kJCModel_CustomerBaseCode = @"code";
NSString *const kJCModel_CustomerBaseMsg = @"msg";
NSString *const kJCModel_CustomerBaseData = @"data";


@interface JCModel_CustomerBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CustomerBase

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
            self.result = [self objectOrNilForKey:kJCModel_CustomerBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_CustomerBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_CustomerBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_CustomerBaseMsg fromDictionary:dict];
            self.data = [JCModel_CustomerData modelObjectWithDictionary:[dict objectForKey:kJCModel_CustomerBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_CustomerBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_CustomerBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_CustomerBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_CustomerBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_CustomerBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_CustomerBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_CustomerBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_CustomerBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_CustomerBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_CustomerBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_CustomerBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_CustomerBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_CustomerBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_CustomerBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_CustomerBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CustomerBase *copy = [[JCModel_CustomerBase alloc] init];
    
    
    
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
