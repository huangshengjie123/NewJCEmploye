//
//  JCModel_NewDostribution1Base.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1Base.h"
#import "JCModel_NewDostribution1Data.h"


NSString *const kJCModel_NewDostribution1BaseResult = @"result";
NSString *const kJCModel_NewDostribution1BaseNum = @"num";
NSString *const kJCModel_NewDostribution1BaseCode = @"code";
NSString *const kJCModel_NewDostribution1BaseMsg = @"msg";
NSString *const kJCModel_NewDostribution1BaseData = @"data";


@interface JCModel_NewDostribution1Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1Base

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
            self.result = [self objectOrNilForKey:kJCModel_NewDostribution1BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_NewDostribution1BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_NewDostribution1BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_NewDostribution1BaseMsg fromDictionary:dict];
            self.data = [JCModel_NewDostribution1Data modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDostribution1BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_NewDostribution1BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_NewDostribution1BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_NewDostribution1BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_NewDostribution1BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_NewDostribution1BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_NewDostribution1BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_NewDostribution1BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_NewDostribution1BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_NewDostribution1BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_NewDostribution1BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1Base *copy = [[JCModel_NewDostribution1Base alloc] init];
    
    
    
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
