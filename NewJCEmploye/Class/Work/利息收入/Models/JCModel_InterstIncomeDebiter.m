//
//  JCModel_InterstIncomeDebiter.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeDebiter.h"


NSString *const kJCModel_InterstIncomeDebiterId = @"id";
NSString *const kJCModel_InterstIncomeDebiterName = @"name";
NSString *const kJCModel_InterstIncomeDebiterMbPhone = @"mbPhone";


@interface JCModel_InterstIncomeDebiter ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeDebiter

@synthesize debiterIdentifier = _debiterIdentifier;
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
            self.debiterIdentifier = [[self objectOrNilForKey:kJCModel_InterstIncomeDebiterId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_InterstIncomeDebiterName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_InterstIncomeDebiterMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.debiterIdentifier] forKey:kJCModel_InterstIncomeDebiterId];
    [mutableDict setValue:self.name forKey:kJCModel_InterstIncomeDebiterName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_InterstIncomeDebiterMbPhone];

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

    self.debiterIdentifier = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeDebiterId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDebiterName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDebiterMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_debiterIdentifier forKey:kJCModel_InterstIncomeDebiterId];
    [aCoder encodeObject:_name forKey:kJCModel_InterstIncomeDebiterName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_InterstIncomeDebiterMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeDebiter *copy = [[JCModel_InterstIncomeDebiter alloc] init];
    
    
    
    if (copy) {

        copy.debiterIdentifier = self.debiterIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
