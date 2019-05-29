//
//  JCModel_GetItemPriceBase.m
//
//  Created by   on 2018/11/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetItemPriceBase.h"
#import "JCModel_GetItemPriceData.h"


NSString *const kJCModel_GetItemPriceBaseResult = @"result";
NSString *const kJCModel_GetItemPriceBaseNum = @"num";
NSString *const kJCModel_GetItemPriceBaseCode = @"code";
NSString *const kJCModel_GetItemPriceBaseMsg = @"msg";
NSString *const kJCModel_GetItemPriceBaseData = @"data";


@interface JCModel_GetItemPriceBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetItemPriceBase

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
            self.result = [self objectOrNilForKey:kJCModel_GetItemPriceBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_GetItemPriceBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_GetItemPriceBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_GetItemPriceBaseMsg fromDictionary:dict];
            self.data = [JCModel_GetItemPriceData modelObjectWithDictionary:[dict objectForKey:kJCModel_GetItemPriceBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_GetItemPriceBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_GetItemPriceBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_GetItemPriceBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_GetItemPriceBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_GetItemPriceBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_GetItemPriceBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_GetItemPriceBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_GetItemPriceBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_GetItemPriceBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_GetItemPriceBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetItemPriceBase *copy = [[JCModel_GetItemPriceBase alloc] init];
    
    
    
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
