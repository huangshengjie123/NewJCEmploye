//
//  JCModel_CusWaterInfoBase.m
//
//  Created by   on 2018/8/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CusWaterInfoBase.h"
#import "JCModel_CusWaterInfoData.h"


NSString *const kJCModel_CusWaterInfoBaseResult = @"result";
NSString *const kJCModel_CusWaterInfoBaseNum = @"num";
NSString *const kJCModel_CusWaterInfoBaseCode = @"code";
NSString *const kJCModel_CusWaterInfoBaseMsg = @"msg";
NSString *const kJCModel_CusWaterInfoBaseData = @"data";


@interface JCModel_CusWaterInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CusWaterInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_CusWaterInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_CusWaterInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_CusWaterInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_CusWaterInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_CusWaterInfoData = [dict objectForKey:kJCModel_CusWaterInfoBaseData];
    NSMutableArray *parsedJCModel_CusWaterInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_CusWaterInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CusWaterInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CusWaterInfoData addObject:[JCModel_CusWaterInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CusWaterInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CusWaterInfoData addObject:[JCModel_CusWaterInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CusWaterInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_CusWaterInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_CusWaterInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_CusWaterInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_CusWaterInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_CusWaterInfoBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_CusWaterInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_CusWaterInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_CusWaterInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_CusWaterInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_CusWaterInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_CusWaterInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CusWaterInfoBase *copy = [[JCModel_CusWaterInfoBase alloc] init];
    
    
    
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
