//
//  JCModel_NewProbationOrderJsonCosts.m
//
//  Created by   on 2018/5/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProbationOrderJsonCosts.h"


NSString *const kJCModel_NewProbationOrderJsonCostsNum = @"num";
NSString *const kJCModel_NewProbationOrderJsonCostsName = @"name";
NSString *const kJCModel_NewProbationOrderJsonCostsItem = @"item";


@interface JCModel_NewProbationOrderJsonCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProbationOrderJsonCosts

@synthesize num = _num;
@synthesize name = _name;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.num = [[self objectOrNilForKey:kJCModel_NewProbationOrderJsonCostsNum fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonCostsName fromDictionary:dict];
        self.item = [[self objectOrNilForKey:kJCModel_NewProbationOrderJsonCostsItem fromDictionary:dict] doubleValue];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_NewProbationOrderJsonCostsNum];
    [mutableDict setValue:self.name forKey:kJCModel_NewProbationOrderJsonCostsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_NewProbationOrderJsonCostsItem];

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
    self.num = [aDecoder decodeDoubleForKey:kJCModel_NewProbationOrderJsonCostsNum];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonCostsName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_NewProbationOrderJsonCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:_num forKey:kJCModel_NewProbationOrderJsonCostsNum];
    [aCoder encodeObject:_name forKey:kJCModel_NewProbationOrderJsonCostsName];
    [aCoder encodeDouble:_item forKey:kJCModel_NewProbationOrderJsonCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_NewProbationOrderJsonCosts *copy = [[JCModel_NewProbationOrderJsonCosts alloc] init];
    if (copy)
    {
        copy.num = self.num;
        copy.name = [self.name copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
