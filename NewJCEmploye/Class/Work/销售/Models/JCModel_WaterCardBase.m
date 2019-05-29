//
//  JCModel_WaterCardBase.m
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardBase.h"
#import "JCModel_WaterCardData.h"


NSString *const kJCModel_WaterCardBaseResult = @"result";
NSString *const kJCModel_WaterCardBaseNum = @"num";
NSString *const kJCModel_WaterCardBaseCode = @"code";
NSString *const kJCModel_WaterCardBaseMsg = @"msg";
NSString *const kJCModel_WaterCardBaseData = @"data";


@interface JCModel_WaterCardBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardBase

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
            self.result = [self objectOrNilForKey:kJCModel_WaterCardBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WaterCardBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_WaterCardBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_WaterCardBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardData = [dict objectForKey:kJCModel_WaterCardBaseData];
    NSMutableArray *parsedJCModel_WaterCardData = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardData addObject:[JCModel_WaterCardData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardData addObject:[JCModel_WaterCardData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_WaterCardData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_WaterCardBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_WaterCardBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_WaterCardBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_WaterCardBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_WaterCardBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_WaterCardBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WaterCardBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_WaterCardBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_WaterCardBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_WaterCardBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_WaterCardBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_WaterCardBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_WaterCardBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_WaterCardBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_WaterCardBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardBase *copy = [[JCModel_WaterCardBase alloc] init];
    
    
    
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
