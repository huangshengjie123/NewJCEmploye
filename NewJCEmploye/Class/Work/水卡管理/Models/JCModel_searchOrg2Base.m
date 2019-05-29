//
//  JCModel_searchOrg2Base.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchOrg2Base.h"
#import "JCModel_searchOrg2Data.h"


NSString *const kJCModel_searchOrg2BaseResult = @"result";
NSString *const kJCModel_searchOrg2BaseNum = @"num";
NSString *const kJCModel_searchOrg2BaseCode = @"code";
NSString *const kJCModel_searchOrg2BaseMsg = @"msg";
NSString *const kJCModel_searchOrg2BaseData = @"data";


@interface JCModel_searchOrg2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchOrg2Base

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
            self.result = [self objectOrNilForKey:kJCModel_searchOrg2BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_searchOrg2BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_searchOrg2BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_searchOrg2BaseMsg fromDictionary:dict];
            self.data = [JCModel_searchOrg2Data modelObjectWithDictionary:[dict objectForKey:kJCModel_searchOrg2BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_searchOrg2BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_searchOrg2BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_searchOrg2BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_searchOrg2BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_searchOrg2BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_searchOrg2BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_searchOrg2BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_searchOrg2BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_searchOrg2BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_searchOrg2BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_searchOrg2BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_searchOrg2BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_searchOrg2BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_searchOrg2BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_searchOrg2BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchOrg2Base *copy = [[JCModel_searchOrg2Base alloc] init];
    
    
    
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
