//
//  JCModel_refundData3Base.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3Base.h"
#import "JCModel_refundData3Data.h"


NSString *const kJCModel_refundData3BaseResult = @"result";
NSString *const kJCModel_refundData3BaseNum = @"num";
NSString *const kJCModel_refundData3BaseCode = @"code";
NSString *const kJCModel_refundData3BaseMsg = @"msg";
NSString *const kJCModel_refundData3BaseData = @"data";


@interface JCModel_refundData3Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3Base

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
            self.result = [self objectOrNilForKey:kJCModel_refundData3BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_refundData3BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_refundData3BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_refundData3BaseMsg fromDictionary:dict];
            self.data = [JCModel_refundData3Data modelObjectWithDictionary:[dict objectForKey:kJCModel_refundData3BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_refundData3BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_refundData3BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_refundData3BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_refundData3BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_refundData3BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_refundData3BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_refundData3BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_refundData3BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_refundData3BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_refundData3BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_refundData3BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_refundData3BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_refundData3BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_refundData3BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_refundData3BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3Base *copy = [[JCModel_refundData3Base alloc] init];
    
    
    
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
