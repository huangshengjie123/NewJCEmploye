//
//  JCModel_inAndOutTotalBase.m
//
//  Created by   on 2018/11/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inAndOutTotalBase.h"
#import "JCModel_inAndOutTotalData.h"


NSString *const kJCModel_inAndOutTotalBaseResult = @"result";
NSString *const kJCModel_inAndOutTotalBaseNum = @"num";
NSString *const kJCModel_inAndOutTotalBaseCode = @"code";
NSString *const kJCModel_inAndOutTotalBaseMsg = @"msg";
NSString *const kJCModel_inAndOutTotalBaseData = @"data";


@interface JCModel_inAndOutTotalBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inAndOutTotalBase

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
            self.result = [self objectOrNilForKey:kJCModel_inAndOutTotalBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_inAndOutTotalBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_inAndOutTotalBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_inAndOutTotalBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_inAndOutTotalData = [dict objectForKey:kJCModel_inAndOutTotalBaseData];
    NSMutableArray *parsedJCModel_inAndOutTotalData = [NSMutableArray array];
    
    if ([receivedJCModel_inAndOutTotalData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_inAndOutTotalData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_inAndOutTotalData addObject:[JCModel_inAndOutTotalData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_inAndOutTotalData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_inAndOutTotalData addObject:[JCModel_inAndOutTotalData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_inAndOutTotalData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_inAndOutTotalData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_inAndOutTotalBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_inAndOutTotalBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_inAndOutTotalBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_inAndOutTotalBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_inAndOutTotalBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_inAndOutTotalBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_inAndOutTotalBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_inAndOutTotalBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_inAndOutTotalBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_inAndOutTotalBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inAndOutTotalBase *copy = [[JCModel_inAndOutTotalBase alloc] init];
    
    
    
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
