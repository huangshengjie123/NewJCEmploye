//
//  JCModel_newPurchaserOrderPurchaserOrderCosts.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newPurchaserOrderPurchaserOrderCosts.h"


NSString *const kJCModel_newPurchaserOrderPurchaserOrderCostsNum = @"num";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderCostsItem = @"item";


@interface JCModel_newPurchaserOrderPurchaserOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newPurchaserOrderPurchaserOrderCosts

@synthesize num = _num;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_newPurchaserOrderPurchaserOrderCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_newPurchaserOrderPurchaserOrderCostsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_newPurchaserOrderPurchaserOrderCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_newPurchaserOrderPurchaserOrderCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_newPurchaserOrderPurchaserOrderCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_newPurchaserOrderPurchaserOrderCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newPurchaserOrderPurchaserOrderCosts *copy = [[JCModel_newPurchaserOrderPurchaserOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
