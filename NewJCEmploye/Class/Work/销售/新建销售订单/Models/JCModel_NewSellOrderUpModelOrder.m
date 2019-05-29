//
//  JCModel_NewSellOrderUpModelOrder.m
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellOrderUpModelOrder.h"
#import "JCModel_NewSellOrderUpModelPCosts.h"
#import "JCModel_NewSellOrderUpModelCosts.h"
#import "JCModel_NewSellOrderUpModelCostsSelf.h"
#import "JCModel_NewSellOrderUpModelPCostsSelf.h"


NSString *const kJCModel_NewSellOrderUpModelOrderComments = @"comments";
NSString *const kJCModel_NewSellOrderUpModelOrderPCosts = @"pCosts";
NSString *const kJCModel_NewSellOrderUpModelOrderId = @"id";
NSString *const kJCModel_NewSellOrderUpModelOrderGetamount = @"getamount";
NSString *const kJCModel_NewSellOrderUpModelOrderProcessId = @"processId";
NSString *const kJCModel_NewSellOrderUpModelOrderCosts = @"costs";
NSString *const kJCModel_NewSellOrderUpModelOrderGuide = @"guide";
NSString *const kJCModel_NewSellOrderUpModelOrderCustomerId = @"customerId";
NSString *const kJCModel_NewSellOrderUpModelOrderCostsSelf = @"costsSelf";
NSString *const kJCModel_NewSellOrderUpModelOrderPCostsSelf = @"pCostsSelf";


@interface JCModel_NewSellOrderUpModelOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellOrderUpModelOrder

