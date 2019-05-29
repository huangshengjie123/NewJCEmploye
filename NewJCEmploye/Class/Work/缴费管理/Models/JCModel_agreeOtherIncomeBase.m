//
//  JCModel_agreeOtherIncomeBase.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_agreeOtherIncomeBase.h"


NSString *const kJCModel_agreeOtherIncomeBaseId = @"id";
NSString *const kJCModel_agreeOtherIncomeBasePayment = @"payment";
NSString *const kJCModel_agreeOtherIncomeBaseComment = @"comment";


@interface JCModel_agreeOtherIncomeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_agreeOtherIncomeBase

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize payment = _payment;
@synthesize comment = _comment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kJCModel_agreeOtherIncomeBaseId fromDictionary:dict];
            self.payment = [self objectOrNilForKey:kJCModel_agreeOtherIncomeBasePayment fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_agreeOtherIncomeBaseComment fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kJCModel_agreeOtherIncomeBaseId];
    [mutableDict setValue:self.payment forKey:kJCModel_agreeOtherIncomeBasePayment];
    [mutableDict setValue:self.comment forKey:kJCModel_agreeOtherIncomeBaseComment];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kJCModel_agreeOtherIncomeBaseId];
    self.payment = [aDecoder decodeObjectForKey:kJCModel_agreeOtherIncomeBasePayment];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_agreeOtherIncomeBaseComment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kJCModel_agreeOtherIncomeBaseId];
    [aCoder encodeObject:_payment forKey:kJCModel_agreeOtherIncomeBasePayment];
    [aCoder encodeObject:_comment forKey:kJCModel_agreeOtherIncomeBaseComment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_agreeOtherIncomeBase *copy = [[JCModel_agreeOtherIncomeBase alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.payment = [self.payment copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
    }
    
    return copy;
}


@end
