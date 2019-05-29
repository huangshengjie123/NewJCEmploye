//
//  JCModel_ReceivableOrderOrderCosts.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderOrderCosts.h"


NSString *const kJCModel_ReceivableOrderOrderCostsNum = @"num";
NSString *const kJCModel_ReceivableOrderOrderCostsId = @"id";
NSString *const kJCModel_ReceivableOrderOrderCostsItem = @"item";
NSString *const kJCModel_ReceivableOrderOrderCostsName = @"name";


@interface JCModel_ReceivableOrderOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderOrderCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_ReceivableOrderOrderCostsNum fromDictionary:dict] doubleValue];
            self.orderCostsIdentifier = [self objectOrNilForKey:kJCModel_ReceivableOrderOrderCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_ReceivableOrderOrderCostsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ReceivableOrderOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_ReceivableOrderOrderCostsNum];
    [mutableDict setValue:self.orderCostsIdentifier forKey:kJCModel_ReceivableOrderOrderCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_ReceivableOrderOrderCostsItem];
    [mutableDict setValue:self.name forKey:kJCModel_ReceivableOrderOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderOrderCostsNum];
    self.orderCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderOrderCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderOrderCostsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_ReceivableOrderOrderCostsNum];
    [aCoder encodeObject:_orderCostsIdentifier forKey:kJCModel_ReceivableOrderOrderCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_ReceivableOrderOrderCostsItem];
    [aCoder encodeObject:_name forKey:kJCModel_ReceivableOrderOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderOrderCosts *copy = [[JCModel_ReceivableOrderOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.orderCostsIdentifier = [self.orderCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
