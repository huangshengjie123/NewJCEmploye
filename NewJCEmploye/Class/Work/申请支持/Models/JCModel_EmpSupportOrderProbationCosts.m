//
//  JCModel_EmpSupportOrderProbationCosts.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderProbationCosts.h"


NSString *const kJCModel_EmpSupportOrderProbationCostsNum = @"num";
NSString *const kJCModel_EmpSupportOrderProbationCostsId = @"id";
NSString *const kJCModel_EmpSupportOrderProbationCostsItem = @"item";
NSString *const kJCModel_EmpSupportOrderProbationCostsUnit = @"unit";
NSString *const kJCModel_EmpSupportOrderProbationCostsName = @"name";


@interface JCModel_EmpSupportOrderProbationCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderProbationCosts

@synthesize num = _num;
@synthesize probationCostsIdentifier = _probationCostsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_EmpSupportOrderProbationCostsNum fromDictionary:dict] doubleValue];
            self.probationCostsIdentifier = [self objectOrNilForKey:kJCModel_EmpSupportOrderProbationCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_EmpSupportOrderProbationCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_EmpSupportOrderProbationCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderProbationCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_EmpSupportOrderProbationCostsNum];
    [mutableDict setValue:self.probationCostsIdentifier forKey:kJCModel_EmpSupportOrderProbationCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_EmpSupportOrderProbationCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_EmpSupportOrderProbationCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderProbationCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderProbationCostsNum];
    self.probationCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderProbationCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderProbationCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderProbationCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderProbationCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_EmpSupportOrderProbationCostsNum];
    [aCoder encodeObject:_probationCostsIdentifier forKey:kJCModel_EmpSupportOrderProbationCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_EmpSupportOrderProbationCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_EmpSupportOrderProbationCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderProbationCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderProbationCosts *copy = [[JCModel_EmpSupportOrderProbationCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.probationCostsIdentifier = [self.probationCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
