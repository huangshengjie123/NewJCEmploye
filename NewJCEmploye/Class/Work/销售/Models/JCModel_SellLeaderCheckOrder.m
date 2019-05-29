//
//  JCModel_SellLeaderCheckOrder.m
//
//  Created by   on 2018/7/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellLeaderCheckOrder.h"


NSString *const kJCModel_SellLeaderCheckOrderId = @"id";


@interface JCModel_SellLeaderCheckOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellLeaderCheckOrder

@synthesize orderIdentifier = _orderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_SellLeaderCheckOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_SellLeaderCheckOrderId];

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

    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_SellLeaderCheckOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_SellLeaderCheckOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellLeaderCheckOrder *copy = [[JCModel_SellLeaderCheckOrder alloc] init];
    
    
    
    if (copy) {

        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
