//
//  JCModel_salesReturnRefundmentCosts.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnRefundmentCosts.h"


NSString *const kJCModel_salesReturnRefundmentCostsNum = @"num";
NSString *const kJCModel_salesReturnRefundmentCostsId = @"id";
NSString *const kJCModel_salesReturnRefundmentCostsItem = @"item";
NSString *const kJCModel_salesReturnRefundmentCostsUnit = @"unit";
NSString *const kJCModel_salesReturnRefundmentCostsName = @"name";


@interface JCModel_salesReturnRefundmentCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnRefundmentCosts

@synthesize num = _num;
@synthesize refundmentCostsIdentifier = _refundmentCostsIdentifier;
@synthesize item = _item;
@synthesize unit = _unit;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_salesReturnRefundmentCostsNum fromDictionary:dict] doubleValue];
            self.refundmentCostsIdentifier = [self objectOrNilForKey:kJCModel_salesReturnRefundmentCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_salesReturnRefundmentCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_salesReturnRefundmentCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_salesReturnRefundmentCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_salesReturnRefundmentCostsNum];
    [mutableDict setValue:self.refundmentCostsIdentifier forKey:kJCModel_salesReturnRefundmentCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_salesReturnRefundmentCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_salesReturnRefundmentCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_salesReturnRefundmentCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_salesReturnRefundmentCostsNum];
    self.refundmentCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_salesReturnRefundmentCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_salesReturnRefundmentCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_salesReturnRefundmentCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_salesReturnRefundmentCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_salesReturnRefundmentCostsNum];
    [aCoder encodeObject:_refundmentCostsIdentifier forKey:kJCModel_salesReturnRefundmentCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_salesReturnRefundmentCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_salesReturnRefundmentCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_salesReturnRefundmentCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnRefundmentCosts *copy = [[JCModel_salesReturnRefundmentCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.refundmentCostsIdentifier = [self.refundmentCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
