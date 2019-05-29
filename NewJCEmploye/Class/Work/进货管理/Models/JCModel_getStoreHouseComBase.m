//
//  JCModel_getStoreHouseComBase.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseComBase.h"
#import "JCModel_getStoreHouseComData.h"


NSString *const kJCModel_getStoreHouseComBaseResult = @"result";
NSString *const kJCModel_getStoreHouseComBaseNum = @"num";
NSString *const kJCModel_getStoreHouseComBaseCode = @"code";
NSString *const kJCModel_getStoreHouseComBaseMsg = @"msg";
NSString *const kJCModel_getStoreHouseComBaseData = @"data";


@interface JCModel_getStoreHouseComBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseComBase

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
            self.result = [self objectOrNilForKey:kJCModel_getStoreHouseComBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_getStoreHouseComBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_getStoreHouseComBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_getStoreHouseComBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_getStoreHouseComData = [dict objectForKey:kJCModel_getStoreHouseComBaseData];
    NSMutableArray *parsedJCModel_getStoreHouseComData = [NSMutableArray array];
    
    if ([receivedJCModel_getStoreHouseComData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_getStoreHouseComData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_getStoreHouseComData addObject:[JCModel_getStoreHouseComData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_getStoreHouseComData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_getStoreHouseComData addObject:[JCModel_getStoreHouseComData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_getStoreHouseComData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_getStoreHouseComData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_getStoreHouseComBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_getStoreHouseComBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_getStoreHouseComBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_getStoreHouseComBaseMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_getStoreHouseComBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_getStoreHouseComBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_getStoreHouseComBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_getStoreHouseComBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_getStoreHouseComBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_getStoreHouseComBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseComBase *copy = [[JCModel_getStoreHouseComBase alloc] init];
    
    
    
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
