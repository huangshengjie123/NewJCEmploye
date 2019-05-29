//
//  JCModel_reimbursementLeaderInfo.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementLeaderInfo.h"


NSString *const kJCModel_reimbursementLeaderInfoId = @"id";
NSString *const kJCModel_reimbursementLeaderInfoName = @"name";
NSString *const kJCModel_reimbursementLeaderInfoMbPhone = @"mbPhone";


@interface JCModel_reimbursementLeaderInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementLeaderInfo

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
            self.leaderInfoIdentifier = [[self objectOrNilForKey:kJCModel_reimbursementLeaderInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_reimbursementLeaderInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_reimbursementLeaderInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leaderInfoIdentifier] forKey:kJCModel_reimbursementLeaderInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_reimbursementLeaderInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_reimbursementLeaderInfoMbPhone];

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

    self.leaderInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_reimbursementLeaderInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_reimbursementLeaderInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_reimbursementLeaderInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leaderInfoIdentifier forKey:kJCModel_reimbursementLeaderInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_reimbursementLeaderInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_reimbursementLeaderInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementLeaderInfo *copy = [[JCModel_reimbursementLeaderInfo alloc] init];
    
    
    
    if (copy) {

        copy.leaderInfoIdentifier = self.leaderInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
