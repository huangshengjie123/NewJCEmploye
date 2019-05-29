//
//  JCModel_NewPayBackUpOrder.m
//
//  Created by   on 2019/1/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewPayBackUpOrder.h"
#import "JCModel_NewPayBackUpPayments.h"


NSString *const kJCModel_NewPayBackUpOrderId = @"id";
NSString *const kJCModel_NewPayBackUpOrderPayments = @"payments";


@interface JCModel_NewPayBackUpOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewPayBackUpOrder

@synthesize orderIdentifier = _orderIdentifier;
@synthesize payments = _payments;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_NewPayBackUpOrderId fromDictionary:dict];
    NSObject *receivedJCModel_NewPayBackUpPayments = [dict objectForKey:kJCModel_NewPayBackUpOrderPayments];
    NSMutableArray *parsedJCModel_NewPayBackUpPayments = [NSMutableArray array];
    
    if ([receivedJCModel_NewPayBackUpPayments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewPayBackUpPayments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewPayBackUpPayments addObject:[JCModel_NewPayBackUpPayments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewPayBackUpPayments isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewPayBackUpPayments addObject:[JCModel_NewPayBackUpPayments modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewPayBackUpPayments]];
    }

    self.payments = [NSArray arrayWithArray:parsedJCModel_NewPayBackUpPayments];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_NewPayBackUpOrderId];
    NSMutableArray *tempArrayForPayments = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.payments) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPayments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPayments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPayments] forKey:kJCModel_NewPayBackUpOrderPayments];

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

    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpOrderId];
    self.payments = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpOrderPayments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_NewPayBackUpOrderId];
    [aCoder encodeObject:_payments forKey:kJCModel_NewPayBackUpOrderPayments];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewPayBackUpOrder *copy = [[JCModel_NewPayBackUpOrder alloc] init];
    
    
    
    if (copy) {

        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.payments = [self.payments copyWithZone:zone];
    }
    
    return copy;
}


@end
