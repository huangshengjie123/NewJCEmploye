//
//  JCModel_NewPayBackUpPayments.m
//
//  Created by   on 2019/1/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewPayBackUpPayments.h"


NSString *const kJCModel_NewPayBackUpPaymentsType = @"type";
NSString *const kJCModel_NewPayBackUpPaymentsAmount = @"amount";


@interface JCModel_NewPayBackUpPayments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewPayBackUpPayments

@synthesize type = _type;
@synthesize amount = _amount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kJCModel_NewPayBackUpPaymentsType fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_NewPayBackUpPaymentsAmount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_NewPayBackUpPaymentsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_NewPayBackUpPaymentsAmount];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpPaymentsType];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_NewPayBackUpPaymentsAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_NewPayBackUpPaymentsType];
    [aCoder encodeDouble:_amount forKey:kJCModel_NewPayBackUpPaymentsAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewPayBackUpPayments *copy = [[JCModel_NewPayBackUpPayments alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.amount = self.amount;
    }
    
    return copy;
}


@end
