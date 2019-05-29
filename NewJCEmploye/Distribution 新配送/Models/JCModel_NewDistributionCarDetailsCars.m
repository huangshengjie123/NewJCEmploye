//
//  JCModel_NewDistributionCarDetailsCars.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsCars.h"


NSString *const kJCModel_NewDistributionCarDetailsCarsUid = @"uid";
NSString *const kJCModel_NewDistributionCarDetailsCarsCarItems = @"carItems";
NSString *const kJCModel_NewDistributionCarDetailsCarsId = @"id";
NSString *const kJCModel_NewDistributionCarDetailsCarsPlate = @"plate";
NSString *const kJCModel_NewDistributionCarDetailsCarsOrgName = @"orgName";
NSString *const kJCModel_NewDistributionCarDetailsCarsCom = @"com";
NSString *const kJCModel_NewDistributionCarDetailsCarsName = @"name";


@interface JCModel_NewDistributionCarDetailsCars ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsCars

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
            self.uid = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsUid fromDictionary:dict] doubleValue];
            self.carItems = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsCarItems fromDictionary:dict];
            self.carsIdentifier = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsId fromDictionary:dict] doubleValue];
            self.plate = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsPlate fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsOrgName fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsCom fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCarsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_NewDistributionCarDetailsCarsUid];
    [mutableDict setValue:self.carItems forKey:kJCModel_NewDistributionCarDetailsCarsCarItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carsIdentifier] forKey:kJCModel_NewDistributionCarDetailsCarsId];
    [mutableDict setValue:self.plate forKey:kJCModel_NewDistributionCarDetailsCarsPlate];
    [mutableDict setValue:self.orgName forKey:kJCModel_NewDistributionCarDetailsCarsOrgName];
    [mutableDict setValue:self.com forKey:kJCModel_NewDistributionCarDetailsCarsCom];
    [mutableDict setValue:self.name forKey:kJCModel_NewDistributionCarDetailsCarsName];

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

    self.uid = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCarsUid];
    self.carItems = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCarsCarItems];
    self.carsIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCarsId];
    self.plate = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCarsPlate];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCarsOrgName];
    self.com = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCarsCom];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCarsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kJCModel_NewDistributionCarDetailsCarsUid];
    [aCoder encodeObject:_carItems forKey:kJCModel_NewDistributionCarDetailsCarsCarItems];
    [aCoder encodeDouble:_carsIdentifier forKey:kJCModel_NewDistributionCarDetailsCarsId];
    [aCoder encodeObject:_plate forKey:kJCModel_NewDistributionCarDetailsCarsPlate];
    [aCoder encodeObject:_orgName forKey:kJCModel_NewDistributionCarDetailsCarsOrgName];
    [aCoder encodeObject:_com forKey:kJCModel_NewDistributionCarDetailsCarsCom];
    [aCoder encodeObject:_name forKey:kJCModel_NewDistributionCarDetailsCarsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsCars *copy = [[JCModel_NewDistributionCarDetailsCars alloc] init];
    
    
    
    if (copy) {

        copy.uid = self.uid;
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
