//
//  JCModel_NewDostribution1Cars.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1Cars.h"


NSString *const kJCModel_NewDostribution1CarsUid = @"uid";
NSString *const kJCModel_NewDostribution1CarsCarItems = @"carItems";
NSString *const kJCModel_NewDostribution1CarsId = @"id";
NSString *const kJCModel_NewDostribution1CarsPlate = @"plate";
NSString *const kJCModel_NewDostribution1CarsOrgName = @"orgName";
NSString *const kJCModel_NewDostribution1CarsCom = @"com";
NSString *const kJCModel_NewDostribution1CarsName = @"name";


@interface JCModel_NewDostribution1Cars ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1Cars

@synthesize uid = _uid;
@synthesize carItems = _carItems;
@synthesize carsIdentifier = _carsIdentifier;
@synthesize plate = _plate;
@synthesize orgName = _orgName;
@synthesize com = _com;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.uid = [self objectOrNilForKey:kJCModel_NewDostribution1CarsUid fromDictionary:dict];
            self.carItems = [self objectOrNilForKey:kJCModel_NewDostribution1CarsCarItems fromDictionary:dict];
            self.carsIdentifier = [[self objectOrNilForKey:kJCModel_NewDostribution1CarsId fromDictionary:dict] doubleValue];
            self.plate = [self objectOrNilForKey:kJCModel_NewDostribution1CarsPlate fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_NewDostribution1CarsOrgName fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_NewDostribution1CarsCom fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewDostribution1CarsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.uid forKey:kJCModel_NewDostribution1CarsUid];
    [mutableDict setValue:self.carItems forKey:kJCModel_NewDostribution1CarsCarItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carsIdentifier] forKey:kJCModel_NewDostribution1CarsId];
    [mutableDict setValue:self.plate forKey:kJCModel_NewDostribution1CarsPlate];
    [mutableDict setValue:self.orgName forKey:kJCModel_NewDostribution1CarsOrgName];
    [mutableDict setValue:self.com forKey:kJCModel_NewDostribution1CarsCom];
    [mutableDict setValue:self.name forKey:kJCModel_NewDostribution1CarsName];

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

    self.uid = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsUid];
    self.carItems = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsCarItems];
    self.carsIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1CarsId];
    self.plate = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsPlate];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsOrgName];
    self.com = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsCom];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CarsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_uid forKey:kJCModel_NewDostribution1CarsUid];
    [aCoder encodeObject:_carItems forKey:kJCModel_NewDostribution1CarsCarItems];
    [aCoder encodeDouble:_carsIdentifier forKey:kJCModel_NewDostribution1CarsId];
    [aCoder encodeObject:_plate forKey:kJCModel_NewDostribution1CarsPlate];
    [aCoder encodeObject:_orgName forKey:kJCModel_NewDostribution1CarsOrgName];
    [aCoder encodeObject:_com forKey:kJCModel_NewDostribution1CarsCom];
    [aCoder encodeObject:_name forKey:kJCModel_NewDostribution1CarsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1Cars *copy = [[JCModel_NewDostribution1Cars alloc] init];
    
    
    
    if (copy) {

        copy.uid = [self.uid copyWithZone:zone];
        copy.carItems = [self.carItems copyWithZone:zone];
        copy.carsIdentifier = self.carsIdentifier;
        copy.plate = [self.plate copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
