//
//  JCModel_businessTripLeaderInfo.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripLeaderInfo.h"


NSString *const kJCModel_businessTripLeaderInfoId = @"id";
NSString *const kJCModel_businessTripLeaderInfoName = @"name";
NSString *const kJCModel_businessTripLeaderInfoMbPhone = @"mbPhone";


@interface JCModel_businessTripLeaderInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripLeaderInfo

@synthesize leaderInfoIdentifier = _leaderInfoIdentifier;
@synthesize name = _name;
@synthesize mbPhone = _mbPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.leaderInfoIdentifier = [[self objectOrNilForKey:kJCModel_businessTripLeaderInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_businessTripLeaderInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_businessTripLeaderInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leaderInfoIdentifier] forKey:kJCModel_businessTripLeaderInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_businessTripLeaderInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_businessTripLeaderInfoMbPhone];

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

    self.leaderInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_businessTripLeaderInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_businessTripLeaderInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_businessTripLeaderInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leaderInfoIdentifier forKey:kJCModel_businessTripLeaderInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_businessTripLeaderInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_businessTripLeaderInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_businessTripLeaderInfo *copy = [[JCModel_businessTripLeaderInfo alloc] init];
    
    
    
    if (copy) {

        copy.leaderInfoIdentifier = self.leaderInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
