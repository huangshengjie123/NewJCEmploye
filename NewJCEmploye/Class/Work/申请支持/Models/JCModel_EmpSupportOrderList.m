//
//  JCModel_EmpSupportOrderList.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderList.h"
#import "JCModel_EmpSupportOrderCustomerPrepare.h"
#import "JCModel_EmpSupportOrderFranProbation.h"
#import "JCModel_EmpSupportOrderCustomer.h"
#import "JCModel_EmpSupportOrderFranchiserDetail.h"


NSString *const kJCModel_EmpSupportOrderListCom = @"com";
NSString *const kJCModel_EmpSupportOrderListStatus = @"status";
NSString *const kJCModel_EmpSupportOrderListAmount = @"amount";
NSString *const kJCModel_EmpSupportOrderListCustomerPrepare = @"customerPrepare";
NSString *const kJCModel_EmpSupportOrderListIsAgent = @"isAgent";
NSString *const kJCModel_EmpSupportOrderListDifBalance = @"difBalance";
NSString *const kJCModel_EmpSupportOrderListProcessId = @"processId";
NSString *const kJCModel_EmpSupportOrderListPreId = @"preId";
NSString *const kJCModel_EmpSupportOrderListCustomerId = @"customerId";
NSString *const kJCModel_EmpSupportOrderListEndTime = @"endTime";
NSString *const kJCModel_EmpSupportOrderListFranProbation = @"franProbation";
NSString *const kJCModel_EmpSupportOrderListType = @"type";
NSString *const kJCModel_EmpSupportOrderListGetamount = @"getamount";
NSString *const kJCModel_EmpSupportOrderListFranchiser = @"franchiser";
NSString *const kJCModel_EmpSupportOrderListId = @"id";
NSString *const kJCModel_EmpSupportOrderListGuide = @"guide";
NSString *const kJCModel_EmpSupportOrderListUid = @"uid";
NSString *const kJCModel_EmpSupportOrderListOrderPresents = @"orderPresents";
NSString *const kJCModel_EmpSupportOrderListCusType = @"cusType";
NSString *const kJCModel_EmpSupportOrderListCustomer = @"customer";
NSString *const kJCModel_EmpSupportOrderListFranchiserDetail = @"franchiserDetail";
NSString *const kJCModel_EmpSupportOrderListComments = @"comments";
NSString *const kJCModel_EmpSupportOrderListCreateTime = @"createTime";
NSString *const kJCModel_EmpSupportOrderListOrderCosts = @"orderCosts";


