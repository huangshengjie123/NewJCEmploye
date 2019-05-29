//
//  JCModel_getStoreHouseFacBase.m
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseFacBase.h"
#import "JCModel_getStoreHouseFacData.h"


NSString *const kJCModel_getStoreHouseFacBaseResult = @"result";
NSString *const kJCModel_getStoreHouseFacBaseNum = @"num";
NSString *const kJCModel_getStoreHouseFacBaseCode = @"code";
NSString *const kJCModel_getStoreHouseFacBaseMsg = @"msg";
NSString *const kJCModel_getStoreHouseFacBaseData = @"data";


@interface JCModel_getStoreHouseFacBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseFacBase

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
            self.result = [self objectOrNilForKey:kJCModel_getStoreHouseFacBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_getStoreHouseFacBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_getStoreHouseFacBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_getStoreHouseFacBaseMsg fromDictionary:dict];
            self.data = [JCModel_getStoreHouseFacData modelObjectWithDictionary:[dict objectForKey:kJCModel_getStoreHouseFacBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_getStoreHouseFacBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_getStoreHouseFacBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_getStoreHouseFacBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_getStoreHouseFacBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_getStoreHouseFacBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_getStoreHouseFacBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_getStoreHouseFacBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_getStoreHouseFacBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_getStoreHouseFacBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_getStoreHouseFacBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseFacBase *copy = [[JCModel_getStoreHouseFacBase alloc] init];
    
    
    
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
