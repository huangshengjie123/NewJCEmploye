//
//  JCModel_ReceivableOrderList.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderList.h"
#import "JCModel_ReceivableOrderOrderPresents.h"
#import "JCModel_ReceivableOrderCustomer.h"
#import "JCModel_ReceivableOrderOrderCosts.h"
#import "JCModel_ReceivableOrderGuider.h"


NSString *const kJCModel_ReceivableOrderListId = @"id";
NSString *const kJCModel_ReceivableOrderListComments = @"comments";
NSString *const kJCModel_ReceivableOrderListGuide = @"guide";
NSString *const kJCModel_ReceivableOrderListProcessId = @"processId";
NSString *const kJCModel_ReceivableOrderListLeader = @"leader";
NSString *const kJCModel_ReceivableOrderListAmount = @"amount";
NSString *const kJCModel_ReceivableOrderListGetamount = @"getamount";
NSString *const kJCModel_ReceivableOrderListOrderPresents = @"orderPresents";
NSString *const kJCModel_ReceivableOrderListCom = @"com";
NSString *const kJCModel_ReceivableOrderListCustomer = @"customer";
NSString *const kJCModel_ReceivableOrderListCustomerId = @"customerId";
NSString *const kJCModel_ReceivableOrderListType = @"type";
NSString *const kJCModel_ReceivableOrderListChecker = @"checker";
NSString *const kJCModel_ReceivableOrderListCreateTime = @"createTime";
NSString *const kJCModel_ReceivableOrderListOrderCosts = @"orderCosts";
NSString *const kJCModel_ReceivableOrderListGuider = @"guider";
NSString *const kJCModel_ReceivableOrderListCusType = @"cusType";
NSString *const kJCModel_ReceivableOrderListStatus = @"status";


