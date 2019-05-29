//
//  JCModel_OtherIncomeAccountantInfo.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomeAccountantInfo.h"


NSString *const kJCModel_OtherIncomeAccountantInfoId = @"id";
NSString *const kJCModel_OtherIncomeAccountantInfoName = @"name";
NSString *const kJCModel_OtherIncomeAccountantInfoMbPhone = @"mbPhone";


@interface JCModel_OtherIncomeAccountantInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomeAccountantInfo

@synthesize accountantInfoIdentifier = _accountantInfoIdentifier;
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
            self.accountantInfoIdentifier = [[self objectOrNilForKey:kJCModel_OtherIncomeAccountantInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_OtherIncomeAccountantInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_OtherIncomeAccountantInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.accountantInfoIdentifier] forKey:kJCModel_OtherIncomeAccountantInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_OtherIncomeAccountantInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_OtherIncomeAccountantInfoMbPhone];

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

    self.accountantInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomeAccountantInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeAccountantInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeAccountantInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_accountantInfoIdentifier forKey:kJCModel_OtherIncomeAccountantInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_OtherIncomeAccountantInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_OtherIncomeAccountantInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomeAccountantInfo *copy = [[JCModel_OtherIncomeAccountantInfo alloc] init];
    
    
    
    if (copy) {

        copy.accountantInfoIdentifier = self.accountantInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
