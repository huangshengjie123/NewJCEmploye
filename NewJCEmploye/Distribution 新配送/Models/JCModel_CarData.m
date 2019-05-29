//
//  JCModel_CarData.m
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CarData.h"


NSString *const kJCModel_CarDataUid = @"uid";
NSString *const kJCModel_CarDataCarItems = @"carItems";
NSString *const kJCModel_CarDataId = @"id";
NSString *const kJCModel_CarDataPlate = @"plate";
NSString *const kJCModel_CarDataOrgName = @"orgName";
NSString *const kJCModel_CarDataCom = @"com";
NSString *const kJCModel_CarDataName = @"name";


@interface JCModel_CarData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CarData

@synthesize uid = _uid;
@synthesize carItems = _carItems;
@synthesize dataIdentifier = _dataIdentifier;
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
            self.uid = [self objectOrNilForKey:kJCModel_CarDataUid fromDictionary:dict];
            self.carItems = [self objectOrNilForKey:kJCModel_CarDataCarItems fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_CarDataId fromDictionary:dict] doubleValue];
            self.plate = [self objectOrNilForKey:kJCModel_CarDataPlate fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_CarDataOrgName fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_CarDataCom fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_CarDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.uid forKey:kJCModel_CarDataUid];
    [mutableDict setValue:self.carItems forKey:kJCModel_CarDataCarItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_CarDataId];
    [mutableDict setValue:self.plate forKey:kJCModel_CarDataPlate];
    [mutableDict setValue:self.orgName forKey:kJCModel_CarDataOrgName];
    [mutableDict setValue:self.com forKey:kJCModel_CarDataCom];
    [mutableDict setValue:self.name forKey:kJCModel_CarDataName];

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

    self.uid = [aDecoder decodeObjectForKey:kJCModel_CarDataUid];
    self.carItems = [aDecoder decodeObjectForKey:kJCModel_CarDataCarItems];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CarDataId];
    self.plate = [aDecoder decodeObjectForKey:kJCModel_CarDataPlate];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_CarDataOrgName];
    self.com = [aDecoder decodeObjectForKey:kJCModel_CarDataCom];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CarDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_uid forKey:kJCModel_CarDataUid];
    [aCoder encodeObject:_carItems forKey:kJCModel_CarDataCarItems];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_CarDataId];
    [aCoder encodeObject:_plate forKey:kJCModel_CarDataPlate];
    [aCoder encodeObject:_orgName forKey:kJCModel_CarDataOrgName];
    [aCoder encodeObject:_com forKey:kJCModel_CarDataCom];
    [aCoder encodeObject:_name forKey:kJCModel_CarDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CarData *copy = [[JCModel_CarData alloc] init];
    
    
    
    if (copy) {

        copy.uid = [self.uid copyWithZone:zone];
        copy.carItems = [self.carItems copyWithZone:zone];
        copy.dataIdentifier = self.dataIdentifier;
        copy.plate = [self.plate copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
