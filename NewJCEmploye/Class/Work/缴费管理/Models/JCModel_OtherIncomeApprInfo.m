//
//  JCModel_OtherIncomeApprInfo.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomeApprInfo.h"


NSString *const kJCModel_OtherIncomeApprInfoId = @"id";
NSString *const kJCModel_OtherIncomeApprInfoName = @"name";
NSString *const kJCModel_OtherIncomeApprInfoMbPhone = @"mbPhone";


@interface JCModel_OtherIncomeApprInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomeApprInfo

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
            self.apprInfoIdentifier = [[self objectOrNilForKey:kJCModel_OtherIncomeApprInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_OtherIncomeApprInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_OtherIncomeApprInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apprInfoIdentifier] forKey:kJCModel_OtherIncomeApprInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_OtherIncomeApprInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_OtherIncomeApprInfoMbPhone];

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

    self.apprInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomeApprInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeApprInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeApprInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_apprInfoIdentifier forKey:kJCModel_OtherIncomeApprInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_OtherIncomeApprInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_OtherIncomeApprInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomeApprInfo *copy = [[JCModel_OtherIncomeApprInfo alloc] init];
    
    
    
    if (copy) {

        copy.apprInfoIdentifier = self.apprInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
