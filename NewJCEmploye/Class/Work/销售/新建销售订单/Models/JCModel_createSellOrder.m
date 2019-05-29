//
//  JCModel_createSellOrder.m
//
//  Created by   on 2018/6/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createSellOrder.h"
#import "JCModel_createSellCosts.h"
#import "JCModel_createSellCostsSelf.h"


NSString *const kJCModel_createSellOrderComments = @"comments";
NSString *const kJCModel_createSellOrderId = @"id";
NSString *const kJCModel_createSellOrderGetamount = @"getamount";
NSString *const kJCModel_createSellOrderProcessId = @"processId";
NSString *const kJCModel_createSellOrderCosts = @"costs";
NSString *const kJCModel_createSellOrderGuide = @"guide";
NSString *const kJCModel_createSellOrderCustomerId = @"customerId";
NSString *const kJCModel_createSellOrderCostsSelf = @"costsSelf";


@interface JCModel_createSellOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createSellOrder

@synthesize comments = _comments;
@synthesize orderIdentifier = _orderIdentifier;
@synthesize getamount = _getamount;
@synthesize processId = _processId;
@synthesize costs = _costs;
@synthesize guide = _guide;
@synthesize customerId = _customerId;
@synthesize costsSelf = _costsSelf;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.comments = [self objectOrNilForKey:kJCModel_createSellOrderComments fromDictionary:dict];
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_createSellOrderId fromDictionary:dict];
            self.getamount = [[self objectOrNilForKey:kJCModel_createSellOrderGetamount fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_createSellOrderProcessId fromDictionary:dict];
    NSObject *receivedJCModel_createSellCosts = [dict objectForKey:kJCModel_createSellOrderCosts];
    NSMutableArray *parsedJCModel_createSellCosts = [NSMutableArray array];
    
    if ([receivedJCModel_createSellCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_createSellCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_createSellCosts addObject:[JCModel_createSellCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_createSellCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_createSellCosts addObject:[JCModel_createSellCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_createSellCosts]];
    }

    self.costs = [NSArray arrayWithArray:parsedJCModel_createSellCosts];
            self.guide = [self objectOrNilForKey:kJCModel_createSellOrderGuide fromDictionary:dict];
            self.customerId = [[self objectOrNilForKey:kJCModel_createSellOrderCustomerId fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_createSellCostsSelf = [dict objectForKey:kJCModel_createSellOrderCostsSelf];
    NSMutableArray *parsedJCModel_createSellCostsSelf = [NSMutableArray array];
    
    if ([receivedJCModel_createSellCostsSelf isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_createSellCostsSelf) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_createSellCostsSelf addObject:[JCModel_createSellCostsSelf modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_createSellCostsSelf isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_createSellCostsSelf addObject:[JCModel_createSellCostsSelf modelObjectWithDictionary:(NSDictionary *)receivedJCModel_createSellCostsSelf]];
    }

    self.costsSelf = [NSArray arrayWithArray:parsedJCModel_createSellCostsSelf];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kJCModel_createSellOrderComments];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_createSellOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_createSellOrderGetamount];
    [mutableDict setValue:self.processId forKey:kJCModel_createSellOrderProcessId];
    NSMutableArray *tempArrayForCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.costs) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCosts] forKey:kJCModel_createSellOrderCosts];
    [mutableDict setValue:self.guide forKey:kJCModel_createSellOrderGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_createSellOrderCustomerId];
    NSMutableArray *tempArrayForCostsSelf = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.costsSelf) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCostsSelf addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCostsSelf addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCostsSelf] forKey:kJCModel_createSellOrderCostsSelf];

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

    self.comments = [aDecoder decodeObjectForKey:kJCModel_createSellOrderComments];
    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_createSellOrderId];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_createSellOrderGetamount];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_createSellOrderProcessId];
    self.costs = [aDecoder decodeObjectForKey:kJCModel_createSellOrderCosts];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_createSellOrderGuide];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_createSellOrderCustomerId];
    self.costsSelf = [aDecoder decodeObjectForKey:kJCModel_createSellOrderCostsSelf];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kJCModel_createSellOrderComments];
    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_createSellOrderId];
    [aCoder encodeDouble:_getamount forKey:kJCModel_createSellOrderGetamount];
    [aCoder encodeObject:_processId forKey:kJCModel_createSellOrderProcessId];
    [aCoder encodeObject:_costs forKey:kJCModel_createSellOrderCosts];
    [aCoder encodeObject:_guide forKey:kJCModel_createSellOrderGuide];
    [aCoder encodeDouble:_customerId forKey:kJCModel_createSellOrderCustomerId];
    [aCoder encodeObject:_costsSelf forKey:kJCModel_createSellOrderCostsSelf];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createSellOrder *copy = [[JCModel_createSellOrder alloc] init];
    
    
    
    if (copy) {

        copy.comments = [self.comments copyWithZone:zone];
        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.getamount = self.getamount;
        copy.processId = [self.processId copyWithZone:zone];
        copy.costs = [self.costs copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.customerId = self.customerId;
        copy.costsSelf = [self.costsSelf copyWithZone:zone];
    }
    
    return copy;
}


@end
