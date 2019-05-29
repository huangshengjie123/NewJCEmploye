//
//  JCModel_rankingBase.m
//
//  Created by   on 2019/3/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rankingBase.h"
#import "JCModel_rankingData.h"


NSString *const kJCModel_rankingBaseResult = @"result";
NSString *const kJCModel_rankingBaseNum = @"num";
NSString *const kJCModel_rankingBaseCode = @"code";
NSString *const kJCModel_rankingBaseMsg = @"msg";
NSString *const kJCModel_rankingBaseData = @"data";


@interface JCModel_rankingBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rankingBase

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
            self.result = [self objectOrNilForKey:kJCModel_rankingBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_rankingBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_rankingBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_rankingBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_rankingData = [dict objectForKey:kJCModel_rankingBaseData];
    NSMutableArray *parsedJCModel_rankingData = [NSMutableArray array];
    
    if ([receivedJCModel_rankingData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_rankingData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_rankingData addObject:[JCModel_rankingData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_rankingData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_rankingData addObject:[JCModel_rankingData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_rankingData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_rankingData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_rankingBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_rankingBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_rankingBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_rankingBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_rankingBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_rankingBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_rankingBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_rankingBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_rankingBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_rankingBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_rankingBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_rankingBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_rankingBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_rankingBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_rankingBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rankingBase *copy = [[JCModel_rankingBase alloc] init];
    
    
    
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
