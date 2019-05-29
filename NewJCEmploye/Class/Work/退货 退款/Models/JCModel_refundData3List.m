//
//  JCModel_refundData3List.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3List.h"
#import "JCModel_refundData3Staff.h"
#import "JCModel_refundData3Customer.h"


NSString *const kJCModel_refundData3ListId = @"id";
NSString *const kJCModel_refundData3ListGuide = @"guide";
NSString *const kJCModel_refundData3ListStaff = @"staff";
NSString *const kJCModel_refundData3ListProcessId = @"processId";
NSString *const kJCModel_refundData3ListCus = @"cus";
NSString *const kJCModel_refundData3ListGetamount = @"getamount";
NSString *const kJCModel_refundData3ListPayments = @"payments";
NSString *const kJCModel_refundData3ListAccountant = @"accountant";
NSString *const kJCModel_refundData3ListCom = @"com";
NSString *const kJCModel_refundData3ListCustomer = @"customer";
NSString *const kJCModel_refundData3ListRefundmentCosts = @"refundmentCosts";
NSString *const kJCModel_refundData3ListType = @"type";
NSString *const kJCModel_refundData3ListOid = @"oid";
NSString *const kJCModel_refundData3ListCreateTime = @"createTime";
NSString *const kJCModel_refundData3ListRefundment = @"refundment";
NSString *const kJCModel_refundData3ListFran = @"fran";
NSString *const kJCModel_refundData3ListStoreHouse = @"storeHouse";
NSString *const kJCModel_refundData3ListStatus = @"status";


