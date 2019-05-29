//
//  JCModel_reWritePurchaserOrderPurchaserOrder.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reWritePurchaserOrderPurchaserOrder.h"
#import "JCModel_reWritePurchaserOrderPurchaserOrderCosts.h"


NSString *const kJCModel_reWritePurchaserOrderPurchaserOrderId = @"id";
NSString *const kJCModel_reWritePurchaserOrderPurchaserOrderPurchaserOrderCosts = @"purchaserOrderCosts";


@interface JCModel_reWritePurchaserOrderPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reWritePurchaserOrderPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;
@synthesize purchaserOrderCosts = _purchaserOrderCosts;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_reWritePurchaserOrderPurchaserOrderId fromDictionary:dict];
    NSObject *receivedJCModel_reWritePurchaserOrderPurchaserOrderCosts = [dict objectForKey:kJCModel_reWritePurchaserOrderPurchaserOrderPurchaserOrderCosts];
    NSMutableArray *parsedJCModel_reWritePurchaserOrderPurchaserOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_reWritePurchaserOrderPurchaserOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_reWritePurchaserOrderPurchaserOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_reWritePurchaserOrderPurchaserOrderCosts addObject:[JCModel_reWritePurchaserOrderPurchaserOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_reWritePurchaserOrderPurchaserOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_reWritePurchaserOrderPurchaserOrderCosts addObject:[JCModel_reWritePurchaserOrderPurchaserOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_reWritePurchaserOrderPurchaserOrderCosts]];
    }

    self.purchaserOrderCosts = [NSArray arrayWithArray:parsedJCModel_reWritePurchaserOrderPurchaserOrderCosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_reWritePurchaserOrderPurchaserOrderId];
    NSMutableArray *tempArrayForPurchaserOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.purchaserOrderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPurchaserOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPurchaserOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserOrderCosts] forKey:kJCModel_reWritePurchaserOrderPurchaserOrderPurchaserOrderCosts];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_reWritePurchaserOrderPurchaserOrderId];
    self.purchaserOrderCosts = [aDecoder decodeObjectForKey:kJCModel_reWritePurchaserOrderPurchaserOrderPurchaserOrderCosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_reWritePurchaserOrderPurchaserOrderId];
    [aCoder encodeObject:_purchaserOrderCosts forKey:kJCModel_reWritePurchaserOrderPurchaserOrderPurchaserOrderCosts];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reWritePurchaserOrderPurchaserOrder *copy = [[JCModel_reWritePurchaserOrderPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
        copy.purchaserOrderCosts = [self.purchaserOrderCosts copyWithZone:zone];
    }
    
    return copy;
}


@end
