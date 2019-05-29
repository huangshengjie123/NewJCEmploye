//
//  JCModel_SalesStatisticsInfoBase.m
//
//  Created by   on 2018/11/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SalesStatisticsInfoBase.h"
#import "JCModel_SalesStatisticsInfoData.h"


NSString *const kJCModel_SalesStatisticsInfoBaseResult = @"result";
NSString *const kJCModel_SalesStatisticsInfoBaseNum = @"num";
NSString *const kJCModel_SalesStatisticsInfoBaseCode = @"code";
NSString *const kJCModel_SalesStatisticsInfoBaseMsg = @"msg";
NSString *const kJCModel_SalesStatisticsInfoBaseData = @"data";


@interface JCModel_SalesStatisticsInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SalesStatisticsInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_SalesStatisticsInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_SalesStatisticsInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_SalesStatisticsInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_SalesStatisticsInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_SalesStatisticsInfoData = [dict objectForKey:kJCModel_SalesStatisticsInfoBaseData];
    NSMutableArray *parsedJCModel_SalesStatisticsInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_SalesStatisticsInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SalesStatisticsInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SalesStatisticsInfoData addObject:[JCModel_SalesStatisticsInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SalesStatisticsInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SalesStatisticsInfoData addObject:[JCModel_SalesStatisticsInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SalesStatisticsInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_SalesStatisticsInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_SalesStatisticsInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_SalesStatisticsInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_SalesStatisticsInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_SalesStatisticsInfoBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_SalesStatisticsInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_SalesStatisticsInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_SalesStatisticsInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_SalesStatisticsInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_SalesStatisticsInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_SalesStatisticsInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SalesStatisticsInfoBase *copy = [[JCModel_SalesStatisticsInfoBase alloc] init];
    
    
    
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
