//
//  JCModel_EmpSupportOrderCustomer.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderCustomer.h"
#import "JCModel_EmpSupportOrderCustomerAddressList.h"
#import "JCModel_EmpSupportOrderCustomerDetail.h"


NSString *const kJCModel_EmpSupportOrderCustomerWxopenid = @"wxopenid";
NSString *const kJCModel_EmpSupportOrderCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_EmpSupportOrderCustomerAccount = @"account";
NSString *const kJCModel_EmpSupportOrderCustomerWeChat = @"weChat";
NSString *const kJCModel_EmpSupportOrderCustomerSex = @"sex";
NSString *const kJCModel_EmpSupportOrderCustomerIsRegister = @"isRegister";
NSString *const kJCModel_EmpSupportOrderCustomerAreaId = @"areaId";
NSString *const kJCModel_EmpSupportOrderCustomerIntroducerName = @"introducerName";
NSString *const kJCModel_EmpSupportOrderCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_EmpSupportOrderCustomerName = @"name";
NSString *const kJCModel_EmpSupportOrderCustomerTag = @"tag";
NSString *const kJCModel_EmpSupportOrderCustomerType = @"type";
NSString *const kJCModel_EmpSupportOrderCustomerId = @"id";
NSString *const kJCModel_EmpSupportOrderCustomerIntroducer = @"introducer";
NSString *const kJCModel_EmpSupportOrderCustomerCurCom = @"curCom";
NSString *const kJCModel_EmpSupportOrderCustomerGuide = @"guide";
NSString *const kJCModel_EmpSupportOrderCustomerPhone = @"phone";
NSString *const kJCModel_EmpSupportOrderCustomerFrom = @"from";
NSString *const kJCModel_EmpSupportOrderCustomerXpath = @"xpath";
NSString *const kJCModel_EmpSupportOrderCustomerCreateTime = @"createTime";
NSString *const kJCModel_EmpSupportOrderCustomerAddress = @"address";
NSString *const kJCModel_EmpSupportOrderCustomerDescription = @"description";


@interface JCModel_EmpSupportOrderCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderCustomer

