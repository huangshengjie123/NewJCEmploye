//
//  JCModel_salesReturnBase.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnBase.h"
#import "JCModel_salesReturnData.h"


NSString *const kJCModel_salesReturnBaseResult = @"result";
NSString *const kJCModel_salesReturnBaseNum = @"num";
NSString *const kJCModel_salesReturnBaseCode = @"code";
NSString *const kJCModel_salesReturnBaseMsg = @"msg";
NSString *const kJCModel_salesReturnBaseData = @"data";


@interface JCModel_salesReturnBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnBase

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
            self.result = [self objectOrNilForKey:kJCModel_salesReturnBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_salesReturnBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_salesReturnBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_salesReturnBaseMsg fromDictionary:dict];
            self.data = [JCModel_salesReturnData modelObjectWithDictionary:[dict objectForKey:kJCModel_salesReturnBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_salesReturnBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_salesReturnBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_salesReturnBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_salesReturnBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_salesReturnBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_salesReturnBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_salesReturnBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_salesReturnBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_salesReturnBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_salesReturnBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_salesReturnBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_salesReturnBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_salesReturnBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_salesReturnBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_salesReturnBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnBase *copy = [[JCModel_salesReturnBase alloc] init];
    
    
    
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
