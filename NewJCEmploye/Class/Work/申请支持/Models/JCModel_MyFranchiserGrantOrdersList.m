//
//  JCModel_MyFranchiserGrantOrdersList.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersList.h"
#import "JCModel_MyFranchiserGrantOrdersCustomerPrepare.h"
#import "JCModel_MyFranchiserGrantOrdersFranProbation.h"
#import "JCModel_MyFranchiserGrantOrdersOrderPresents.h"
#import "JCModel_MyFranchiserGrantOrdersCustomer.h"
#import "JCModel_MyFranchiserGrantOrdersFranchiserDetail.h"
#import "JCModel_MyFranchiserGrantOrdersOrderCosts.h"


NSString *const kJCModel_MyFranchiserGrantOrdersListCom = @"com";
NSString *const kJCModel_MyFranchiserGrantOrdersListStatus = @"status";
NSString *const kJCModel_MyFranchiserGrantOrdersListAmount = @"amount";
NSString *const kJCModel_MyFranchiserGrantOrdersListCustomerPrepare = @"customerPrepare";
NSString *const kJCModel_MyFranchiserGrantOrdersListIsAgent = @"isAgent";
NSString *const kJCModel_MyFranchiserGrantOrdersListDifBalance = @"difBalance";
NSString *const kJCModel_MyFranchiserGrantOrdersListProcessId = @"processId";
NSString *const kJCModel_MyFranchiserGrantOrdersListPreId = @"preId";
NSString *const kJCModel_MyFranchiserGrantOrdersListCustomerId = @"customerId";
NSString *const kJCModel_MyFranchiserGrantOrdersListEndTime = @"endTime";
NSString *const kJCModel_MyFranchiserGrantOrdersListFranProbation = @"franProbation";
NSString *const kJCModel_MyFranchiserGrantOrdersListType = @"type";
NSString *const kJCModel_MyFranchiserGrantOrdersListGetamount = @"getamount";
NSString *const kJCModel_MyFranchiserGrantOrdersListFranchiser = @"franchiser";
NSString *const kJCModel_MyFranchiserGrantOrdersListId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersListGuide = @"guide";
NSString *const kJCModel_MyFranchiserGrantOrdersListUid = @"uid";
NSString *const kJCModel_MyFranchiserGrantOrdersListOrderPresents = @"orderPresents";
NSString *const kJCModel_MyFranchiserGrantOrdersListCusType = @"cusType";
NSString *const kJCModel_MyFranchiserGrantOrdersListCustomer = @"customer";
NSString *const kJCModel_MyFranchiserGrantOrdersListFranchiserDetail = @"franchiserDetail";
NSString *const kJCModel_MyFranchiserGrantOrdersListComments = @"comments";
NSString *const kJCModel_MyFranchiserGrantOrdersListCreateTime = @"createTime";
NSString *const kJCModel_MyFranchiserGrantOrdersListOrderCosts = @"orderCosts";


@interface JCModel_MyFranchiserGrantOrdersList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersList

