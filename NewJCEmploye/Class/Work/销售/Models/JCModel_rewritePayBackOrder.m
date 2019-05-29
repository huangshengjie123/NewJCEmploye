//
//  JCModel_rewritePayBackOrder.m
//
//  Created by   on 2018/6/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rewritePayBackOrder.h"


NSString *const kJCModel_rewritePayBackOrderId = @"id";
NSString *const kJCModel_rewritePayBackOrderGetamount = @"getamount";


@interface JCModel_rewritePayBackOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rewritePayBackOrder

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
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_rewritePayBackOrderId fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_rewritePayBackOrderGetamount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_rewritePayBackOrderId];
    [mutableDict setValue:self.getamount forKey:kJCModel_rewritePayBackOrderGetamount];

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

    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_rewritePayBackOrderId];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_rewritePayBackOrderGetamount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_rewritePayBackOrderId];
    [aCoder encodeObject:_getamount forKey:kJCModel_rewritePayBackOrderGetamount];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rewritePayBackOrder *copy = [[JCModel_rewritePayBackOrder alloc] init];
    
    
    
    if (copy) {

        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.getamount = [self.getamount copyWithZone:zone];
    }
    
    return copy;
}


@end
