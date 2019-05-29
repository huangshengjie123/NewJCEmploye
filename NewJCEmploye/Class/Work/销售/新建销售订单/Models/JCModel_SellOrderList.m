//
//  JCModel_SellOrderList.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderList.h"
#import "JCModel_SellOrderOrderPresents.h"
#import "JCModel_SellOrderCustomer.h"
#import "JCModel_SellOrderOrderCosts.h"
#import "JCModel_SellOrderGuider.h"


NSString *const kJCModel_SellOrderListId = @"id";
NSString *const kJCModel_SellOrderListComments = @"comments";
NSString *const kJCModel_SellOrderListGuide = @"guide";
NSString *const kJCModel_SellOrderListProcessId = @"processId";
NSString *const kJCModel_SellOrderListLeader = @"leader";
NSString *const kJCModel_SellOrderListAmount = @"amount";
NSString *const kJCModel_SellOrderListGetamount = @"getamount";
NSString *const kJCModel_SellOrderListOrderPresents = @"orderPresents";
NSString *const kJCModel_SellOrderListCom = @"com";
NSString *const kJCModel_SellOrderListCustomer = @"customer";
NSString *const kJCModel_SellOrderListCustomerId = @"customerId";
NSString *const kJCModel_SellOrderListType = @"type";
NSString *const kJCModel_SellOrderListChecker = @"checker";
NSString *const kJCModel_SellOrderListCreateTime = @"createTime";
NSString *const kJCModel_SellOrderListOrderCosts = @"orderCosts";
NSString *const kJCModel_SellOrderListGuider = @"guider";
NSString *const kJCModel_SellOrderListCusType = @"cusType";
NSString *const kJCModel_SellOrderListStatus = @"status";


@interface JCModel_SellOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderList

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
            self.listIdentifier = [self objectOrNilForKey:kJCModel_SellOrderListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_SellOrderListComments fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_SellOrderListGuide fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_SellOrderListProcessId fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_SellOrderListLeader fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_SellOrderListAmount fromDictionary:dict] doubleValue];
            self.getamount = [[self objectOrNilForKey:kJCModel_SellOrderListGetamount fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_SellOrderOrderPresents = [dict objectForKey:kJCModel_SellOrderListOrderPresents];
    NSMutableArray *parsedJCModel_SellOrderOrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_SellOrderOrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SellOrderOrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SellOrderOrderPresents addObject:[JCModel_SellOrderOrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SellOrderOrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SellOrderOrderPresents addObject:[JCModel_SellOrderOrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SellOrderOrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_SellOrderOrderPresents];
            self.com = [self objectOrNilForKey:kJCModel_SellOrderListCom fromDictionary:dict];
            self.customer = [JCModel_SellOrderCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_SellOrderListCustomer]];
            self.customerId = [[self objectOrNilForKey:kJCModel_SellOrderListCustomerId fromDictionary:dict] doubleValue];
        self.type = [self objectOrNilForKey:kJCModel_SellOrderListType fromDictionary:dict];

        
            self.checker = [self objectOrNilForKey:kJCModel_SellOrderListChecker fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_SellOrderListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_SellOrderOrderCosts = [dict objectForKey:kJCModel_SellOrderListOrderCosts];
    NSMutableArray *parsedJCModel_SellOrderOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_SellOrderOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SellOrderOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SellOrderOrderCosts addObject:[JCModel_SellOrderOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SellOrderOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SellOrderOrderCosts addObject:[JCModel_SellOrderOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SellOrderOrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_SellOrderOrderCosts];
            self.guider = [JCModel_SellOrderGuider modelObjectWithDictionary:[dict objectForKey:kJCModel_SellOrderListGuider]];
            self.cusType = [self objectOrNilForKey:kJCModel_SellOrderListCusType fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_SellOrderListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_SellOrderListId];
    [mutableDict setValue:self.comments forKey:kJCModel_SellOrderListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_SellOrderListGuide];
    [mutableDict setValue:self.processId forKey:kJCModel_SellOrderListProcessId];
    [mutableDict setValue:self.leader forKey:kJCModel_SellOrderListLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_SellOrderListAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_SellOrderListGetamount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_SellOrderListOrderPresents];
    [mutableDict setValue:self.com forKey:kJCModel_SellOrderListCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_SellOrderListCustomer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_SellOrderListCustomerId];
    [mutableDict setValue:self.type forKey:kJCModel_SellOrderListType];
    [mutableDict setValue:self.checker forKey:kJCModel_SellOrderListChecker];
    [mutableDict setValue:self.createTime forKey:kJCModel_SellOrderListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_SellOrderListOrderCosts];
    [mutableDict setValue:[self.guider dictionaryRepresentation] forKey:kJCModel_SellOrderListGuider];
    [mutableDict setValue:self.cusType forKey:kJCModel_SellOrderListCusType];
    [mutableDict setValue:self.status forKey:kJCModel_SellOrderListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_SellOrderListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_SellOrderListComments];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_SellOrderListGuide];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_SellOrderListProcessId];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_SellOrderListLeader];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_SellOrderListAmount];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_SellOrderListGetamount];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_SellOrderListOrderPresents];
    self.com = [aDecoder decodeObjectForKey:kJCModel_SellOrderListCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_SellOrderListCustomer];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_SellOrderListCustomerId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_SellOrderListType];
    self.checker = [aDecoder decodeObjectForKey:kJCModel_SellOrderListChecker];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_SellOrderListCreateTime];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_SellOrderListOrderCosts];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_SellOrderListGuider];
    self.cusType = [aDecoder decodeObjectForKey:kJCModel_SellOrderListCusType];
    self.status = [aDecoder decodeObjectForKey:kJCModel_SellOrderListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_SellOrderListId];
    [aCoder encodeObject:_comments forKey:kJCModel_SellOrderListComments];
    [aCoder encodeDouble:_guide forKey:kJCModel_SellOrderListGuide];
    [aCoder encodeObject:_processId forKey:kJCModel_SellOrderListProcessId];
    [aCoder encodeObject:_leader forKey:kJCModel_SellOrderListLeader];
    [aCoder encodeDouble:_amount forKey:kJCModel_SellOrderListAmount];
    [aCoder encodeDouble:_getamount forKey:kJCModel_SellOrderListGetamount];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_SellOrderListOrderPresents];
    [aCoder encodeObject:_com forKey:kJCModel_SellOrderListCom];
    [aCoder encodeObject:_customer forKey:kJCModel_SellOrderListCustomer];
    [aCoder encodeDouble:_customerId forKey:kJCModel_SellOrderListCustomerId];
    [aCoder encodeObject:_type forKey:kJCModel_SellOrderListType];
    [aCoder encodeObject:_checker forKey:kJCModel_SellOrderListChecker];
    [aCoder encodeObject:_createTime forKey:kJCModel_SellOrderListCreateTime];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_SellOrderListOrderCosts];
    [aCoder encodeObject:_guider forKey:kJCModel_SellOrderListGuider];
    [aCoder encodeObject:_cusType forKey:kJCModel_SellOrderListCusType];
    [aCoder encodeObject:_status forKey:kJCModel_SellOrderListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderList *copy = [[JCModel_SellOrderList alloc] init];
    
    
    
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
