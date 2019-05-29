//
//  JCModel_InterstIncomeCrediter.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeCrediter.h"


NSString *const kJCModel_InterstIncomeCrediterId = @"id";
NSString *const kJCModel_InterstIncomeCrediterName = @"name";
NSString *const kJCModel_InterstIncomeCrediterMbPhone = @"mbPhone";


@interface JCModel_InterstIncomeCrediter ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeCrediter

@synthesize crediterIdentifier = _crediterIdentifier;
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
            self.crediterIdentifier = [[self objectOrNilForKey:kJCModel_InterstIncomeCrediterId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_InterstIncomeCrediterName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_InterstIncomeCrediterMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.crediterIdentifier] forKey:kJCModel_InterstIncomeCrediterId];
    [mutableDict setValue:self.name forKey:kJCModel_InterstIncomeCrediterName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_InterstIncomeCrediterMbPhone];

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

    self.crediterIdentifier = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeCrediterId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeCrediterName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeCrediterMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_crediterIdentifier forKey:kJCModel_InterstIncomeCrediterId];
    [aCoder encodeObject:_name forKey:kJCModel_InterstIncomeCrediterName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_InterstIncomeCrediterMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeCrediter *copy = [[JCModel_InterstIncomeCrediter alloc] init];
    
    
    
    if (copy) {

        copy.crediterIdentifier = self.crediterIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
