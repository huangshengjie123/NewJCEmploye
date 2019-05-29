//
//  JCModel_ReadWaterCard1Base.m
//
//  Created by   on 2018/10/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWaterCard1Base.h"
#import "JCModel_ReadWaterCard1Data.h"


NSString *const kJCModel_ReadWaterCard1BaseResult = @"result";
NSString *const kJCModel_ReadWaterCard1BaseNum = @"num";
NSString *const kJCModel_ReadWaterCard1BaseCode = @"code";
NSString *const kJCModel_ReadWaterCard1BaseMsg = @"msg";
NSString *const kJCModel_ReadWaterCard1BaseData = @"data";


@interface JCModel_ReadWaterCard1Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWaterCard1Base

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
            self.result = [self objectOrNilForKey:kJCModel_ReadWaterCard1BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ReadWaterCard1BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ReadWaterCard1BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ReadWaterCard1BaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_ReadWaterCard1Data = [dict objectForKey:kJCModel_ReadWaterCard1BaseData];
    NSMutableArray *parsedJCModel_ReadWaterCard1Data = [NSMutableArray array];
    
    if ([receivedJCModel_ReadWaterCard1Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReadWaterCard1Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReadWaterCard1Data addObject:[JCModel_ReadWaterCard1Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReadWaterCard1Data isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReadWaterCard1Data addObject:[JCModel_ReadWaterCard1Data modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReadWaterCard1Data]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_ReadWaterCard1Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ReadWaterCard1BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ReadWaterCard1BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ReadWaterCard1BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ReadWaterCard1BaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_ReadWaterCard1BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ReadWaterCard1BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ReadWaterCard1BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ReadWaterCard1BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ReadWaterCard1BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ReadWaterCard1BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWaterCard1Base *copy = [[JCModel_ReadWaterCard1Base alloc] init];
    
    
    
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
