//
//  JCModel_newPurchaserOrderPurchaserOrder.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newPurchaserOrderPurchaserOrder.h"
#import "JCModel_newPurchaserOrderPurchaserOrderCosts.h"


NSString *const kJCModel_newPurchaserOrderPurchaserOrderId = @"id";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderComments = @"comments";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderLeader = @"leader";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderFinancer = @"financer";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderType = @"type";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderDistributer = @"distributer";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderCreateTime = @"createTime";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderEndTime = @"endTime";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderApplicant = @"applicant";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderPurchaserOrderCosts = @"purchaserOrderCosts";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderStatus = @"status";
NSString *const kJCModel_newPurchaserOrderPurchaserOrderPurchaser = @"purchaser";


@interface JCModel_newPurchaserOrderPurchaserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newPurchaserOrderPurchaserOrder

@synthesize purchaserOrderIdentifier = _purchaserOrderIdentifier;
@synthesize comments = _comments;
@synthesize leader = _leader;
@synthesize financer = _financer;
@synthesize type = _type;
@synthesize distributer = _distributer;
@synthesize createTime = _createTime;
@synthesize endTime = _endTime;
@synthesize applicant = _applicant;
@synthesize purchaserOrderCosts = _purchaserOrderCosts;
@synthesize status = _status;
@synthesize purchaser = _purchaser;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purchaserOrderIdentifier = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderComments fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderLeader fromDictionary:dict];
            self.financer = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderFinancer fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderType fromDictionary:dict];
            self.distributer = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderDistributer fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderCreateTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderEndTime fromDictionary:dict];
            self.applicant = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderApplicant fromDictionary:dict];
    NSObject *receivedJCModel_newPurchaserOrderPurchaserOrderCosts = [dict objectForKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaserOrderCosts];
    NSMutableArray *parsedJCModel_newPurchaserOrderPurchaserOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_newPurchaserOrderPurchaserOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_newPurchaserOrderPurchaserOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_newPurchaserOrderPurchaserOrderCosts addObject:[JCModel_newPurchaserOrderPurchaserOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_newPurchaserOrderPurchaserOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_newPurchaserOrderPurchaserOrderCosts addObject:[JCModel_newPurchaserOrderPurchaserOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_newPurchaserOrderPurchaserOrderCosts]];
    }

    self.purchaserOrderCosts = [NSArray arrayWithArray:parsedJCModel_newPurchaserOrderPurchaserOrderCosts];
            self.status = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderStatus fromDictionary:dict];
            self.purchaser = [self objectOrNilForKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaser fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purchaserOrderIdentifier forKey:kJCModel_newPurchaserOrderPurchaserOrderId];
    [mutableDict setValue:self.comments forKey:kJCModel_newPurchaserOrderPurchaserOrderComments];
    [mutableDict setValue:self.leader forKey:kJCModel_newPurchaserOrderPurchaserOrderLeader];
    [mutableDict setValue:self.financer forKey:kJCModel_newPurchaserOrderPurchaserOrderFinancer];
    [mutableDict setValue:self.type forKey:kJCModel_newPurchaserOrderPurchaserOrderType];
    [mutableDict setValue:self.distributer forKey:kJCModel_newPurchaserOrderPurchaserOrderDistributer];
    [mutableDict setValue:self.createTime forKey:kJCModel_newPurchaserOrderPurchaserOrderCreateTime];
    [mutableDict setValue:self.endTime forKey:kJCModel_newPurchaserOrderPurchaserOrderEndTime];
    [mutableDict setValue:self.applicant forKey:kJCModel_newPurchaserOrderPurchaserOrderApplicant];
    NSMutableArray *tempArrayForPurchaserOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.purchaserOrderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPurchaserOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPurchaserOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserOrderCosts] forKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaserOrderCosts];
    [mutableDict setValue:self.status forKey:kJCModel_newPurchaserOrderPurchaserOrderStatus];
    [mutableDict setValue:self.purchaser forKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaser];

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

    self.purchaserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderComments];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderLeader];
    self.financer = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderFinancer];
    self.type = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderType];
    self.distributer = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderDistributer];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderCreateTime];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderEndTime];
    self.applicant = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderApplicant];
    self.purchaserOrderCosts = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaserOrderCosts];
    self.status = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderStatus];
    self.purchaser = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purchaserOrderIdentifier forKey:kJCModel_newPurchaserOrderPurchaserOrderId];
    [aCoder encodeObject:_comments forKey:kJCModel_newPurchaserOrderPurchaserOrderComments];
    [aCoder encodeObject:_leader forKey:kJCModel_newPurchaserOrderPurchaserOrderLeader];
    [aCoder encodeObject:_financer forKey:kJCModel_newPurchaserOrderPurchaserOrderFinancer];
    [aCoder encodeObject:_type forKey:kJCModel_newPurchaserOrderPurchaserOrderType];
    [aCoder encodeObject:_distributer forKey:kJCModel_newPurchaserOrderPurchaserOrderDistributer];
    [aCoder encodeObject:_createTime forKey:kJCModel_newPurchaserOrderPurchaserOrderCreateTime];
    [aCoder encodeObject:_endTime forKey:kJCModel_newPurchaserOrderPurchaserOrderEndTime];
    [aCoder encodeObject:_applicant forKey:kJCModel_newPurchaserOrderPurchaserOrderApplicant];
    [aCoder encodeObject:_purchaserOrderCosts forKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaserOrderCosts];
    [aCoder encodeObject:_status forKey:kJCModel_newPurchaserOrderPurchaserOrderStatus];
    [aCoder encodeObject:_purchaser forKey:kJCModel_newPurchaserOrderPurchaserOrderPurchaser];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newPurchaserOrderPurchaserOrder *copy = [[JCModel_newPurchaserOrderPurchaserOrder alloc] init];
    
    
    
    if (copy) {

        copy.purchaserOrderIdentifier = [self.purchaserOrderIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.leader = [self.leader copyWithZone:zone];
        copy.financer = [self.financer copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.distributer = [self.distributer copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.applicant = [self.applicant copyWithZone:zone];
        copy.purchaserOrderCosts = [self.purchaserOrderCosts copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.purchaser = [self.purchaser copyWithZone:zone];
    }
    
    return copy;
}


@end
