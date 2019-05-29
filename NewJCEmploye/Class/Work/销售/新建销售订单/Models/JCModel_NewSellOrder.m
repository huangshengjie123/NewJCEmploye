//
//  JCModel_NewSellOrder.m
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellOrder.h"
#import "JCModel_NewSellCosts.h"
#import "JCModel_NewSellCostsSelf.h"


NSString *const kJCModel_NewSellOrderComments = @"comments";
NSString *const kJCModel_NewSellOrderId = @"id";
NSString *const kJCModel_NewSellOrderGetamount = @"getamount";
NSString *const kJCModel_NewSellOrderProcessId = @"processId";
NSString *const kJCModel_NewSellOrderCosts = @"costs";
NSString *const kJCModel_NewSellOrderGuide = @"guide";
NSString *const kJCModel_NewSellOrderCustomerId = @"customerId";
NSString *const kJCModel_NewSellOrderCostsSelf = @"costsSelf";


@interface JCModel_NewSellOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellOrder

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
            self.comments = [self objectOrNilForKey:kJCModel_NewSellOrderComments fromDictionary:dict];
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_NewSellOrderId fromDictionary:dict];
            self.getamount = [[self objectOrNilForKey:kJCModel_NewSellOrderGetamount fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_NewSellOrderProcessId fromDictionary:dict];
    NSObject *receivedJCModel_NewSellCosts = [dict objectForKey:kJCModel_NewSellOrderCosts];
    NSMutableArray *parsedJCModel_NewSellCosts = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellCosts addObject:[JCModel_NewSellCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellCosts addObject:[JCModel_NewSellCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellCosts]];
    }

    self.costs = [NSArray arrayWithArray:parsedJCModel_NewSellCosts];
            self.guide = [self objectOrNilForKey:kJCModel_NewSellOrderGuide fromDictionary:dict];
            self.customerId = [[self objectOrNilForKey:kJCModel_NewSellOrderCustomerId fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_NewSellCostsSelf = [dict objectForKey:kJCModel_NewSellOrderCostsSelf];
    NSMutableArray *parsedJCModel_NewSellCostsSelf = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellCostsSelf isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellCostsSelf) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellCostsSelf addObject:[JCModel_NewSellCostsSelf modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellCostsSelf isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellCostsSelf addObject:[JCModel_NewSellCostsSelf modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellCostsSelf]];
    }

    self.costsSelf = [NSArray arrayWithArray:parsedJCModel_NewSellCostsSelf];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kJCModel_NewSellOrderComments];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_NewSellOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_NewSellOrderGetamount];
    [mutableDict setValue:self.processId forKey:kJCModel_NewSellOrderProcessId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCosts] forKey:kJCModel_NewSellOrderCosts];
    [mutableDict setValue:self.guide forKey:kJCModel_NewSellOrderGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_NewSellOrderCustomerId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCostsSelf] forKey:kJCModel_NewSellOrderCostsSelf];

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

    self.comments = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderComments];
    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderId];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_NewSellOrderGetamount];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderProcessId];
    self.costs = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderCosts];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderGuide];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_NewSellOrderCustomerId];
    self.costsSelf = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderCostsSelf];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kJCModel_NewSellOrderComments];
    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_NewSellOrderId];
    [aCoder encodeDouble:_getamount forKey:kJCModel_NewSellOrderGetamount];
    [aCoder encodeObject:_processId forKey:kJCModel_NewSellOrderProcessId];
    [aCoder encodeObject:_costs forKey:kJCModel_NewSellOrderCosts];
    [aCoder encodeObject:_guide forKey:kJCModel_NewSellOrderGuide];
    [aCoder encodeDouble:_customerId forKey:kJCModel_NewSellOrderCustomerId];
    [aCoder encodeObject:_costsSelf forKey:kJCModel_NewSellOrderCostsSelf];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellOrder *copy = [[JCModel_NewSellOrder alloc] init];
    
    
    
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
