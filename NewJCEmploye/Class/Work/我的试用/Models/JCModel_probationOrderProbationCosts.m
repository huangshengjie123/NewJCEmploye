//
//  JCModel_probationOrderProbationCosts.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderProbationCosts.h"


NSString *const kJCModel_probationOrderProbationCostsNum = @"num";
NSString *const kJCModel_probationOrderProbationCostsId = @"id";
NSString *const kJCModel_probationOrderProbationCostsItem = @"item";
NSString *const kJCModel_probationOrderProbationCostsName = @"name";


@interface JCModel_probationOrderProbationCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderProbationCosts

@synthesize num = _num;
@synthesize probationCostsIdentifier = _probationCostsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_probationOrderProbationCostsNum fromDictionary:dict] doubleValue];
            self.probationCostsIdentifier = [self objectOrNilForKey:kJCModel_probationOrderProbationCostsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_probationOrderProbationCostsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_probationOrderProbationCostsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_probationOrderProbationCostsNum];
    [mutableDict setValue:self.probationCostsIdentifier forKey:kJCModel_probationOrderProbationCostsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_probationOrderProbationCostsItem];
    [mutableDict setValue:self.name forKey:kJCModel_probationOrderProbationCostsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_probationOrderProbationCostsNum];
    self.probationCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_probationOrderProbationCostsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_probationOrderProbationCostsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_probationOrderProbationCostsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_probationOrderProbationCostsNum];
    [aCoder encodeObject:_probationCostsIdentifier forKey:kJCModel_probationOrderProbationCostsId];
    [aCoder encodeDouble:_item forKey:kJCModel_probationOrderProbationCostsItem];
    [aCoder encodeObject:_name forKey:kJCModel_probationOrderProbationCostsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderProbationCosts *copy = [[JCModel_probationOrderProbationCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.probationCostsIdentifier = [self.probationCostsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
