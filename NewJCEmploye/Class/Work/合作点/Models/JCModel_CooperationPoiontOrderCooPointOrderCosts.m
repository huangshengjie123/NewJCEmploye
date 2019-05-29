//
//  JCModel_CooperationPoiontOrderCooPointOrderCosts.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderCooPointOrderCosts.h"


NSString *const kJCModel_CooperationPoiontOrderCooPointOrderCostsNum = @"num";
NSString *const kJCModel_CooperationPoiontOrderCooPointOrderCostsId = @"id";
NSString *const kJCModel_CooperationPoiontOrderCooPointOrderCostsItem = @"item";
NSString *const kJCModel_CooperationPoiontOrderCooPointOrderCostsUnit = @"unit";
NSString *const kJCModel_CooperationPoiontOrderCooPointOrderCostsName = @"name";


@interface JCModel_CooperationPoiontOrderCooPointOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderCooPointOrderCosts

@synthesize num = _num;
@synthesize cooPointOrderCostsIdentifier = _cooPointOrderCostsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsNum fromDictionary:dict] doubleValue];
            self.cooPointOrderCostsIdentifier = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsNum];
    [mutableDict setValue:self.cooPointOrderCostsIdentifier forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsNum];
    self.cooPointOrderCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsNum];
    [aCoder encodeObject:_cooPointOrderCostsIdentifier forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_CooperationPoiontOrderCooPointOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderCooPointOrderCosts *copy = [[JCModel_CooperationPoiontOrderCooPointOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.cooPointOrderCostsIdentifier = [self.cooPointOrderCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
