//
//  JCModel_InterstIncomeAccountantInfo.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeAccountantInfo.h"


NSString *const kJCModel_InterstIncomeAccountantInfoId = @"id";
NSString *const kJCModel_InterstIncomeAccountantInfoName = @"name";
NSString *const kJCModel_InterstIncomeAccountantInfoMbPhone = @"mbPhone";


@interface JCModel_InterstIncomeAccountantInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeAccountantInfo

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
            self.accountantInfoIdentifier = [[self objectOrNilForKey:kJCModel_InterstIncomeAccountantInfoId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_InterstIncomeAccountantInfoName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_InterstIncomeAccountantInfoMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.accountantInfoIdentifier] forKey:kJCModel_InterstIncomeAccountantInfoId];
    [mutableDict setValue:self.name forKey:kJCModel_InterstIncomeAccountantInfoName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_InterstIncomeAccountantInfoMbPhone];

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

    self.accountantInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeAccountantInfoId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeAccountantInfoName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeAccountantInfoMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_accountantInfoIdentifier forKey:kJCModel_InterstIncomeAccountantInfoId];
    [aCoder encodeObject:_name forKey:kJCModel_InterstIncomeAccountantInfoName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_InterstIncomeAccountantInfoMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeAccountantInfo *copy = [[JCModel_InterstIncomeAccountantInfo alloc] init];
    
    
    
    if (copy) {

        copy.accountantInfoIdentifier = self.accountantInfoIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
