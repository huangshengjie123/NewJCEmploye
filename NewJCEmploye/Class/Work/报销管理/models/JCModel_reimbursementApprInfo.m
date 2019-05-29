//
//  JCModel_reimbursementApprInfo.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementApprInfo.h"


NSString *const kJCModel_reimbursementApprInfoId = @"id";
NSString *const kJCModel_reimbursementApprInfoName = @"name";
NSString *const kJCModel_reimbursementApprInfoMbPhone = @"mbPhone";


@interface JCModel_reimbursementApprInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementApprInfo

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
            self.apprInfoIdentifier = [[self objectOrNilForKey:kJCModel_reimbursementApprInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_reimbursementApprInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_reimbursementApprInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apprInfoIdentifier] forKey:kJCModel_reimbursementApprInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_reimbursementApprInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_reimbursementApprInfoMbPhone];

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

    self.apprInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_reimbursementApprInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_reimbursementApprInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_reimbursementApprInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_apprInfoIdentifier forKey:kJCModel_reimbursementApprInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_reimbursementApprInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_reimbursementApprInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementApprInfo *copy = [[JCModel_reimbursementApprInfo alloc] init];
    
    
    
    if (copy) {

        copy.apprInfoIdentifier = self.apprInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
