//
//  JCModel_inOutRewriteInOutOrder.m
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inOutRewriteInOutOrder.h"
#import "JCModel_inOutRewriteItems.h"


NSString *const kJCModel_inOutRewriteInOutOrderId = @"id";
NSString *const kJCModel_inOutRewriteInOutOrderItems = @"items";


@interface JCModel_inOutRewriteInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inOutRewriteInOutOrder

@synthesize inOutOrderIdentifier = _inOutOrderIdentifier;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inOutOrderIdentifier = [self objectOrNilForKey:kJCModel_inOutRewriteInOutOrderId fromDictionary:dict];
    NSObject *receivedJCModel_inOutRewriteItems = [dict objectForKey:kJCModel_inOutRewriteInOutOrderItems];
    NSMutableArray *parsedJCModel_inOutRewriteItems = [NSMutableArray array];
    
    if ([receivedJCModel_inOutRewriteItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_inOutRewriteItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_inOutRewriteItems addObject:[JCModel_inOutRewriteItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_inOutRewriteItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_inOutRewriteItems addObject:[JCModel_inOutRewriteItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_inOutRewriteItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_inOutRewriteItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.inOutOrderIdentifier forKey:kJCModel_inOutRewriteInOutOrderId];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_inOutRewriteInOutOrderItems];

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

    self.inOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteInOutOrderId];
    self.items = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteInOutOrderItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inOutOrderIdentifier forKey:kJCModel_inOutRewriteInOutOrderId];
    [aCoder encodeObject:_items forKey:kJCModel_inOutRewriteInOutOrderItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inOutRewriteInOutOrder *copy = [[JCModel_inOutRewriteInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.inOutOrderIdentifier = [self.inOutOrderIdentifier copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
