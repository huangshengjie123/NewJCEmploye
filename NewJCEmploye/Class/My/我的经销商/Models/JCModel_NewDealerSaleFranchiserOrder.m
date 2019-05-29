//
//  JCModel_NewDealerSaleFranchiserOrder.m
//
//  Created by   on 2018/9/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDealerSaleFranchiserOrder.h"
#import "JCModel_NewDealerSaleOrderCosts.h"
#import "JCModel_NewDealerSaleOrderPresents.h"


NSString *const kJCModel_NewDealerSaleFranchiserOrderId = @"id";
NSString *const kJCModel_NewDealerSaleFranchiserOrderGuide = @"guide";
NSString *const kJCModel_NewDealerSaleFranchiserOrderGetamount = @"getamount";
NSString *const kJCModel_NewDealerSaleFranchiserOrderOrderCosts = @"orderCosts";
NSString *const kJCModel_NewDealerSaleFranchiserOrderComments = @"comments";
NSString *const kJCModel_NewDealerSaleFranchiserOrderOrderPresents = @"orderPresents";


@interface JCModel_NewDealerSaleFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDealerSaleFranchiserOrder

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
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_NewDealerSaleFranchiserOrderId fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_NewDealerSaleFranchiserOrderGuide fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_NewDealerSaleFranchiserOrderGetamount fromDictionary:dict];
    NSObject *receivedJCModel_NewDealerSaleOrderCosts = [dict objectForKey:kJCModel_NewDealerSaleFranchiserOrderOrderCosts];
    NSMutableArray *parsedJCModel_NewDealerSaleOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_NewDealerSaleOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDealerSaleOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDealerSaleOrderCosts addObject:[JCModel_NewDealerSaleOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDealerSaleOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDealerSaleOrderCosts addObject:[JCModel_NewDealerSaleOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDealerSaleOrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_NewDealerSaleOrderCosts];
            self.comments = [self objectOrNilForKey:kJCModel_NewDealerSaleFranchiserOrderComments fromDictionary:dict];
    NSObject *receivedJCModel_NewDealerSaleOrderPresents = [dict objectForKey:kJCModel_NewDealerSaleFranchiserOrderOrderPresents];
    NSMutableArray *parsedJCModel_NewDealerSaleOrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_NewDealerSaleOrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDealerSaleOrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDealerSaleOrderPresents addObject:[JCModel_NewDealerSaleOrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDealerSaleOrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDealerSaleOrderPresents addObject:[JCModel_NewDealerSaleOrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDealerSaleOrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_NewDealerSaleOrderPresents];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_NewDealerSaleFranchiserOrderId];
    [mutableDict setValue:self.guide forKey:kJCModel_NewDealerSaleFranchiserOrderGuide];
    [mutableDict setValue:self.getamount forKey:kJCModel_NewDealerSaleFranchiserOrderGetamount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_NewDealerSaleFranchiserOrderOrderCosts];
    [mutableDict setValue:self.comments forKey:kJCModel_NewDealerSaleFranchiserOrderComments];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_NewDealerSaleFranchiserOrderOrderPresents];

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

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderGuide];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderGetamount];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderOrderCosts];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderComments];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleFranchiserOrderOrderPresents];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_NewDealerSaleFranchiserOrderId];
    [aCoder encodeObject:_guide forKey:kJCModel_NewDealerSaleFranchiserOrderGuide];
    [aCoder encodeObject:_getamount forKey:kJCModel_NewDealerSaleFranchiserOrderGetamount];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_NewDealerSaleFranchiserOrderOrderCosts];
    [aCoder encodeObject:_comments forKey:kJCModel_NewDealerSaleFranchiserOrderComments];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_NewDealerSaleFranchiserOrderOrderPresents];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDealerSaleFranchiserOrder *copy = [[JCModel_NewDealerSaleFranchiserOrder alloc] init];
    
    
    
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
