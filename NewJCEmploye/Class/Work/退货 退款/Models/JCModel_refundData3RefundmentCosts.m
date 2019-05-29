//
//  JCModel_refundData3RefundmentCosts.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3RefundmentCosts.h"


NSString *const kJCModel_refundData3RefundmentCostsUnit = @"unit";
NSString *const kJCModel_refundData3RefundmentCostsNum = @"num";
NSString *const kJCModel_refundData3RefundmentCostsId = @"id";
NSString *const kJCModel_refundData3RefundmentCostsName = @"name";
NSString *const kJCModel_refundData3RefundmentCostsPrice = @"price";
NSString *const kJCModel_refundData3RefundmentCostsItem = @"item";


@interface JCModel_refundData3RefundmentCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3RefundmentCosts

@synthesize unit = _unit;
@synthesize num = _num;
@synthesize refundmentCostsIdentifier = _refundmentCostsIdentifier;
@synthesize name = _name;
@synthesize price = _price;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.unit = [[self objectOrNilForKey:kJCModel_refundData3RefundmentCostsUnit fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kJCModel_refundData3RefundmentCostsNum fromDictionary:dict] doubleValue];
            self.refundmentCostsIdentifier = [self objectOrNilForKey:kJCModel_refundData3RefundmentCostsId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_refundData3RefundmentCostsName fromDictionary:dict];
            self.price = [self objectOrNilForKey:kJCModel_refundData3RefundmentCostsPrice fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_refundData3RefundmentCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_refundData3RefundmentCostsUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_refundData3RefundmentCostsNum];
    [mutableDict setValue:self.refundmentCostsIdentifier forKey:kJCModel_refundData3RefundmentCostsId];
    [mutableDict setValue:self.name forKey:kJCModel_refundData3RefundmentCostsName];
    [mutableDict setValue:self.price forKey:kJCModel_refundData3RefundmentCostsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_refundData3RefundmentCostsItem];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCModel_refundData3RefundmentCostsUnit];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_refundData3RefundmentCostsNum];
    self.refundmentCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_refundData3RefundmentCostsId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_refundData3RefundmentCostsName];
    self.price = [aDecoder decodeObjectForKey:kJCModel_refundData3RefundmentCostsPrice];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_refundData3RefundmentCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCModel_refundData3RefundmentCostsUnit];
    [aCoder encodeDouble:_num forKey:kJCModel_refundData3RefundmentCostsNum];
    [aCoder encodeObject:_refundmentCostsIdentifier forKey:kJCModel_refundData3RefundmentCostsId];
    [aCoder encodeObject:_name forKey:kJCModel_refundData3RefundmentCostsName];
    [aCoder encodeObject:_price forKey:kJCModel_refundData3RefundmentCostsPrice];
    [aCoder encodeDouble:_item forKey:kJCModel_refundData3RefundmentCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3RefundmentCosts *copy = [[JCModel_refundData3RefundmentCosts alloc] init];
    
    
    
    if (copy) {

        copy.unit = self.unit;
        copy.num = self.num;
        copy.refundmentCostsIdentifier = [self.refundmentCostsIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
