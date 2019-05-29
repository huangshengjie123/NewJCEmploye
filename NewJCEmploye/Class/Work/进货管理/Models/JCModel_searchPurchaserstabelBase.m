//
//  JCModel_searchPurchaserstabelBase.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelBase.h"
#import "JCModel_searchPurchaserstabelData.h"


NSString *const kJCModel_searchPurchaserstabelBaseResult = @"result";
NSString *const kJCModel_searchPurchaserstabelBaseNum = @"num";
NSString *const kJCModel_searchPurchaserstabelBaseCode = @"code";
NSString *const kJCModel_searchPurchaserstabelBaseMsg = @"msg";
NSString *const kJCModel_searchPurchaserstabelBaseData = @"data";


@interface JCModel_searchPurchaserstabelBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelBase

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
            self.result = [self objectOrNilForKey:kJCModel_searchPurchaserstabelBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_searchPurchaserstabelBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_searchPurchaserstabelBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_searchPurchaserstabelBaseMsg fromDictionary:dict];
            self.data = [JCModel_searchPurchaserstabelData modelObjectWithDictionary:[dict objectForKey:kJCModel_searchPurchaserstabelBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_searchPurchaserstabelBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_searchPurchaserstabelBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_searchPurchaserstabelBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_searchPurchaserstabelBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_searchPurchaserstabelBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_searchPurchaserstabelBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_searchPurchaserstabelBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_searchPurchaserstabelBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_searchPurchaserstabelBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_searchPurchaserstabelBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelBase *copy = [[JCModel_searchPurchaserstabelBase alloc] init];
    
    
    
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
