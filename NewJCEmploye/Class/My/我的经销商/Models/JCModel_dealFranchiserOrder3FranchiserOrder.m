//
//  JCModel_dealFranchiserOrder3FranchiserOrder.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder3FranchiserOrder.h"
#import "JCModel_dealFranchiserOrder3OrderCosts.h"
#import "JCModel_dealFranchiserOrder3OrderPresents.h"


NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderId = @"id";
NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderGuide = @"guide";
NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderGetamount = @"getamount";
NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderOrderCosts = @"orderCosts";
NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderComments = @"comments";
NSString *const kJCModel_dealFranchiserOrder3FranchiserOrderOrderPresents = @"orderPresents";


@interface JCModel_dealFranchiserOrder3FranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder3FranchiserOrder

@synthesize franchiserOrderIdentifier = _franchiserOrderIdentifier;
@synthesize guide = _guide;
@synthesize getamount = _getamount;
@synthesize orderCosts = _orderCosts;
@synthesize comments = _comments;
@synthesize orderPresents = _orderPresents;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3FranchiserOrderId fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3FranchiserOrderGuide fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3FranchiserOrderGetamount fromDictionary:dict];
    NSObject *receivedJCModel_dealFranchiserOrder3OrderCosts = [dict objectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderCosts];
    NSMutableArray *parsedJCModel_dealFranchiserOrder3OrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_dealFranchiserOrder3OrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_dealFranchiserOrder3OrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_dealFranchiserOrder3OrderCosts addObject:[JCModel_dealFranchiserOrder3OrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_dealFranchiserOrder3OrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_dealFranchiserOrder3OrderCosts addObject:[JCModel_dealFranchiserOrder3OrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_dealFranchiserOrder3OrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_dealFranchiserOrder3OrderCosts];
            self.comments = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3FranchiserOrderComments fromDictionary:dict];
    NSObject *receivedJCModel_dealFranchiserOrder3OrderPresents = [dict objectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderPresents];
    NSMutableArray *parsedJCModel_dealFranchiserOrder3OrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_dealFranchiserOrder3OrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_dealFranchiserOrder3OrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_dealFranchiserOrder3OrderPresents addObject:[JCModel_dealFranchiserOrder3OrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_dealFranchiserOrder3OrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_dealFranchiserOrder3OrderPresents addObject:[JCModel_dealFranchiserOrder3OrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_dealFranchiserOrder3OrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_dealFranchiserOrder3OrderPresents];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_dealFranchiserOrder3FranchiserOrderId];
    [mutableDict setValue:self.guide forKey:kJCModel_dealFranchiserOrder3FranchiserOrderGuide];
    [mutableDict setValue:self.getamount forKey:kJCModel_dealFranchiserOrder3FranchiserOrderGetamount];
    NSMutableArray *tempArrayForOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.orderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderCosts];
    [mutableDict setValue:self.comments forKey:kJCModel_dealFranchiserOrder3FranchiserOrderComments];
    NSMutableArray *tempArrayForOrderPresents = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.orderPresents) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrderPresents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrderPresents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderPresents];

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

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderGuide];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderGetamount];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderCosts];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderComments];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderPresents];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_dealFranchiserOrder3FranchiserOrderId];
    [aCoder encodeObject:_guide forKey:kJCModel_dealFranchiserOrder3FranchiserOrderGuide];
    [aCoder encodeObject:_getamount forKey:kJCModel_dealFranchiserOrder3FranchiserOrderGetamount];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderCosts];
    [aCoder encodeObject:_comments forKey:kJCModel_dealFranchiserOrder3FranchiserOrderComments];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_dealFranchiserOrder3FranchiserOrderOrderPresents];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder3FranchiserOrder *copy = [[JCModel_dealFranchiserOrder3FranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserOrderIdentifier = [self.franchiserOrderIdentifier copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.getamount = [self.getamount copyWithZone:zone];
        copy.orderCosts = [self.orderCosts copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.orderPresents = [self.orderPresents copyWithZone:zone];
    }
    
    return copy;
}


@end
