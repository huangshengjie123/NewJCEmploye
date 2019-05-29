//
//  JCModel_searchPurchaserstabelPurchaserOrderCosts.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelPurchaserOrderCosts.h"


NSString *const kJCModel_searchPurchaserstabelPurchaserOrderCostsNum = @"num";
NSString *const kJCModel_searchPurchaserstabelPurchaserOrderCostsId = @"id";
NSString *const kJCModel_searchPurchaserstabelPurchaserOrderCostsItem = @"item";
NSString *const kJCModel_searchPurchaserstabelPurchaserOrderCostsName = @"name";


@interface JCModel_searchPurchaserstabelPurchaserOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelPurchaserOrderCosts

@synthesize num = _num;
@synthesize purchaserOrderCostsIdentifier = _purchaserOrderCostsIdentifier;
@synthesize item = _item;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsNum fromDictionary:dict] doubleValue];
            self.purchaserOrderCostsIdentifier = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsNum];
    [mutableDict setValue:self.purchaserOrderCostsIdentifier forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsItem];
    [mutableDict setValue:self.name forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsNum];
    self.purchaserOrderCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsNum];
    [aCoder encodeObject:_purchaserOrderCostsIdentifier forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsItem];
    [aCoder encodeObject:_name forKey:kJCModel_searchPurchaserstabelPurchaserOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelPurchaserOrderCosts *copy = [[JCModel_searchPurchaserstabelPurchaserOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.purchaserOrderCostsIdentifier = [self.purchaserOrderCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
