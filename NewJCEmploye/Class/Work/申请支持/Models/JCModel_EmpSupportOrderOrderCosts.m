//
//  JCModel_EmpSupportOrderOrderCosts.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderOrderCosts.h"


NSString *const kJCModel_EmpSupportOrderOrderCostsNum = @"num";
NSString *const kJCModel_EmpSupportOrderOrderCostsItem = @"item";
NSString *const kJCModel_EmpSupportOrderOrderCostsUnit = @"unit";
NSString *const kJCModel_EmpSupportOrderOrderCostsName = @"name";


@interface JCModel_EmpSupportOrderOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderOrderCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderCostsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderOrderCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_EmpSupportOrderOrderCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_EmpSupportOrderOrderCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_EmpSupportOrderOrderCostsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderOrderCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderCostsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderOrderCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_EmpSupportOrderOrderCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_EmpSupportOrderOrderCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_EmpSupportOrderOrderCostsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderOrderCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderOrderCosts *copy = [[JCModel_EmpSupportOrderOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
