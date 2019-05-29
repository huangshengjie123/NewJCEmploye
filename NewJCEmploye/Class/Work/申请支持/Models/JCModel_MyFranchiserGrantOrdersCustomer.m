//
//  JCModel_MyFranchiserGrantOrdersCustomer.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersCustomer.h"
#import "JCModel_MyFranchiserGrantOrdersCustomerAddressList.h"
#import "JCModel_MyFranchiserGrantOrdersCustomerDetail.h"


NSString *const kJCModel_MyFranchiserGrantOrdersCustomerWxopenid = @"wxopenid";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAccount = @"account";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerWeChat = @"weChat";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerSex = @"sex";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerIsRegister = @"isRegister";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAreaId = @"areaId";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerIntroducerName = @"introducerName";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerName = @"name";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerTag = @"tag";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerType = @"type";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerIntroducer = @"introducer";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerCurCom = @"curCom";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerGuide = @"guide";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPhone = @"phone";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerFrom = @"from";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerXpath = @"xpath";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerCreateTime = @"createTime";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddress = @"address";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDescription = @"description";


@interface JCModel_MyFranchiserGrantOrdersCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersCustomer

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
            self.wxopenid = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerWxopenid fromDictionary:dict];
    NSObject *receivedJCModel_MyFranchiserGrantOrdersCustomerAddressList = [dict objectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_MyFranchiserGrantOrdersCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_MyFranchiserGrantOrdersCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyFranchiserGrantOrdersCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyFranchiserGrantOrdersCustomerAddressList addObject:[JCModel_MyFranchiserGrantOrdersCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyFranchiserGrantOrdersCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyFranchiserGrantOrdersCustomerAddressList addObject:[JCModel_MyFranchiserGrantOrdersCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyFranchiserGrantOrdersCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_MyFranchiserGrantOrdersCustomerAddressList];
            self.account = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAccount fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerWeChat fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerSex fromDictionary:dict];
            self.isRegister = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerIsRegister fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAreaId fromDictionary:dict];
            self.introducerName = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducerName fromDictionary:dict];
            self.customerDetail = [JCModel_MyFranchiserGrantOrdersCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerDetail]];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerName fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerType fromDictionary:dict];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerId fromDictionary:dict] doubleValue];
            self.introducer = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducer fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerCurCom fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerGuide fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPhone fromDictionary:dict];
            self.from = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerFrom fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddress fromDictionary:dict];
            self.customerDescription = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_MyFranchiserGrantOrdersCustomerWxopenid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerAddressList];
    [mutableDict setValue:self.account forKey:kJCModel_MyFranchiserGrantOrdersCustomerAccount];
    [mutableDict setValue:self.weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerWeChat];
    [mutableDict setValue:self.sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerSex];
    [mutableDict setValue:self.isRegister forKey:kJCModel_MyFranchiserGrantOrdersCustomerIsRegister];
    [mutableDict setValue:self.areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAreaId];
    [mutableDict setValue:self.introducerName forKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducerName];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerDetail];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersCustomerName];
    [mutableDict setValue:self.tag forKey:kJCModel_MyFranchiserGrantOrdersCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_MyFranchiserGrantOrdersCustomerType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_MyFranchiserGrantOrdersCustomerId];
    [mutableDict setValue:self.introducer forKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducer];
    [mutableDict setValue:self.curCom forKey:kJCModel_MyFranchiserGrantOrdersCustomerCurCom];
    [mutableDict setValue:self.guide forKey:kJCModel_MyFranchiserGrantOrdersCustomerGuide];
    [mutableDict setValue:self.phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerPhone];
    [mutableDict setValue:self.from forKey:kJCModel_MyFranchiserGrantOrdersCustomerFrom];
    [mutableDict setValue:self.xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddress];
    [mutableDict setValue:self.customerDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerDescription];

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

    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerWxopenid];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerAddressList];
    self.account = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAccount];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerWeChat];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerSex];
    self.isRegister = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerIsRegister];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAreaId];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducerName];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerDetail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerName];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerType];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerId];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducer];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCurCom];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerGuide];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPhone];
    self.from = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerFrom];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddress];
    self.customerDescription = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wxopenid forKey:kJCModel_MyFranchiserGrantOrdersCustomerWxopenid];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerAddressList];
    [aCoder encodeObject:_account forKey:kJCModel_MyFranchiserGrantOrdersCustomerAccount];
    [aCoder encodeObject:_weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerWeChat];
    [aCoder encodeObject:_sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerSex];
    [aCoder encodeObject:_isRegister forKey:kJCModel_MyFranchiserGrantOrdersCustomerIsRegister];
    [aCoder encodeObject:_areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAreaId];
    [aCoder encodeObject:_introducerName forKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducerName];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_MyFranchiserGrantOrdersCustomerCustomerDetail];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersCustomerName];
    [aCoder encodeObject:_tag forKey:kJCModel_MyFranchiserGrantOrdersCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_MyFranchiserGrantOrdersCustomerType];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_MyFranchiserGrantOrdersCustomerId];
    [aCoder encodeObject:_introducer forKey:kJCModel_MyFranchiserGrantOrdersCustomerIntroducer];
    [aCoder encodeObject:_curCom forKey:kJCModel_MyFranchiserGrantOrdersCustomerCurCom];
    [aCoder encodeObject:_guide forKey:kJCModel_MyFranchiserGrantOrdersCustomerGuide];
    [aCoder encodeObject:_phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerPhone];
    [aCoder encodeObject:_from forKey:kJCModel_MyFranchiserGrantOrdersCustomerFrom];
    [aCoder encodeObject:_xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddress];
    [aCoder encodeObject:_customerDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerDescription];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersCustomer *copy = [[JCModel_MyFranchiserGrantOrdersCustomer alloc] init];
    
    
    
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
