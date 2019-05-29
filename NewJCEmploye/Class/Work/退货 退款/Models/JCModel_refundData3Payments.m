//
//  JCModel_refundData3Payments.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3Payments.h"


NSString *const kJCModel_refundData3PaymentsOid = @"oid";
NSString *const kJCModel_refundData3PaymentsType = @"type";
NSString *const kJCModel_refundData3PaymentsAmount = @"amount";


@interface JCModel_refundData3Payments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3Payments

@synthesize oid = _oid;
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
            self.oid = [self objectOrNilForKey:kJCModel_refundData3PaymentsOid fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_refundData3PaymentsType fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_refundData3PaymentsAmount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.oid forKey:kJCModel_refundData3PaymentsOid];
    [mutableDict setValue:self.type forKey:kJCModel_refundData3PaymentsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_refundData3PaymentsAmount];

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

    self.oid = [aDecoder decodeObjectForKey:kJCModel_refundData3PaymentsOid];
    self.type = [aDecoder decodeObjectForKey:kJCModel_refundData3PaymentsType];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_refundData3PaymentsAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_oid forKey:kJCModel_refundData3PaymentsOid];
    [aCoder encodeObject:_type forKey:kJCModel_refundData3PaymentsType];
    [aCoder encodeDouble:_amount forKey:kJCModel_refundData3PaymentsAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3Payments *copy = [[JCModel_refundData3Payments alloc] init];
    
    
    
    if (copy) {

        copy.oid = [self.oid copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.amount = self.amount;
    }
    
    return copy;
}


@end