@interface JCModel_EmpSupportOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderList

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
            self.com = [self objectOrNilForKey:kJCModel_EmpSupportOrderListCom fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_EmpSupportOrderListStatus fromDictionary:dict];
            self.amount = [self objectOrNilForKey:kJCModel_EmpSupportOrderListAmount fromDictionary:dict];
            self.customerPrepare = [JCModel_EmpSupportOrderCustomerPrepare modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderListCustomerPrepare]];
            self.isAgent = [[self objectOrNilForKey:kJCModel_EmpSupportOrderListIsAgent fromDictionary:dict] doubleValue];
            self.difBalance = [self objectOrNilForKey:kJCModel_EmpSupportOrderListDifBalance fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_EmpSupportOrderListProcessId fromDictionary:dict];
            self.preId = [[self objectOrNilForKey:kJCModel_EmpSupportOrderListPreId fromDictionary:dict] doubleValue];
            self.customerId = [[self objectOrNilForKey:kJCModel_EmpSupportOrderListCustomerId fromDictionary:dict] doubleValue];
            self.endTime = [self objectOrNilForKey:kJCModel_EmpSupportOrderListEndTime fromDictionary:dict];
            self.franProbation = [JCModel_EmpSupportOrderFranProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderListFranProbation]];
            self.type = [self objectOrNilForKey:kJCModel_EmpSupportOrderListType fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_EmpSupportOrderListGetamount fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_EmpSupportOrderListFranchiser fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_EmpSupportOrderListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_EmpSupportOrderListGuide fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kJCModel_EmpSupportOrderListUid fromDictionary:dict] doubleValue];
            self.orderPresents = [self objectOrNilForKey:kJCModel_EmpSupportOrderListOrderPresents fromDictionary:dict];
            self.cusType = [self objectOrNilForKey:kJCModel_EmpSupportOrderListCusType fromDictionary:dict];
            self.customer = [JCModel_EmpSupportOrderCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderListCustomer]];
            self.franchiserDetail = [JCModel_EmpSupportOrderFranchiserDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderListFranchiserDetail]];
            self.comments = [self objectOrNilForKey:kJCModel_EmpSupportOrderListComments fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_EmpSupportOrderListCreateTime fromDictionary:dict];
            self.orderCosts = [self objectOrNilForKey:kJCModel_EmpSupportOrderListOrderCosts fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.com forKey:kJCModel_EmpSupportOrderListCom];
    [mutableDict setValue:self.status forKey:kJCModel_EmpSupportOrderListStatus];
    [mutableDict setValue:self.amount forKey:kJCModel_EmpSupportOrderListAmount];
    [mutableDict setValue:[self.customerPrepare dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderListCustomerPrepare];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAgent] forKey:kJCModel_EmpSupportOrderListIsAgent];
    [mutableDict setValue:self.difBalance forKey:kJCModel_EmpSupportOrderListDifBalance];
    [mutableDict setValue:self.processId forKey:kJCModel_EmpSupportOrderListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preId] forKey:kJCModel_EmpSupportOrderListPreId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_EmpSupportOrderListCustomerId];
    [mutableDict setValue:self.endTime forKey:kJCModel_EmpSupportOrderListEndTime];
    [mutableDict setValue:[self.franProbation dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderListFranProbation];
    [mutableDict setValue:self.type forKey:kJCModel_EmpSupportOrderListType];
    [mutableDict setValue:self.getamount forKey:kJCModel_EmpSupportOrderListGetamount];
    [mutableDict setValue:self.franchiser forKey:kJCModel_EmpSupportOrderListFranchiser];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_EmpSupportOrderListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_EmpSupportOrderListGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_EmpSupportOrderListUid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_EmpSupportOrderListOrderPresents];
    [mutableDict setValue:self.cusType forKey:kJCModel_EmpSupportOrderListCusType];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderListCustomer];
    [mutableDict setValue:[self.franchiserDetail dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderListFranchiserDetail];
    [mutableDict setValue:self.comments forKey:kJCModel_EmpSupportOrderListComments];
    [mutableDict setValue:self.createTime forKey:kJCModel_EmpSupportOrderListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_EmpSupportOrderListOrderCosts];

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

    self.com = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListCom];
    self.status = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListStatus];
    self.amount = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListAmount];
    self.customerPrepare = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListCustomerPrepare];
    self.isAgent = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderListIsAgent];
    self.difBalance = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListDifBalance];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListProcessId];
    self.preId = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderListPreId];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderListCustomerId];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListEndTime];
    self.franProbation = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListFranProbation];
    self.type = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListType];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListGetamount];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListFranchiser];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderListGuide];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderListUid];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListOrderPresents];
    self.cusType = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListCusType];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListCustomer];
    self.franchiserDetail = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListFranchiserDetail];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListComments];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListCreateTime];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderListOrderCosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_com forKey:kJCModel_EmpSupportOrderListCom];
    [aCoder encodeObject:_status forKey:kJCModel_EmpSupportOrderListStatus];
    [aCoder encodeObject:_amount forKey:kJCModel_EmpSupportOrderListAmount];
    [aCoder encodeObject:_customerPrepare forKey:kJCModel_EmpSupportOrderListCustomerPrepare];
    [aCoder encodeDouble:_isAgent forKey:kJCModel_EmpSupportOrderListIsAgent];
    [aCoder encodeObject:_difBalance forKey:kJCModel_EmpSupportOrderListDifBalance];
    [aCoder encodeObject:_processId forKey:kJCModel_EmpSupportOrderListProcessId];
    [aCoder encodeDouble:_preId forKey:kJCModel_EmpSupportOrderListPreId];
    [aCoder encodeDouble:_customerId forKey:kJCModel_EmpSupportOrderListCustomerId];
    [aCoder encodeObject:_endTime forKey:kJCModel_EmpSupportOrderListEndTime];
    [aCoder encodeObject:_franProbation forKey:kJCModel_EmpSupportOrderListFranProbation];
    [aCoder encodeObject:_type forKey:kJCModel_EmpSupportOrderListType];
    [aCoder encodeObject:_getamount forKey:kJCModel_EmpSupportOrderListGetamount];
    [aCoder encodeObject:_franchiser forKey:kJCModel_EmpSupportOrderListFranchiser];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_EmpSupportOrderListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_EmpSupportOrderListGuide];
    [aCoder encodeDouble:_uid forKey:kJCModel_EmpSupportOrderListUid];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_EmpSupportOrderListOrderPresents];
    [aCoder encodeObject:_cusType forKey:kJCModel_EmpSupportOrderListCusType];
    [aCoder encodeObject:_customer forKey:kJCModel_EmpSupportOrderListCustomer];
    [aCoder encodeObject:_franchiserDetail forKey:kJCModel_EmpSupportOrderListFranchiserDetail];
    [aCoder encodeObject:_comments forKey:kJCModel_EmpSupportOrderListComments];
    [aCoder encodeObject:_createTime forKey:kJCModel_EmpSupportOrderListCreateTime];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_EmpSupportOrderListOrderCosts];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderList *copy = [[JCModel_EmpSupportOrderList alloc] init];
    
    
    
    if (copy) {

        copy.com = [self.com copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.amount = [self.amount copyWithZone:zone];
        copy.customerPrepare = [self.customerPrepare copyWithZone:zone];
        copy.isAgent = self.isAgent;
        copy.difBalance = [self.difBalance copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.preId = self.preId;
        copy.customerId = self.customerId;
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
