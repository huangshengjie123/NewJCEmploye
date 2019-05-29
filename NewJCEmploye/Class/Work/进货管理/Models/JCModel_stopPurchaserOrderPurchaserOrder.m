//
//  JCModel_stopPurchaserOrderPurchaserOrder.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_stopPurchaserOrderPurchaserOrder.h"


NSString *const kJCModel_stopPurchaserOrderPurchaserOrderId = @"id";


@interface JCModel_stopPurchaserOrderPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_stopPurchaserOrderPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_stopPurchaserOrderPurchaserOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_stopPurchaserOrderPurchaserOrderId];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_stopPurchaserOrderPurchaserOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_stopPurchaserOrderPurchaserOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_stopPurchaserOrderPurchaserOrder *copy = [[JCModel_stopPurchaserOrderPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
