//
//  JCModel_DistributionCarPGroupRelations.m
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionCarPGroupRelations.h"


NSString *const kJCModel_DistributionCarPGroupRelationsId = @"id";
NSString *const kJCModel_DistributionCarPGroupRelationsNumber = @"number";
NSString *const kJCModel_DistributionCarPGroupRelationsName = @"name";


@interface JCModel_DistributionCarPGroupRelations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionCarPGroupRelations

@synthesize groupRelationsIdentifier = _groupRelationsIdentifier;
@synthesize number = _number;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.groupRelationsIdentifier = [self objectOrNilForKey:kJCModel_DistributionCarPGroupRelationsId fromDictionary:dict];
            self.number = [[self objectOrNilForKey:kJCModel_DistributionCarPGroupRelationsNumber fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_DistributionCarPGroupRelationsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.groupRelationsIdentifier forKey:kJCModel_DistributionCarPGroupRelationsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_DistributionCarPGroupRelationsNumber];
    [mutableDict setValue:self.name forKey:kJCModel_DistributionCarPGroupRelationsName];

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

    self.groupRelationsIdentifier = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPGroupRelationsId];
    self.number = [aDecoder decodeDoubleForKey:kJCModel_DistributionCarPGroupRelationsNumber];
    self.name = [aDecoder decodeObjectForKey:kJCModel_DistributionCarPGroupRelationsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_groupRelationsIdentifier forKey:kJCModel_DistributionCarPGroupRelationsId];
    [aCoder encodeDouble:_number forKey:kJCModel_DistributionCarPGroupRelationsNumber];
    [aCoder encodeObject:_name forKey:kJCModel_DistributionCarPGroupRelationsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionCarPGroupRelations *copy = [[JCModel_DistributionCarPGroupRelations alloc] init];
    
    
    
    if (copy) {

        copy.groupRelationsIdentifier = [self.groupRelationsIdentifier copyWithZone:zone];
        copy.number = self.number;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
