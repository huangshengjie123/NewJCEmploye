//
//  JCModel_SellOrderOrderCosts.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderOrderCosts.h"


NSString *const kJCModel_SellOrderOrderCostsNum = @"num";
NSString *const kJCModel_SellOrderOrderCostsId = @"id";
NSString *const kJCModel_SellOrderOrderCostsItem = @"item";
NSString *const kJCModel_SellOrderOrderCostsName = @"name";


@interface JCModel_SellOrderOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderOrderCosts

@synthesize num = _num;
@synthesize orderCostsIdentifier = _orderCostsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_SellOrderOrderCostsNum fromDictionary:dict] doubleValue];
            self.orderCostsIdentifier = [self objectOrNilForKey:kJCModel_SellOrderOrderCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_SellOrderOrderCostsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_SellOrderOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_SellOrderOrderCostsNum];
    [mutableDict setValue:self.orderCostsIdentifier forKey:kJCModel_SellOrderOrderCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_SellOrderOrderCostsItem];
    [mutableDict setValue:self.name forKey:kJCModel_SellOrderOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_SellOrderOrderCostsNum];
    self.orderCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_SellOrderOrderCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_SellOrderOrderCostsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_SellOrderOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_SellOrderOrderCostsNum];
    [aCoder encodeObject:_orderCostsIdentifier forKey:kJCModel_SellOrderOrderCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_SellOrderOrderCostsItem];
    [aCoder encodeObject:_name forKey:kJCModel_SellOrderOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderOrderCosts *copy = [[JCModel_SellOrderOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.orderCostsIdentifier = [self.orderCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
