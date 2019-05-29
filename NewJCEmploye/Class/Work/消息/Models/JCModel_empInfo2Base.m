//
//  JCModel_empInfo2Base.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_empInfo2Base.h"
#import "JCModel_empInfo2Data.h"


NSString *const kJCModel_empInfo2BaseResult = @"result";
NSString *const kJCModel_empInfo2BaseNum = @"num";
NSString *const kJCModel_empInfo2BaseCode = @"code";
NSString *const kJCModel_empInfo2BaseMsg = @"msg";
NSString *const kJCModel_empInfo2BaseData = @"data";


@interface JCModel_empInfo2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_empInfo2Base

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
            self.result = [self objectOrNilForKey:kJCModel_empInfo2BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_empInfo2BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_empInfo2BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_empInfo2BaseMsg fromDictionary:dict];
            self.data = [JCModel_empInfo2Data modelObjectWithDictionary:[dict objectForKey:kJCModel_empInfo2BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_empInfo2BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_empInfo2BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_empInfo2BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_empInfo2BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_empInfo2BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_empInfo2BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_empInfo2BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_empInfo2BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_empInfo2BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_empInfo2BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_empInfo2BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_empInfo2BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_empInfo2BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_empInfo2BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_empInfo2BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_empInfo2Base *copy = [[JCModel_empInfo2Base alloc] init];
    
    
    
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
