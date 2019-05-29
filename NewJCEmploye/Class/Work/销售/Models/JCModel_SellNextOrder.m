//
//  JCModel_SellNextOrder.m
//
//  Created by   on 2018/6/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellNextOrder.h"


NSString *const kJCModel_SellNextOrderId = @"id";
NSString *const kJCModel_SellNextOrderType = @"type";


@interface JCModel_SellNextOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellNextOrder

@synthesize orderIdentifier = _orderIdentifier;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_SellNextOrderId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_SellNextOrderType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_SellNextOrderId];
    [mutableDict setValue:self.type forKey:kJCModel_SellNextOrderType];

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

    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_SellNextOrderId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_SellNextOrderType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_SellNextOrderId];
    [aCoder encodeObject:_type forKey:kJCModel_SellNextOrderType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellNextOrder *copy = [[JCModel_SellNextOrder alloc] init];
    
    
    
    if (copy) {

        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
