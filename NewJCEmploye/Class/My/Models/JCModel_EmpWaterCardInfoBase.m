//
//  JCModel_EmpWaterCardInfoBase.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpWaterCardInfoBase.h"
#import "JCModel_EmpWaterCardInfoData.h"


NSString *const kJCModel_EmpWaterCardInfoBaseResult = @"result";
NSString *const kJCModel_EmpWaterCardInfoBaseNum = @"num";
NSString *const kJCModel_EmpWaterCardInfoBaseCode = @"code";
NSString *const kJCModel_EmpWaterCardInfoBaseMsg = @"msg";
NSString *const kJCModel_EmpWaterCardInfoBaseData = @"data";


@interface JCModel_EmpWaterCardInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpWaterCardInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_EmpWaterCardInfoData = [dict objectForKey:kJCModel_EmpWaterCardInfoBaseData];
    NSMutableArray *parsedJCModel_EmpWaterCardInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_EmpWaterCardInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_EmpWaterCardInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_EmpWaterCardInfoData addObject:[JCModel_EmpWaterCardInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_EmpWaterCardInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_EmpWaterCardInfoData addObject:[JCModel_EmpWaterCardInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_EmpWaterCardInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_EmpWaterCardInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_EmpWaterCardInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_EmpWaterCardInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_EmpWaterCardInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_EmpWaterCardInfoBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_EmpWaterCardInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_EmpWaterCardInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_EmpWaterCardInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_EmpWaterCardInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_EmpWaterCardInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_EmpWaterCardInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpWaterCardInfoBase *copy = [[JCModel_EmpWaterCardInfoBase alloc] init];
    
    
    
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
