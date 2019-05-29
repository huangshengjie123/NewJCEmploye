//
//  JCModel_salesReturnList.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnList.h"
#import "JCModel_salesReturnStaff.h"
#import "JCModel_salesReturnCustomer.h"


NSString *const kJCModel_salesReturnListId = @"id";
NSString *const kJCModel_salesReturnListGuide = @"guide";
NSString *const kJCModel_salesReturnListStaff = @"staff";
NSString *const kJCModel_salesReturnListProcessId = @"processId";
NSString *const kJCModel_salesReturnListCus = @"cus";
NSString *const kJCModel_salesReturnListGetamount = @"getamount";
NSString *const kJCModel_salesReturnListPayments = @"payments";
NSString *const kJCModel_salesReturnListAccountant = @"accountant";
NSString *const kJCModel_salesReturnListCom = @"com";
NSString *const kJCModel_salesReturnListCustomer = @"customer";
NSString *const kJCModel_salesReturnListRefundmentCosts = @"refundmentCosts";
NSString *const kJCModel_salesReturnListType = @"type";
NSString *const kJCModel_salesReturnListOid = @"oid";
NSString *const kJCModel_salesReturnListCreateTime = @"createTime";
NSString *const kJCModel_salesReturnListRefundment = @"refundment";
NSString *const kJCModel_salesReturnListFran = @"fran";
NSString *const kJCModel_salesReturnListStoreHouse = @"storeHouse";
NSString *const kJCModel_salesReturnListStatus = @"status";