@interface JCModel_ReceivableOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize guide = _guide;
@synthesize processId = _processId;
@synthesize leader = _leader;
@synthesize amount = _amount;
@synthesize getamount = _getamount;
@synthesize orderPresents = _orderPresents;
@synthesize com = _com;
@synthesize customer = _customer;
@synthesize customerId = _customerId;
@synthesize type = _type;
@synthesize checker = _checker;
@synthesize createTime = _createTime;
@synthesize orderCosts = _orderCosts;
@synthesize guider = _guider;
@synthesize cusType = _cusType;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_ReceivableOrderListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_ReceivableOrderListComments fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_ReceivableOrderListGuide fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_ReceivableOrderListProcessId fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_ReceivableOrderListLeader fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_ReceivableOrderListAmount fromDictionary:dict] doubleValue];
            self.getamount = [[self objectOrNilForKey:kJCModel_ReceivableOrderListGetamount fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_ReceivableOrderOrderPresents = [dict objectForKey:kJCModel_ReceivableOrderListOrderPresents];
    NSMutableArray *parsedJCModel_ReceivableOrderOrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_ReceivableOrderOrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReceivableOrderOrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReceivableOrderOrderPresents addObject:[JCModel_ReceivableOrderOrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReceivableOrderOrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReceivableOrderOrderPresents addObject:[JCModel_ReceivableOrderOrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReceivableOrderOrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_ReceivableOrderOrderPresents];
            self.com = [self objectOrNilForKey:kJCModel_ReceivableOrderListCom fromDictionary:dict];
            self.customer = [JCModel_ReceivableOrderCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_ReceivableOrderListCustomer]];
            self.customerId = [[self objectOrNilForKey:kJCModel_ReceivableOrderListCustomerId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_ReceivableOrderListType fromDictionary:dict];
            self.checker = [self objectOrNilForKey:kJCModel_ReceivableOrderListChecker fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_ReceivableOrderListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_ReceivableOrderOrderCosts = [dict objectForKey:kJCModel_ReceivableOrderListOrderCosts];
    NSMutableArray *parsedJCModel_ReceivableOrderOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_ReceivableOrderOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReceivableOrderOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReceivableOrderOrderCosts addObject:[JCModel_ReceivableOrderOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReceivableOrderOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReceivableOrderOrderCosts addObject:[JCModel_ReceivableOrderOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReceivableOrderOrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_ReceivableOrderOrderCosts];
            self.guider = [JCModel_ReceivableOrderGuider modelObjectWithDictionary:[dict objectForKey:kJCModel_ReceivableOrderListGuider]];
            self.cusType = [self objectOrNilForKey:kJCModel_ReceivableOrderListCusType fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_ReceivableOrderListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_ReceivableOrderListId];
    [mutableDict setValue:self.comments forKey:kJCModel_ReceivableOrderListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_ReceivableOrderListGuide];
    [mutableDict setValue:self.processId forKey:kJCModel_ReceivableOrderListProcessId];
    [mutableDict setValue:self.leader forKey:kJCModel_ReceivableOrderListLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_ReceivableOrderListAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_ReceivableOrderListGetamount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_ReceivableOrderListOrderPresents];
    [mutableDict setValue:self.com forKey:kJCModel_ReceivableOrderListCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_ReceivableOrderListCustomer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_ReceivableOrderListCustomerId];
    [mutableDict setValue:self.type forKey:kJCModel_ReceivableOrderListType];
    [mutableDict setValue:self.checker forKey:kJCModel_ReceivableOrderListChecker];
    [mutableDict setValue:self.createTime forKey:kJCModel_ReceivableOrderListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_ReceivableOrderListOrderCosts];
    [mutableDict setValue:[self.guider dictionaryRepresentation] forKey:kJCModel_ReceivableOrderListGuider];
    [mutableDict setValue:self.cusType forKey:kJCModel_ReceivableOrderListCusType];
    [mutableDict setValue:self.status forKey:kJCModel_ReceivableOrderListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListComments];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderListGuide];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListProcessId];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListLeader];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderListAmount];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderListGetamount];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListOrderPresents];
    self.com = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListCustomer];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderListCustomerId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListType];
    self.checker = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListChecker];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListCreateTime];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListOrderCosts];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListGuider];
    self.cusType = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListCusType];
    self.status = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_ReceivableOrderListId];
    [aCoder encodeObject:_comments forKey:kJCModel_ReceivableOrderListComments];
    [aCoder encodeDouble:_guide forKey:kJCModel_ReceivableOrderListGuide];
    [aCoder encodeObject:_processId forKey:kJCModel_ReceivableOrderListProcessId];
    [aCoder encodeObject:_leader forKey:kJCModel_ReceivableOrderListLeader];
    [aCoder encodeDouble:_amount forKey:kJCModel_ReceivableOrderListAmount];
    [aCoder encodeDouble:_getamount forKey:kJCModel_ReceivableOrderListGetamount];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_ReceivableOrderListOrderPresents];
    [aCoder encodeObject:_com forKey:kJCModel_ReceivableOrderListCom];
    [aCoder encodeObject:_customer forKey:kJCModel_ReceivableOrderListCustomer];
    [aCoder encodeDouble:_customerId forKey:kJCModel_ReceivableOrderListCustomerId];
    [aCoder encodeObject:_type forKey:kJCModel_ReceivableOrderListType];
    [aCoder encodeObject:_checker forKey:kJCModel_ReceivableOrderListChecker];
    [aCoder encodeObject:_createTime forKey:kJCModel_ReceivableOrderListCreateTime];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_ReceivableOrderListOrderCosts];
    [aCoder encodeObject:_guider forKey:kJCModel_ReceivableOrderListGuider];
    [aCoder encodeObject:_cusType forKey:kJCModel_ReceivableOrderListCusType];
    [aCoder encodeObject:_status forKey:kJCModel_ReceivableOrderListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderList *copy = [[JCModel_ReceivableOrderList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.guide = self.guide;
        copy.processId = [self.processId copyWithZone:zone];
        copy.leader = [self.leader copyWithZone:zone];
        copy.amount = self.amount;
        copy.getamount = self.getamount;
        copy.orderPresents = [self.orderPresents copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.customer = [self.customer copyWithZone:zone];
        copy.customerId = self.customerId;
        copy.type = [self.type copyWithZone:zone];
        copy.checker = [self.checker copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.orderCosts = [self.orderCosts copyWithZone:zone];
        copy.guider = [self.guider copyWithZone:zone];
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
