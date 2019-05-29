//
//  JCModel_MyFranchiserGrantOrdersProbationCosts.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersProbationCosts.h"


NSString *const kJCModel_MyFranchiserGrantOrdersProbationCostsNum = @"num";
NSString *const kJCModel_MyFranchiserGrantOrdersProbationCostsId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersProbationCostsItem = @"item";
NSString *const kJCModel_MyFranchiserGrantOrdersProbationCostsUnit = @"unit";
NSString *const kJCModel_MyFranchiserGrantOrdersProbationCostsName = @"name";


@interface JCModel_MyFranchiserGrantOrdersProbationCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersProbationCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsNum fromDictionary:dict] doubleValue];
            self.probationCostsIdentifier = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsNum];
    [mutableDict setValue:self.probationCostsIdentifier forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsNum];
    self.probationCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersProbationCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsNum];
    [aCoder encodeObject:_probationCostsIdentifier forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersProbationCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersProbationCosts *copy = [[JCModel_MyFranchiserGrantOrdersProbationCosts alloc] init];
    
    
    
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
