//
//  JCModel_PurchasersBase.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PurchasersBase.h"
#import "JCModel_PurchasersData.h"


NSString *const kJCModel_PurchasersBaseResult = @"result";
NSString *const kJCModel_PurchasersBaseNum = @"num";
NSString *const kJCModel_PurchasersBaseCode = @"code";
NSString *const kJCModel_PurchasersBaseMsg = @"msg";
NSString *const kJCModel_PurchasersBaseData = @"data";


@interface JCModel_PurchasersBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PurchasersBase

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
            self.result = [self objectOrNilForKey:kJCModel_PurchasersBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_PurchasersBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_PurchasersBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_PurchasersBaseMsg fromDictionary:dict];
            self.data = [JCModel_PurchasersData modelObjectWithDictionary:[dict objectForKey:kJCModel_PurchasersBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_PurchasersBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_PurchasersBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_PurchasersBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_PurchasersBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_PurchasersBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_PurchasersBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_PurchasersBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_PurchasersBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_PurchasersBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_PurchasersBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_PurchasersBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_PurchasersBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_PurchasersBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_PurchasersBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_PurchasersBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PurchasersBase *copy = [[JCModel_PurchasersBase alloc] init];
    
    
    
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
