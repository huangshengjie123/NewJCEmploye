//
//  JCModel_cancelSaleOrderOrder.m
//
//  Created by   on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_cancelSaleOrderOrder.h"


NSString *const kJCModel_cancelSaleOrderOrderId = @"id";
NSString *const kJCModel_cancelSaleOrderOrderGetamount = @"getamount";


@interface JCModel_cancelSaleOrderOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_cancelSaleOrderOrder

@synthesize orderIdentifier = _orderIdentifier;
@synthesize getamount = _getamount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_cancelSaleOrderOrderId fromDictionary:dict];
            self.getamount = [[self objectOrNilForKey:kJCModel_cancelSaleOrderOrderGetamount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_cancelSaleOrderOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_cancelSaleOrderOrderGetamount];

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

    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_cancelSaleOrderOrderId];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_cancelSaleOrderOrderGetamount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_cancelSaleOrderOrderId];
    [aCoder encodeDouble:_getamount forKey:kJCModel_cancelSaleOrderOrderGetamount];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_cancelSaleOrderOrder *copy = [[JCModel_cancelSaleOrderOrder alloc] init];
    
    
    
    if (copy) {

        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.getamount = self.getamount;
    }
    
    return copy;
}


@end
