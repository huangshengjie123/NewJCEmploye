//
//  JCModel_createCooPointOrderCooPointOrder.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createCooPointOrderCooPointOrder.h"
#import "JCModel_createCooPointOrderCooPointOrderCosts.h"
#import "JCModel_createCooPointOrderItems.h"


NSString *const kJCModel_createCooPointOrderCooPointOrderCooPointOrderCosts = @"cooPointOrderCosts";
NSString *const kJCModel_createCooPointOrderCooPointOrderItems = @"items";
NSString *const kJCModel_createCooPointOrderCooPointOrderCooId = @"cooId";
NSString *const kJCModel_createCooPointOrderCooPointOrderComments = @"comments";


@interface JCModel_createCooPointOrderCooPointOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createCooPointOrderCooPointOrder

@synthesize cooPointOrderCosts = _cooPointOrderCosts;
@synthesize items = _items;
@synthesize cooId = _cooId;
@synthesize comments = _comments;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_createCooPointOrderCooPointOrderCosts = [dict objectForKey:kJCModel_createCooPointOrderCooPointOrderCooPointOrderCosts];
    NSMutableArray *parsedJCModel_createCooPointOrderCooPointOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_createCooPointOrderCooPointOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_createCooPointOrderCooPointOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_createCooPointOrderCooPointOrderCosts addObject:[JCModel_createCooPointOrderCooPointOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_createCooPointOrderCooPointOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_createCooPointOrderCooPointOrderCosts addObject:[JCModel_createCooPointOrderCooPointOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_createCooPointOrderCooPointOrderCosts]];
    }

    self.cooPointOrderCosts = [NSArray arrayWithArray:parsedJCModel_createCooPointOrderCooPointOrderCosts];
    NSObject *receivedJCModel_createCooPointOrderItems = [dict objectForKey:kJCModel_createCooPointOrderCooPointOrderItems];
    NSMutableArray *parsedJCModel_createCooPointOrderItems = [NSMutableArray array];
    
    if ([receivedJCModel_createCooPointOrderItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_createCooPointOrderItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_createCooPointOrderItems addObject:[JCModel_createCooPointOrderItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_createCooPointOrderItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_createCooPointOrderItems addObject:[JCModel_createCooPointOrderItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_createCooPointOrderItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_createCooPointOrderItems];
            self.cooId = [[self objectOrNilForKey:kJCModel_createCooPointOrderCooPointOrderCooId fromDictionary:dict] doubleValue];
            self.comments = [self objectOrNilForKey:kJCModel_createCooPointOrderCooPointOrderComments fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCooPointOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.cooPointOrderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCooPointOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCooPointOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCooPointOrderCosts] forKey:kJCModel_createCooPointOrderCooPointOrderCooPointOrderCosts];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_createCooPointOrderCooPointOrderItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cooId] forKey:kJCModel_createCooPointOrderCooPointOrderCooId];
    [mutableDict setValue:self.comments forKey:kJCModel_createCooPointOrderCooPointOrderComments];

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

    self.cooPointOrderCosts = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderCooPointOrderCooPointOrderCosts];
    self.items = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderCooPointOrderItems];
    self.cooId = [aDecoder decodeDoubleForKey:kJCModel_createCooPointOrderCooPointOrderCooId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderCooPointOrderComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cooPointOrderCosts forKey:kJCModel_createCooPointOrderCooPointOrderCooPointOrderCosts];
    [aCoder encodeObject:_items forKey:kJCModel_createCooPointOrderCooPointOrderItems];
    [aCoder encodeDouble:_cooId forKey:kJCModel_createCooPointOrderCooPointOrderCooId];
    [aCoder encodeObject:_comments forKey:kJCModel_createCooPointOrderCooPointOrderComments];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createCooPointOrderCooPointOrder *copy = [[JCModel_createCooPointOrderCooPointOrder alloc] init];
    
    
    
    if (copy) {

        copy.cooPointOrderCosts = [self.cooPointOrderCosts copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.cooId = self.cooId;
        copy.comments = [self.comments copyWithZone:zone];
    }
    
    return copy;
}


@end
