//
//  JCmodel_newCustomer2Base.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2Base.h"
#import "JCmodel_newCustomer2Data.h"


NSString *const kJCmodel_newCustomer2BaseResult = @"result";
NSString *const kJCmodel_newCustomer2BaseNum = @"num";
NSString *const kJCmodel_newCustomer2BaseCode = @"code";
NSString *const kJCmodel_newCustomer2BaseMsg = @"msg";
NSString *const kJCmodel_newCustomer2BaseData = @"data";


@interface JCmodel_newCustomer2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2Base

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
            self.result = [self objectOrNilForKey:kJCmodel_newCustomer2BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCmodel_newCustomer2BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCmodel_newCustomer2BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCmodel_newCustomer2BaseMsg fromDictionary:dict];
            self.data = [JCmodel_newCustomer2Data modelObjectWithDictionary:[dict objectForKey:kJCmodel_newCustomer2BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCmodel_newCustomer2BaseResult];
    [mutableDict setValue:self.num forKey:kJCmodel_newCustomer2BaseNum];
    [mutableDict setValue:self.code forKey:kJCmodel_newCustomer2BaseCode];
    [mutableDict setValue:self.msg forKey:kJCmodel_newCustomer2BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCmodel_newCustomer2BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCmodel_newCustomer2BaseResult];
    [aCoder encodeObject:_num forKey:kJCmodel_newCustomer2BaseNum];
    [aCoder encodeObject:_code forKey:kJCmodel_newCustomer2BaseCode];
    [aCoder encodeObject:_msg forKey:kJCmodel_newCustomer2BaseMsg];
    [aCoder encodeObject:_data forKey:kJCmodel_newCustomer2BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2Base *copy = [[JCmodel_newCustomer2Base alloc] init];
    
    
    
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
