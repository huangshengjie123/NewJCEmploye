//
//  JCModel_NewOtherIncomeBase.m
//
//  Created by   on 2019/3/9
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewOtherIncomeBase.h"


NSString *const kJCModel_NewOtherIncomeBaseType = @"type";
NSString *const kJCModel_NewOtherIncomeBaseAmount = @"amount";
NSString *const kJCModel_NewOtherIncomeBaseComment = @"comment";


@interface JCModel_NewOtherIncomeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewOtherIncomeBase

@synthesize type = _type;
@synthesize amount = _amount;
@synthesize comment = _comment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kJCModel_NewOtherIncomeBaseType fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_NewOtherIncomeBaseAmount fromDictionary:dict] doubleValue];
            self.comment = [self objectOrNilForKey:kJCModel_NewOtherIncomeBaseComment fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_NewOtherIncomeBaseType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_NewOtherIncomeBaseAmount];
    [mutableDict setValue:self.comment forKey:kJCModel_NewOtherIncomeBaseComment];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_NewOtherIncomeBaseType];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_NewOtherIncomeBaseAmount];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_NewOtherIncomeBaseComment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_NewOtherIncomeBaseType];
    [aCoder encodeDouble:_amount forKey:kJCModel_NewOtherIncomeBaseAmount];
    [aCoder encodeObject:_comment forKey:kJCModel_NewOtherIncomeBaseComment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewOtherIncomeBase *copy = [[JCModel_NewOtherIncomeBase alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.amount = self.amount;
        copy.comment = [self.comment copyWithZone:zone];
    }
    
    return copy;
}


@end