@interface JCModel_refundData3List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3List

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
            self.listIdentifier = [self objectOrNilForKey:kJCModel_refundData3ListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_refundData3ListGuide fromDictionary:dict] doubleValue];
            self.staff = [JCModel_refundData3Staff modelObjectWithDictionary:[dict objectForKey:kJCModel_refundData3ListStaff]];
            self.processId = [self objectOrNilForKey:kJCModel_refundData3ListProcessId fromDictionary:dict];
            self.cus = [[self objectOrNilForKey:kJCModel_refundData3ListCus fromDictionary:dict] doubleValue];
            self.getamount = [[self objectOrNilForKey:kJCModel_refundData3ListGetamount fromDictionary:dict] doubleValue];
            self.payments = [self objectOrNilForKey:kJCModel_refundData3ListPayments fromDictionary:dict];
            self.accountant = [self objectOrNilForKey:kJCModel_refundData3ListAccountant fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_refundData3ListCom fromDictionary:dict];
            self.customer = [JCModel_refundData3Customer modelObjectWithDictionary:[dict objectForKey:kJCModel_refundData3ListCustomer]];
            self.refundmentCosts = [self objectOrNilForKey:kJCModel_refundData3ListRefundmentCosts fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_refundData3ListType fromDictionary:dict];
            self.oid = [self objectOrNilForKey:kJCModel_refundData3ListOid fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_refundData3ListCreateTime fromDictionary:dict];
            self.refundment = [self objectOrNilForKey:kJCModel_refundData3ListRefundment fromDictionary:dict];
            self.fran = [self objectOrNilForKey:kJCModel_refundData3ListFran fromDictionary:dict];
            self.storeHouse = [self objectOrNilForKey:kJCModel_refundData3ListStoreHouse fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_refundData3ListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_refundData3ListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_refundData3ListGuide];
    [mutableDict setValue:[self.staff dictionaryRepresentation] forKey:kJCModel_refundData3ListStaff];
    [mutableDict setValue:self.processId forKey:kJCModel_refundData3ListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cus] forKey:kJCModel_refundData3ListCus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_refundData3ListGetamount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPayments] forKey:kJCModel_refundData3ListPayments];
    [mutableDict setValue:self.accountant forKey:kJCModel_refundData3ListAccountant];
    [mutableDict setValue:self.com forKey:kJCModel_refundData3ListCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_refundData3ListCustomer];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRefundmentCosts] forKey:kJCModel_refundData3ListRefundmentCosts];
    [mutableDict setValue:self.type forKey:kJCModel_refundData3ListType];
    [mutableDict setValue:self.oid forKey:kJCModel_refundData3ListOid];
    [mutableDict setValue:self.createTime forKey:kJCModel_refundData3ListCreateTime];
    [mutableDict setValue:self.refundment forKey:kJCModel_refundData3ListRefundment];
    [mutableDict setValue:self.fran forKey:kJCModel_refundData3ListFran];
    [mutableDict setValue:self.storeHouse forKey:kJCModel_refundData3ListStoreHouse];
    [mutableDict setValue:self.status forKey:kJCModel_refundData3ListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_refundData3ListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_refundData3ListGuide];
    self.staff = [aDecoder decodeObjectForKey:kJCModel_refundData3ListStaff];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_refundData3ListProcessId];
    self.cus = [aDecoder decodeDoubleForKey:kJCModel_refundData3ListCus];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_refundData3ListGetamount];
    self.payments = [aDecoder decodeObjectForKey:kJCModel_refundData3ListPayments];
    self.accountant = [aDecoder decodeObjectForKey:kJCModel_refundData3ListAccountant];
    self.com = [aDecoder decodeObjectForKey:kJCModel_refundData3ListCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_refundData3ListCustomer];
    self.refundmentCosts = [aDecoder decodeObjectForKey:kJCModel_refundData3ListRefundmentCosts];
    self.type = [aDecoder decodeObjectForKey:kJCModel_refundData3ListType];
    self.oid = [aDecoder decodeObjectForKey:kJCModel_refundData3ListOid];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_refundData3ListCreateTime];
    self.refundment = [aDecoder decodeObjectForKey:kJCModel_refundData3ListRefundment];
    self.fran = [aDecoder decodeObjectForKey:kJCModel_refundData3ListFran];
    self.storeHouse = [aDecoder decodeObjectForKey:kJCModel_refundData3ListStoreHouse];
    self.status = [aDecoder decodeObjectForKey:kJCModel_refundData3ListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_refundData3ListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_refundData3ListGuide];
    [aCoder encodeObject:_staff forKey:kJCModel_refundData3ListStaff];
    [aCoder encodeObject:_processId forKey:kJCModel_refundData3ListProcessId];
    [aCoder encodeDouble:_cus forKey:kJCModel_refundData3ListCus];
    [aCoder encodeDouble:_getamount forKey:kJCModel_refundData3ListGetamount];
    [aCoder encodeObject:_payments forKey:kJCModel_refundData3ListPayments];
    [aCoder encodeObject:_accountant forKey:kJCModel_refundData3ListAccountant];
    [aCoder encodeObject:_com forKey:kJCModel_refundData3ListCom];
    [aCoder encodeObject:_customer forKey:kJCModel_refundData3ListCustomer];
    [aCoder encodeObject:_refundmentCosts forKey:kJCModel_refundData3ListRefundmentCosts];
    [aCoder encodeObject:_type forKey:kJCModel_refundData3ListType];
    [aCoder encodeObject:_oid forKey:kJCModel_refundData3ListOid];
    [aCoder encodeObject:_createTime forKey:kJCModel_refundData3ListCreateTime];
    [aCoder encodeObject:_refundment forKey:kJCModel_refundData3ListRefundment];
    [aCoder encodeObject:_fran forKey:kJCModel_refundData3ListFran];
    [aCoder encodeObject:_storeHouse forKey:kJCModel_refundData3ListStoreHouse];
    [aCoder encodeObject:_status forKey:kJCModel_refundData3ListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3List *copy = [[JCModel_refundData3List alloc] init];
    
    
    
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
        copy.refundment = [self.refundment copyWithZone:zone];
        copy.fran = [self.fran copyWithZone:zone];
        copy.storeHouse = [self.storeHouse copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
