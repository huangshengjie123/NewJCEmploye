//
//  JCModel_WaterCardDetailsBase.m
//
//  Created by   on 2018/7/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardDetailsBase.h"
#import "JCModel_WaterCardDetailsData.h"


NSString *const kJCModel_WaterCardDetailsBaseResult = @"result";
NSString *const kJCModel_WaterCardDetailsBaseNum = @"num";
NSString *const kJCModel_WaterCardDetailsBaseCode = @"code";
NSString *const kJCModel_WaterCardDetailsBaseMsg = @"msg";
NSString *const kJCModel_WaterCardDetailsBaseData = @"data";


@interface JCModel_WaterCardDetailsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardDetailsBase

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
            self.result = [self objectOrNilForKey:kJCModel_WaterCardDetailsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WaterCardDetailsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_WaterCardDetailsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_WaterCardDetailsBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardDetailsData = [dict objectForKey:kJCModel_WaterCardDetailsBaseData];
    NSMutableArray *parsedJCModel_WaterCardDetailsData = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardDetailsData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardDetailsData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardDetailsData addObject:[JCModel_WaterCardDetailsData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardDetailsData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardDetailsData addObject:[JCModel_WaterCardDetailsData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardDetailsData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_WaterCardDetailsData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_WaterCardDetailsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_WaterCardDetailsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_WaterCardDetailsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_WaterCardDetailsBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_WaterCardDetailsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_WaterCardDetailsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_WaterCardDetailsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_WaterCardDetailsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_WaterCardDetailsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_WaterCardDetailsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardDetailsBase *copy = [[JCModel_WaterCardDetailsBase alloc] init];
    
    
    
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
