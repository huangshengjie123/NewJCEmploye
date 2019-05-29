//
//  JCModel_BranchApprovalPurchaserOrder.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BranchApprovalPurchaserOrder.h"


NSString *const kJCModel_BranchApprovalPurchaserOrderId = @"id";
NSString *const kJCModel_BranchApprovalPurchaserOrderInStoreHouseId = @"inStoreHouseId";


@interface JCModel_BranchApprovalPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BranchApprovalPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;
@synthesize inStoreHouseId = _inStoreHouseId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_BranchApprovalPurchaserOrderId fromDictionary:dict];
            self.inStoreHouseId = [self objectOrNilForKey:kJCModel_BranchApprovalPurchaserOrderInStoreHouseId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_BranchApprovalPurchaserOrderId];
    [mutableDict setValue:self.inStoreHouseId forKey:kJCModel_BranchApprovalPurchaserOrderInStoreHouseId];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_BranchApprovalPurchaserOrderId];
    self.inStoreHouseId = [aDecoder decodeObjectForKey:kJCModel_BranchApprovalPurchaserOrderInStoreHouseId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_BranchApprovalPurchaserOrderId];
    [aCoder encodeObject:_inStoreHouseId forKey:kJCModel_BranchApprovalPurchaserOrderInStoreHouseId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BranchApprovalPurchaserOrder *copy = [[JCModel_BranchApprovalPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
        copy.inStoreHouseId = [self.inStoreHouseId copyWithZone:zone];
    }
    
    return copy;
}


@end