@synthesize wxopenid = _wxopenid;
@synthesize customerAddressList = _customerAddressList;
@synthesize account = _account;
@synthesize weChat = _weChat;
@synthesize sex = _sex;
@synthesize isRegister = _isRegister;
@synthesize areaId = _areaId;
@synthesize introducerName = _introducerName;
@synthesize customerDetail = _customerDetail;
@synthesize name = _name;
@synthesize tag = _tag;
@synthesize type = _type;
@synthesize customerIdentifier = _customerIdentifier;
@synthesize introducer = _introducer;
@synthesize curCom = _curCom;
@synthesize guide = _guide;
@synthesize phone = _phone;
@synthesize from = _from;
@synthesize xpath = _xpath;
@synthesize createTime = _createTime;
@synthesize address = _address;
@synthesize customerDescription = _customerDescription;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.wxopenid = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerWxopenid fromDictionary:dict];
    NSObject *receivedJCModel_EmpSupportOrderCustomerAddressList = [dict objectForKey:kJCModel_EmpSupportOrderCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_EmpSupportOrderCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_EmpSupportOrderCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_EmpSupportOrderCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_EmpSupportOrderCustomerAddressList addObject:[JCModel_EmpSupportOrderCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_EmpSupportOrderCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_EmpSupportOrderCustomerAddressList addObject:[JCModel_EmpSupportOrderCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_EmpSupportOrderCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_EmpSupportOrderCustomerAddressList];
            self.account = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAccount fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerWeChat fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerSex fromDictionary:dict];
            self.isRegister = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerIsRegister fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAreaId fromDictionary:dict];
            self.introducerName = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerIntroducerName fromDictionary:dict];
            self.customerDetail = [JCModel_EmpSupportOrderCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderCustomerCustomerDetail]];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerName fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerType fromDictionary:dict];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerId fromDictionary:dict] doubleValue];
            self.introducer = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerIntroducer fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerCurCom fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerGuide fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPhone fromDictionary:dict];
            self.from = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerFrom fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddress fromDictionary:dict];
            self.customerDescription = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_EmpSupportOrderCustomerWxopenid];
    NSMutableArray *tempArrayForCustomerAddressList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddressList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomerAddressList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomerAddressList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_EmpSupportOrderCustomerCustomerAddressList];
    [mutableDict setValue:self.account forKey:kJCModel_EmpSupportOrderCustomerAccount];
    [mutableDict setValue:self.weChat forKey:kJCModel_EmpSupportOrderCustomerWeChat];
    [mutableDict setValue:self.sex forKey:kJCModel_EmpSupportOrderCustomerSex];
    [mutableDict setValue:self.isRegister forKey:kJCModel_EmpSupportOrderCustomerIsRegister];
    [mutableDict setValue:self.areaId forKey:kJCModel_EmpSupportOrderCustomerAreaId];
    [mutableDict setValue:self.introducerName forKey:kJCModel_EmpSupportOrderCustomerIntroducerName];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderCustomerCustomerDetail];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderCustomerName];
    [mutableDict setValue:self.tag forKey:kJCModel_EmpSupportOrderCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_EmpSupportOrderCustomerType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_EmpSupportOrderCustomerId];
    [mutableDict setValue:self.introducer forKey:kJCModel_EmpSupportOrderCustomerIntroducer];
    [mutableDict setValue:self.curCom forKey:kJCModel_EmpSupportOrderCustomerCurCom];
    [mutableDict setValue:self.guide forKey:kJCModel_EmpSupportOrderCustomerGuide];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpSupportOrderCustomerPhone];
    [mutableDict setValue:self.from forKey:kJCModel_EmpSupportOrderCustomerFrom];
    [mutableDict setValue:self.xpath forKey:kJCModel_EmpSupportOrderCustomerXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_EmpSupportOrderCustomerCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_EmpSupportOrderCustomerAddress];
    [mutableDict setValue:self.customerDescription forKey:kJCModel_EmpSupportOrderCustomerDescription];

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

    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerWxopenid];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerCustomerAddressList];
    self.account = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAccount];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerWeChat];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerSex];
    self.isRegister = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerIsRegister];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAreaId];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerIntroducerName];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerCustomerDetail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerName];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerType];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerId];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerIntroducer];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerCurCom];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerGuide];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPhone];
    self.from = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerFrom];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddress];
    self.customerDescription = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wxopenid forKey:kJCModel_EmpSupportOrderCustomerWxopenid];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_EmpSupportOrderCustomerCustomerAddressList];
    [aCoder encodeObject:_account forKey:kJCModel_EmpSupportOrderCustomerAccount];
    [aCoder encodeObject:_weChat forKey:kJCModel_EmpSupportOrderCustomerWeChat];
    [aCoder encodeObject:_sex forKey:kJCModel_EmpSupportOrderCustomerSex];
    [aCoder encodeObject:_isRegister forKey:kJCModel_EmpSupportOrderCustomerIsRegister];
    [aCoder encodeObject:_areaId forKey:kJCModel_EmpSupportOrderCustomerAreaId];
    [aCoder encodeObject:_introducerName forKey:kJCModel_EmpSupportOrderCustomerIntroducerName];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_EmpSupportOrderCustomerCustomerDetail];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderCustomerName];
    [aCoder encodeObject:_tag forKey:kJCModel_EmpSupportOrderCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_EmpSupportOrderCustomerType];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_EmpSupportOrderCustomerId];
    [aCoder encodeObject:_introducer forKey:kJCModel_EmpSupportOrderCustomerIntroducer];
    [aCoder encodeObject:_curCom forKey:kJCModel_EmpSupportOrderCustomerCurCom];
    [aCoder encodeObject:_guide forKey:kJCModel_EmpSupportOrderCustomerGuide];
    [aCoder encodeObject:_phone forKey:kJCModel_EmpSupportOrderCustomerPhone];
    [aCoder encodeObject:_from forKey:kJCModel_EmpSupportOrderCustomerFrom];
    [aCoder encodeObject:_xpath forKey:kJCModel_EmpSupportOrderCustomerXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_EmpSupportOrderCustomerCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_EmpSupportOrderCustomerAddress];
    [aCoder encodeObject:_customerDescription forKey:kJCModel_EmpSupportOrderCustomerDescription];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderCustomer *copy = [[JCModel_EmpSupportOrderCustomer alloc] init];
    
    
    
    if (copy) {

        copy.wxopenid = [self.wxopenid copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.isRegister = [self.isRegister copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.introducerName = [self.introducerName copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.customerIdentifier = self.customerIdentifier;
        copy.introducer = [self.introducer copyWithZone:zone];
        copy.curCom = [self.curCom copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.customerDescription = [self.customerDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
