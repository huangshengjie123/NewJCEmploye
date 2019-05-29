//
//  JCModel_distribute_checkPurchaserOrder.m
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_distribute_checkPurchaserOrder.h"


NSString *const kJCModel_distribute_checkPurchaserOrderId = @"id";
NSString *const kJCModel_distribute_checkPurchaserOrderDistributer = @"distributer";
NSString *const kJCModel_distribute_checkPurchaserOrderStoreHouseId = @"storeHouseId";


@interface JCModel_distribute_checkPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_distribute_checkPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;
@synthesize distributer = _distributer;
@synthesize storeHouseId = _storeHouseId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_distribute_checkPurchaserOrderId fromDictionary:dict];
            self.distributer = [self objectOrNilForKey:kJCModel_distribute_checkPurchaserOrderDistributer fromDictionary:dict];
            self.storeHouseId = [self objectOrNilForKey:kJCModel_distribute_checkPurchaserOrderStoreHouseId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_distribute_checkPurchaserOrderId];
    [mutableDict setValue:self.distributer forKey:kJCModel_distribute_checkPurchaserOrderDistributer];
    [mutableDict setValue:self.storeHouseId forKey:kJCModel_distribute_checkPurchaserOrderStoreHouseId];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_distribute_checkPurchaserOrderId];
    self.distributer = [aDecoder decodeObjectForKey:kJCModel_distribute_checkPurchaserOrderDistributer];
    self.storeHouseId = [aDecoder decodeObjectForKey:kJCModel_distribute_checkPurchaserOrderStoreHouseId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_distribute_checkPurchaserOrderId];
    [aCoder encodeObject:_distributer forKey:kJCModel_distribute_checkPurchaserOrderDistributer];
    [aCoder encodeObject:_storeHouseId forKey:kJCModel_distribute_checkPurchaserOrderStoreHouseId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_distribute_checkPurchaserOrder *copy = [[JCModel_distribute_checkPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
        copy.distributer = [self.distributer copyWithZone:zone];
        copy.storeHouseId = [self.storeHouseId copyWithZone:zone];
    }
    
    return copy;
}


@end