@synthesize comments = _comments;
@synthesize pCosts = _pCosts;
@synthesize orderIdentifier = _orderIdentifier;
@synthesize getamount = _getamount;
@synthesize processId = _processId;
@synthesize costs = _costs;
@synthesize guide = _guide;
@synthesize customerId = _customerId;
@synthesize costsSelf = _costsSelf;
@synthesize pCostsSelf = _pCostsSelf;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.comments = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderComments fromDictionary:dict];
    NSObject *receivedJCModel_NewSellOrderUpModelPCosts = [dict objectForKey:kJCModel_NewSellOrderUpModelOrderPCosts];
    NSMutableArray *parsedJCModel_NewSellOrderUpModelPCosts = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellOrderUpModelPCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellOrderUpModelPCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellOrderUpModelPCosts addObject:[JCModel_NewSellOrderUpModelPCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellOrderUpModelPCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellOrderUpModelPCosts addObject:[JCModel_NewSellOrderUpModelPCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellOrderUpModelPCosts]];
    }

    self.pCosts = [NSArray arrayWithArray:parsedJCModel_NewSellOrderUpModelPCosts];
            self.orderIdentifier = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderId fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderGetamount fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderProcessId fromDictionary:dict];
    NSObject *receivedJCModel_NewSellOrderUpModelCosts = [dict objectForKey:kJCModel_NewSellOrderUpModelOrderCosts];
    NSMutableArray *parsedJCModel_NewSellOrderUpModelCosts = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellOrderUpModelCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellOrderUpModelCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellOrderUpModelCosts addObject:[JCModel_NewSellOrderUpModelCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellOrderUpModelCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellOrderUpModelCosts addObject:[JCModel_NewSellOrderUpModelCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellOrderUpModelCosts]];
    }

    self.costs = [NSArray arrayWithArray:parsedJCModel_NewSellOrderUpModelCosts];
            self.guide = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderGuide fromDictionary:dict];
            self.customerId = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelOrderCustomerId fromDictionary:dict];
    NSObject *receivedJCModel_NewSellOrderUpModelCostsSelf = [dict objectForKey:kJCModel_NewSellOrderUpModelOrderCostsSelf];
    NSMutableArray *parsedJCModel_NewSellOrderUpModelCostsSelf = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellOrderUpModelCostsSelf isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellOrderUpModelCostsSelf) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellOrderUpModelCostsSelf addObject:[JCModel_NewSellOrderUpModelCostsSelf modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellOrderUpModelCostsSelf isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellOrderUpModelCostsSelf addObject:[JCModel_NewSellOrderUpModelCostsSelf modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellOrderUpModelCostsSelf]];
    }

    self.costsSelf = [NSArray arrayWithArray:parsedJCModel_NewSellOrderUpModelCostsSelf];
    NSObject *receivedJCModel_NewSellOrderUpModelPCostsSelf = [dict objectForKey:kJCModel_NewSellOrderUpModelOrderPCostsSelf];
    NSMutableArray *parsedJCModel_NewSellOrderUpModelPCostsSelf = [NSMutableArray array];
    
    if ([receivedJCModel_NewSellOrderUpModelPCostsSelf isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewSellOrderUpModelPCostsSelf) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewSellOrderUpModelPCostsSelf addObject:[JCModel_NewSellOrderUpModelPCostsSelf modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewSellOrderUpModelPCostsSelf isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewSellOrderUpModelPCostsSelf addObject:[JCModel_NewSellOrderUpModelPCostsSelf modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewSellOrderUpModelPCostsSelf]];
    }

    self.pCostsSelf = [NSArray arrayWithArray:parsedJCModel_NewSellOrderUpModelPCostsSelf];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kJCModel_NewSellOrderUpModelOrderComments];
    NSMutableArray *tempArrayForPCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.pCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPCosts] forKey:kJCModel_NewSellOrderUpModelOrderPCosts];
    [mutableDict setValue:self.orderIdentifier forKey:kJCModel_NewSellOrderUpModelOrderId];
    [mutableDict setValue:self.getamount forKey:kJCModel_NewSellOrderUpModelOrderGetamount];
    [mutableDict setValue:self.processId forKey:kJCModel_NewSellOrderUpModelOrderProcessId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCosts] forKey:kJCModel_NewSellOrderUpModelOrderCosts];
    [mutableDict setValue:self.guide forKey:kJCModel_NewSellOrderUpModelOrderGuide];
    [mutableDict setValue:self.customerId forKey:kJCModel_NewSellOrderUpModelOrderCustomerId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCostsSelf] forKey:kJCModel_NewSellOrderUpModelOrderCostsSelf];
    NSMutableArray *tempArrayForPCostsSelf = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.pCostsSelf) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPCostsSelf addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPCostsSelf addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPCostsSelf] forKey:kJCModel_NewSellOrderUpModelOrderPCostsSelf];

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

    self.comments = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderComments];
    self.pCosts = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderPCosts];
    self.orderIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderId];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderGetamount];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderProcessId];
    self.costs = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderCosts];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderGuide];
    self.customerId = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderCustomerId];
    self.costsSelf = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderCostsSelf];
    self.pCostsSelf = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelOrderPCostsSelf];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kJCModel_NewSellOrderUpModelOrderComments];
    [aCoder encodeObject:_pCosts forKey:kJCModel_NewSellOrderUpModelOrderPCosts];
    [aCoder encodeObject:_orderIdentifier forKey:kJCModel_NewSellOrderUpModelOrderId];
    [aCoder encodeObject:_getamount forKey:kJCModel_NewSellOrderUpModelOrderGetamount];
    [aCoder encodeObject:_processId forKey:kJCModel_NewSellOrderUpModelOrderProcessId];
    [aCoder encodeObject:_costs forKey:kJCModel_NewSellOrderUpModelOrderCosts];
    [aCoder encodeObject:_guide forKey:kJCModel_NewSellOrderUpModelOrderGuide];
    [aCoder encodeObject:_customerId forKey:kJCModel_NewSellOrderUpModelOrderCustomerId];
    [aCoder encodeObject:_costsSelf forKey:kJCModel_NewSellOrderUpModelOrderCostsSelf];
    [aCoder encodeObject:_pCostsSelf forKey:kJCModel_NewSellOrderUpModelOrderPCostsSelf];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellOrderUpModelOrder *copy = [[JCModel_NewSellOrderUpModelOrder alloc] init];
    
    
    
    if (copy) {

        copy.comments = [self.comments copyWithZone:zone];
        copy.pCosts = [self.pCosts copyWithZone:zone];
        copy.orderIdentifier = [self.orderIdentifier copyWithZone:zone];
        copy.getamount = [self.getamount copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.costs = [self.costs copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.customerId = [self.customerId copyWithZone:zone];
        copy.costsSelf = [self.costsSelf copyWithZone:zone];
        copy.pCostsSelf = [self.pCostsSelf copyWithZone:zone];
    }
    
    return copy;
}


@end
