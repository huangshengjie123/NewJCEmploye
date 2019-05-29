//
//  JCModel_reimbursementMgrInfo.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementMgrInfo.h"


NSString *const kJCModel_reimbursementMgrInfoId = @"id";
NSString *const kJCModel_reimbursementMgrInfoName = @"name";
NSString *const kJCModel_reimbursementMgrInfoMbPhone = @"mbPhone";


@interface JCModel_reimbursementMgrInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementMgrInfo

@synthesize mgrInfoIdentifier = _mgrInfoIdentifier;
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
            self.mgrInfoIdentifier = [[self objectOrNilForKey:kJCModel_reimbursementMgrInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_reimbursementMgrInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_reimbursementMgrInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mgrInfoIdentifier] forKey:kJCModel_reimbursementMgrInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_reimbursementMgrInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_reimbursementMgrInfoMbPhone];

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

    self.mgrInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_reimbursementMgrInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_reimbursementMgrInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_reimbursementMgrInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mgrInfoIdentifier forKey:kJCModel_reimbursementMgrInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_reimbursementMgrInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_reimbursementMgrInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementMgrInfo *copy = [[JCModel_reimbursementMgrInfo alloc] init];
    
    
    
    if (copy) {

        copy.mgrInfoIdentifier = self.mgrInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
