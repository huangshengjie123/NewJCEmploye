//
//  JCModel_businessTripApprInfo.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripApprInfo.h"


NSString *const kJCModel_businessTripApprInfoId = @"id";
NSString *const kJCModel_businessTripApprInfoName = @"name";
NSString *const kJCModel_businessTripApprInfoMbPhone = @"mbPhone";


@interface JCModel_businessTripApprInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripApprInfo

@synthesize apprInfoIdentifier = _apprInfoIdentifier;
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
            self.apprInfoIdentifier = [[self objectOrNilForKey:kJCModel_businessTripApprInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_businessTripApprInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_businessTripApprInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apprInfoIdentifier] forKey:kJCModel_businessTripApprInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_businessTripApprInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_businessTripApprInfoMbPhone];

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

    self.apprInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_businessTripApprInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_businessTripApprInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_businessTripApprInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_apprInfoIdentifier forKey:kJCModel_businessTripApprInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_businessTripApprInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_businessTripApprInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_businessTripApprInfo *copy = [[JCModel_businessTripApprInfo alloc] init];
    
    
    
    if (copy) {

        copy.apprInfoIdentifier = self.apprInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
