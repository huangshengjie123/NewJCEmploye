//
//  JCModel_MyFranchiserGrantOrdersOrderCosts.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersOrderCosts.h"


NSString *const kJCModel_MyFranchiserGrantOrdersOrderCostsNum = @"num";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderCostsItem = @"item";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderCostsUnit = @"unit";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderCostsName = @"name";


@interface JCModel_MyFranchiserGrantOrdersOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersOrderCosts

@synthesize num = _num;
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
            self.num = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersOrderCosts *copy = [[JCModel_MyFranchiserGrantOrdersOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
