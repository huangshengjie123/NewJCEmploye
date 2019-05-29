//
//  JCModel_distribute_confirmPurchaserOrder.m
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_distribute_confirmPurchaserOrder.h"


NSString *const kJCModel_distribute_confirmPurchaserOrderId = @"id";


@interface JCModel_distribute_confirmPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_distribute_confirmPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_distribute_confirmPurchaserOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_distribute_confirmPurchaserOrderId];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_distribute_confirmPurchaserOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_distribute_confirmPurchaserOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_distribute_confirmPurchaserOrder *copy = [[JCModel_distribute_confirmPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