@interface JCModel_salesReturnList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize staff = _staff;
@synthesize processId = _processId;
@synthesize cus = _cus;
@synthesize getamount = _getamount;
@synthesize payments = _payments;
@synthesize accountant = _accountant;
@synthesize com = _com;
@synthesize customer = _customer;
@synthesize refundmentCosts = _refundmentCosts;
@synthesize type = _type;
@synthesize oid = _oid;
@synthesize createTime = _createTime;
@synthesize refundment = _refundment;
@synthesize fran = _fran;
@synthesize storeHouse = _storeHouse;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_salesReturnListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_salesReturnListGuide fromDictionary:dict] doubleValue];
            self.staff = [JCModel_salesReturnStaff modelObjectWithDictionary:[dict objectForKey:kJCModel_salesReturnListStaff]];
            self.processId = [self objectOrNilForKey:kJCModel_salesReturnListProcessId fromDictionary:dict];
            self.cus = [[self objectOrNilForKey:kJCModel_salesReturnListCus fromDictionary:dict] doubleValue];
            self.getamount = [[self objectOrNilForKey:kJCModel_salesReturnListGetamount fromDictionary:dict] doubleValue];
            self.payments = [self objectOrNilForKey:kJCModel_salesReturnListPayments fromDictionary:dict];
            self.accountant = [self objectOrNilForKey:kJCModel_salesReturnListAccountant fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_salesReturnListCom fromDictionary:dict];
            self.customer = [JCModel_salesReturnCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_salesReturnListCustomer]];
            self.refundmentCosts = [self objectOrNilForKey:kJCModel_salesReturnListRefundmentCosts fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_salesReturnListType fromDictionary:dict];
            self.oid = [self objectOrNilForKey:kJCModel_salesReturnListOid fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_salesReturnListCreateTime fromDictionary:dict];
            self.refundment = [[self objectOrNilForKey:kJCModel_salesReturnListRefundment fromDictionary:dict]doubleValue];
            self.fran = [self objectOrNilForKey:kJCModel_salesReturnListFran fromDictionary:dict];
            self.storeHouse = [self objectOrNilForKey:kJCModel_salesReturnListStoreHouse fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_salesReturnListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_salesReturnListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_salesReturnListGuide];
    [mutableDict setValue:[self.staff dictionaryRepresentation] forKey:kJCModel_salesReturnListStaff];
    [mutableDict setValue:self.processId forKey:kJCModel_salesReturnListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cus] forKey:kJCModel_salesReturnListCus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_salesReturnListGetamount];
    NSMutableArray *tempArrayForPayments = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.payments) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPayments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPayments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPayments] forKey:kJCModel_salesReturnListPayments];
    [mutableDict setValue:self.accountant forKey:kJCModel_salesReturnListAccountant];
    [mutableDict setValue:self.com forKey:kJCModel_salesReturnListCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_salesReturnListCustomer];
    NSMutableArray *tempArrayForRefundmentCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.refundmentCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRefundmentCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRefundmentCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRefundmentCosts] forKey:kJCModel_salesReturnListRefundmentCosts];
    [mutableDict setValue:self.type forKey:kJCModel_salesReturnListType];
    [mutableDict setValue:self.oid forKey:kJCModel_salesReturnListOid];
    [mutableDict setValue:self.createTime forKey:kJCModel_salesReturnListCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refundment] forKey:kJCModel_salesReturnListRefundment];

    [mutableDict setValue:self.fran forKey:kJCModel_salesReturnListFran];
    [mutableDict setValue:self.storeHouse forKey:kJCModel_salesReturnListStoreHouse];
    [mutableDict setValue:self.status forKey:kJCModel_salesReturnListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_salesReturnListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_salesReturnListGuide];
    self.staff = [aDecoder decodeObjectForKey:kJCModel_salesReturnListStaff];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_salesReturnListProcessId];
    self.cus = [aDecoder decodeDoubleForKey:kJCModel_salesReturnListCus];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_salesReturnListGetamount];
    self.payments = [aDecoder decodeObjectForKey:kJCModel_salesReturnListPayments];
    self.accountant = [aDecoder decodeObjectForKey:kJCModel_salesReturnListAccountant];
    self.com = [aDecoder decodeObjectForKey:kJCModel_salesReturnListCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_salesReturnListCustomer];
    self.refundmentCosts = [aDecoder decodeObjectForKey:kJCModel_salesReturnListRefundmentCosts];
    self.type = [aDecoder decodeObjectForKey:kJCModel_salesReturnListType];
    self.oid = [aDecoder decodeObjectForKey:kJCModel_salesReturnListOid];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_salesReturnListCreateTime];
    self.refundment = [aDecoder decodeDoubleForKey:kJCModel_salesReturnListRefundment];

    self.fran = [aDecoder decodeObjectForKey:kJCModel_salesReturnListFran];
    self.storeHouse = [aDecoder decodeObjectForKey:kJCModel_salesReturnListStoreHouse];
    self.status = [aDecoder decodeObjectForKey:kJCModel_salesReturnListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_salesReturnListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_salesReturnListGuide];
    [aCoder encodeObject:_staff forKey:kJCModel_salesReturnListStaff];
    [aCoder encodeObject:_processId forKey:kJCModel_salesReturnListProcessId];
    [aCoder encodeDouble:_cus forKey:kJCModel_salesReturnListCus];
    [aCoder encodeDouble:_getamount forKey:kJCModel_salesReturnListGetamount];
    [aCoder encodeObject:_payments forKey:kJCModel_salesReturnListPayments];
    [aCoder encodeObject:_accountant forKey:kJCModel_salesReturnListAccountant];
    [aCoder encodeObject:_com forKey:kJCModel_salesReturnListCom];
    [aCoder encodeObject:_customer forKey:kJCModel_salesReturnListCustomer];
    [aCoder encodeObject:_refundmentCosts forKey:kJCModel_salesReturnListRefundmentCosts];
    [aCoder encodeObject:_type forKey:kJCModel_salesReturnListType];
    [aCoder encodeObject:_oid forKey:kJCModel_salesReturnListOid];
    [aCoder encodeObject:_createTime forKey:kJCModel_salesReturnListCreateTime];
    [aCoder encodeDouble:_refundment forKey:kJCModel_salesReturnListRefundment];
    [aCoder encodeObject:_fran forKey:kJCModel_salesReturnListFran];
    [aCoder encodeObject:_storeHouse forKey:kJCModel_salesReturnListStoreHouse];
    [aCoder encodeObject:_status forKey:kJCModel_salesReturnListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnList *copy = [[JCModel_salesReturnList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.guide = self.guide;
        copy.staff = [self.staff copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.cus = self.cus;
        copy.getamount = self.getamount;
        copy.payments = [self.payments copyWithZone:zone];
        copy.accountant = [self.accountant copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.customer = [self.customer copyWithZone:zone];
        copy.refundmentCosts = [self.refundmentCosts copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.oid = [self.oid copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.getamount = self.refundment;

        copy.fran = [self.fran copyWithZone:zone];
        copy.storeHouse = [self.storeHouse copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
