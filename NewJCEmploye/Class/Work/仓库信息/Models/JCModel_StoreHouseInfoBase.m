//
//  JCModel_StoreHouseInfoBase.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_StoreHouseInfoBase.h"
#import "JCModel_StoreHouseInfoData.h"


NSString *const kJCModel_StoreHouseInfoBaseResult = @"result";
NSString *const kJCModel_StoreHouseInfoBaseNum = @"num";
NSString *const kJCModel_StoreHouseInfoBaseCode = @"code";
NSString *const kJCModel_StoreHouseInfoBaseMsg = @"msg";
NSString *const kJCModel_StoreHouseInfoBaseData = @"data";


@interface JCModel_StoreHouseInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_StoreHouseInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_StoreHouseInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_StoreHouseInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_StoreHouseInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_StoreHouseInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_StoreHouseInfoData = [dict objectForKey:kJCModel_StoreHouseInfoBaseData];
    NSMutableArray *parsedJCModel_StoreHouseInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_StoreHouseInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_StoreHouseInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_StoreHouseInfoData addObject:[JCModel_StoreHouseInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_StoreHouseInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_StoreHouseInfoData addObject:[JCModel_StoreHouseInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_StoreHouseInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_StoreHouseInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_StoreHouseInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_StoreHouseInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_StoreHouseInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_StoreHouseInfoBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_StoreHouseInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_StoreHouseInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_StoreHouseInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_StoreHouseInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_StoreHouseInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_StoreHouseInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_StoreHouseInfoBase *copy = [[JCModel_StoreHouseInfoBase alloc] init];
    
    
    
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
