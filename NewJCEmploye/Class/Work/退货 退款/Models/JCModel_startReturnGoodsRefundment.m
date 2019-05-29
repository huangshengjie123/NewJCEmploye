//
//  JCModel_startReturnGoodsRefundment.m
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_startReturnGoodsRefundment.h"


NSString *const kJCModel_startReturnGoodsRefundmentOid = @"oid";


@interface JCModel_startReturnGoodsRefundment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_startReturnGoodsRefundment

@synthesize oid = _oid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.oid = [self objectOrNilForKey:kJCModel_startReturnGoodsRefundmentOid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.oid forKey:kJCModel_startReturnGoodsRefundmentOid];

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

    self.oid = [aDecoder decodeObjectForKey:kJCModel_startReturnGoodsRefundmentOid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_oid forKey:kJCModel_startReturnGoodsRefundmentOid];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_startReturnGoodsRefundment *copy = [[JCModel_startReturnGoodsRefundment alloc] init];
    
    
    
    if (copy) {

        copy.oid = [self.oid copyWithZone:zone];
    }
    
    return copy;
}


@end