@synthesize com = _com;
@synthesize status = _status;
@synthesize amount = _amount;
@synthesize customerPrepare = _customerPrepare;
@synthesize isAgent = _isAgent;
@synthesize difBalance = _difBalance;
@synthesize processId = _processId;
@synthesize preId = _preId;
@synthesize customerId = _customerId;
@synthesize endTime = _endTime;
@synthesize franProbation = _franProbation;
@synthesize type = _type;
@synthesize getamount = _getamount;
@synthesize franchiser = _franchiser;
@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize uid = _uid;
@synthesize orderPresents = _orderPresents;
@synthesize cusType = _cusType;
@synthesize customer = _customer;
@synthesize franchiserDetail = _franchiserDetail;
@synthesize comments = _comments;
@synthesize createTime = _createTime;
@synthesize orderCosts = _orderCosts;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.com = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListCom fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListStatus fromDictionary:dict];
            self.amount = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListAmount fromDictionary:dict];
            self.customerPrepare = [JCModel_MyFranchiserGrantOrdersCustomerPrepare modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersListCustomerPrepare]];
            self.isAgent = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListIsAgent fromDictionary:dict] doubleValue];
            self.difBalance = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListDifBalance fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListProcessId fromDictionary:dict];
            self.preId = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListPreId fromDictionary:dict] doubleValue];
            self.customerId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListCustomerId fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListEndTime fromDictionary:dict];
            self.franProbation = [JCModel_MyFranchiserGrantOrdersFranProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersListFranProbation]];
            self.type = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListType fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListGetamount fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListFranchiser fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListGuide fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListUid fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_MyFranchiserGrantOrdersOrderPresents = [dict objectForKey:kJCModel_MyFranchiserGrantOrdersListOrderPresents];
    NSMutableArray *parsedJCModel_MyFranchiserGrantOrdersOrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_MyFranchiserGrantOrdersOrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyFranchiserGrantOrdersOrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyFranchiserGrantOrdersOrderPresents addObject:[JCModel_MyFranchiserGrantOrdersOrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyFranchiserGrantOrdersOrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyFranchiserGrantOrdersOrderPresents addObject:[JCModel_MyFranchiserGrantOrdersOrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyFranchiserGrantOrdersOrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_MyFranchiserGrantOrdersOrderPresents];
            self.cusType = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListCusType fromDictionary:dict];
            self.customer = [JCModel_MyFranchiserGrantOrdersCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersListCustomer]];
            self.franchiserDetail = [JCModel_MyFranchiserGrantOrdersFranchiserDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersListFranchiserDetail]];
            self.comments = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListComments fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_MyFranchiserGrantOrdersOrderCosts = [dict objectForKey:kJCModel_MyFranchiserGrantOrdersListOrderCosts];
    NSMutableArray *parsedJCModel_MyFranchiserGrantOrdersOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_MyFranchiserGrantOrdersOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyFranchiserGrantOrdersOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyFranchiserGrantOrdersOrderCosts addObject:[JCModel_MyFranchiserGrantOrdersOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyFranchiserGrantOrdersOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyFranchiserGrantOrdersOrderCosts addObject:[JCModel_MyFranchiserGrantOrdersOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyFranchiserGrantOrdersOrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_MyFranchiserGrantOrdersOrderCosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.com forKey:kJCModel_MyFranchiserGrantOrdersListCom];
    [mutableDict setValue:self.status forKey:kJCModel_MyFranchiserGrantOrdersListStatus];
    [mutableDict setValue:self.amount forKey:kJCModel_MyFranchiserGrantOrdersListAmount];
    [mutableDict setValue:[self.customerPrepare dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersListCustomerPrepare];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAgent] forKey:kJCModel_MyFranchiserGrantOrdersListIsAgent];
    [mutableDict setValue:self.difBalance forKey:kJCModel_MyFranchiserGrantOrdersListDifBalance];
    [mutableDict setValue:self.processId forKey:kJCModel_MyFranchiserGrantOrdersListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preId] forKey:kJCModel_MyFranchiserGrantOrdersListPreId];
    [mutableDict setValue:self.customerId forKey:kJCModel_MyFranchiserGrantOrdersListCustomerId];
    [mutableDict setValue:self.endTime forKey:kJCModel_MyFranchiserGrantOrdersListEndTime];
    [mutableDict setValue:[self.franProbation dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersListFranProbation];
    [mutableDict setValue:self.type forKey:kJCModel_MyFranchiserGrantOrdersListType];
    [mutableDict setValue:self.getamount forKey:kJCModel_MyFranchiserGrantOrdersListGetamount];
    [mutableDict setValue:self.franchiser forKey:kJCModel_MyFranchiserGrantOrdersListFranchiser];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_MyFranchiserGrantOrdersListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_MyFranchiserGrantOrdersListGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_MyFranchiserGrantOrdersListUid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_MyFranchiserGrantOrdersListOrderPresents];
    [mutableDict setValue:self.cusType forKey:kJCModel_MyFranchiserGrantOrdersListCusType];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersListCustomer];
    [mutableDict setValue:[self.franchiserDetail dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersListFranchiserDetail];
    [mutableDict setValue:self.comments forKey:kJCModel_MyFranchiserGrantOrdersListComments];
    [mutableDict setValue:self.createTime forKey:kJCModel_MyFranchiserGrantOrdersListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_MyFranchiserGrantOrdersListOrderCosts];

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

    self.com = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCom];
    self.status = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListStatus];
    self.amount = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListAmount];
    self.customerPrepare = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCustomerPrepare];
    self.isAgent = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersListIsAgent];
    self.difBalance = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListDifBalance];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListProcessId];
    self.preId = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersListPreId];
    self.customerId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCustomerId];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListEndTime];
    self.franProbation = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListFranProbation];
    self.type = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListType];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListGetamount];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListFranchiser];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersListGuide];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersListUid];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListOrderPresents];
    self.cusType = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCusType];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCustomer];
    self.franchiserDetail = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListFranchiserDetail];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListComments];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListCreateTime];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersListOrderCosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_com forKey:kJCModel_MyFranchiserGrantOrdersListCom];
    [aCoder encodeObject:_status forKey:kJCModel_MyFranchiserGrantOrdersListStatus];
    [aCoder encodeObject:_amount forKey:kJCModel_MyFranchiserGrantOrdersListAmount];
    [aCoder encodeObject:_customerPrepare forKey:kJCModel_MyFranchiserGrantOrdersListCustomerPrepare];
    [aCoder encodeDouble:_isAgent forKey:kJCModel_MyFranchiserGrantOrdersListIsAgent];
    [aCoder encodeObject:_difBalance forKey:kJCModel_MyFranchiserGrantOrdersListDifBalance];
    [aCoder encodeObject:_processId forKey:kJCModel_MyFranchiserGrantOrdersListProcessId];
    [aCoder encodeDouble:_preId forKey:kJCModel_MyFranchiserGrantOrdersListPreId];
    [aCoder encodeObject:_customerId forKey:kJCModel_MyFranchiserGrantOrdersListCustomerId];
    [aCoder encodeObject:_endTime forKey:kJCModel_MyFranchiserGrantOrdersListEndTime];
    [aCoder encodeObject:_franProbation forKey:kJCModel_MyFranchiserGrantOrdersListFranProbation];
    [aCoder encodeObject:_type forKey:kJCModel_MyFranchiserGrantOrdersListType];
    [aCoder encodeObject:_getamount forKey:kJCModel_MyFranchiserGrantOrdersListGetamount];
    [aCoder encodeObject:_franchiser forKey:kJCModel_MyFranchiserGrantOrdersListFranchiser];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_MyFranchiserGrantOrdersListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_MyFranchiserGrantOrdersListGuide];
    [aCoder encodeDouble:_uid forKey:kJCModel_MyFranchiserGrantOrdersListUid];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_MyFranchiserGrantOrdersListOrderPresents];
    [aCoder encodeObject:_cusType forKey:kJCModel_MyFranchiserGrantOrdersListCusType];
    [aCoder encodeObject:_customer forKey:kJCModel_MyFranchiserGrantOrdersListCustomer];
    [aCoder encodeObject:_franchiserDetail forKey:kJCModel_MyFranchiserGrantOrdersListFranchiserDetail];
    [aCoder encodeObject:_comments forKey:kJCModel_MyFranchiserGrantOrdersListComments];
    [aCoder encodeObject:_createTime forKey:kJCModel_MyFranchiserGrantOrdersListCreateTime];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_MyFranchiserGrantOrdersListOrderCosts];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersList *copy = [[JCModel_MyFranchiserGrantOrdersList alloc] init];
    
    
    
    if (copy) {

        copy.com = [self.com copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.amount = [self.amount copyWithZone:zone];
        copy.customerPrepare = [self.customerPrepare copyWithZone:zone];
        copy.isAgent = self.isAgent;
        copy.difBalance = [self.difBalance copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.preId = self.preId;
        copy.customerId = [self.customerId copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.franProbation = [self.franProbation copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.getamount = [self.getamount copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.guide = self.guide;
        copy.uid = self.uid;
        copy.orderPresents = [self.orderPresents copyWithZone:zone];
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.customer = [self.customer copyWithZone:zone];
        copy.franchiserDetail = [self.franchiserDetail copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.orderCosts = [self.orderCosts copyWithZone:zone];
    }
    
    return copy;
}


@end
