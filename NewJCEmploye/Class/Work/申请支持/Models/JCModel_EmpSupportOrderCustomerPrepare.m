//
//  JCModel_EmpSupportOrderCustomerPrepare.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderCustomerPrepare.h"


NSString *const kJCModel_EmpSupportOrderCustomerPrepareId = @"id";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareGuide = @"guide";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareAreaId = @"areaId";
NSString *const kJCModel_EmpSupportOrderCustomerPreparePhone = @"phone";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareDescription = @"description";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareIntroducer = @"introducer";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareSex = @"sex";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareFrom = @"from";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareIntroducerName = @"introducerName";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareWeChat = @"weChat";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareXpath = @"xpath";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareCreateTime = @"createTime";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareAddress = @"address";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareIsRegister = @"isRegister";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareAccount = @"account";
NSString *const kJCModel_EmpSupportOrderCustomerPrepareName = @"name";


@interface JCModel_EmpSupportOrderCustomerPrepare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderCustomerPrepare

@synthesize customerPrepareIdentifier = _customerPrepareIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize phone = _phone;
@synthesize customerPrepareDescription = _customerPrepareDescription;
@synthesize introducer = _introducer;
@synthesize sex = _sex;
@synthesize from = _from;
@synthesize introducerName = _introducerName;
@synthesize weChat = _weChat;
@synthesize xpath = _xpath;
@synthesize createTime = _createTime;
@synthesize address = _address;
@synthesize isRegister = _isRegister;
@synthesize account = _account;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.customerPrepareIdentifier = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareAreaId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPreparePhone fromDictionary:dict];
            self.customerPrepareDescription = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareDescription fromDictionary:dict];
            self.introducer = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducer fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareSex fromDictionary:dict];
            self.from = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareFrom fromDictionary:dict] doubleValue];
            self.introducerName = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducerName fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareAddress fromDictionary:dict];
            self.isRegister = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareIsRegister fromDictionary:dict] doubleValue];
            self.account = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerPrepareName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerPrepareIdentifier] forKey:kJCModel_EmpSupportOrderCustomerPrepareId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_EmpSupportOrderCustomerPrepareGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_EmpSupportOrderCustomerPrepareAreaId];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpSupportOrderCustomerPreparePhone];
    [mutableDict setValue:self.customerPrepareDescription forKey:kJCModel_EmpSupportOrderCustomerPrepareDescription];
    [mutableDict setValue:self.introducer forKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducer];
    [mutableDict setValue:self.sex forKey:kJCModel_EmpSupportOrderCustomerPrepareSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.from] forKey:kJCModel_EmpSupportOrderCustomerPrepareFrom];
    [mutableDict setValue:self.introducerName forKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducerName];
    [mutableDict setValue:self.weChat forKey:kJCModel_EmpSupportOrderCustomerPrepareWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_EmpSupportOrderCustomerPrepareXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_EmpSupportOrderCustomerPrepareCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_EmpSupportOrderCustomerPrepareAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isRegister] forKey:kJCModel_EmpSupportOrderCustomerPrepareIsRegister];
    [mutableDict setValue:self.account forKey:kJCModel_EmpSupportOrderCustomerPrepareAccount];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderCustomerPrepareName];

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

    self.customerPrepareIdentifier = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerPrepareId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerPrepareGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareAreaId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPreparePhone];
    self.customerPrepareDescription = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareDescription];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducer];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareSex];
    self.from = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerPrepareFrom];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducerName];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareAddress];
    self.isRegister = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerPrepareIsRegister];
    self.account = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerPrepareName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerPrepareIdentifier forKey:kJCModel_EmpSupportOrderCustomerPrepareId];
    [aCoder encodeDouble:_guide forKey:kJCModel_EmpSupportOrderCustomerPrepareGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_EmpSupportOrderCustomerPrepareAreaId];
    [aCoder encodeObject:_phone forKey:kJCModel_EmpSupportOrderCustomerPreparePhone];
    [aCoder encodeObject:_customerPrepareDescription forKey:kJCModel_EmpSupportOrderCustomerPrepareDescription];
    [aCoder encodeObject:_introducer forKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducer];
    [aCoder encodeObject:_sex forKey:kJCModel_EmpSupportOrderCustomerPrepareSex];
    [aCoder encodeDouble:_from forKey:kJCModel_EmpSupportOrderCustomerPrepareFrom];
    [aCoder encodeObject:_introducerName forKey:kJCModel_EmpSupportOrderCustomerPrepareIntroducerName];
    [aCoder encodeObject:_weChat forKey:kJCModel_EmpSupportOrderCustomerPrepareWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_EmpSupportOrderCustomerPrepareXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_EmpSupportOrderCustomerPrepareCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_EmpSupportOrderCustomerPrepareAddress];
    [aCoder encodeDouble:_isRegister forKey:kJCModel_EmpSupportOrderCustomerPrepareIsRegister];
    [aCoder encodeObject:_account forKey:kJCModel_EmpSupportOrderCustomerPrepareAccount];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderCustomerPrepareName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderCustomerPrepare *copy = [[JCModel_EmpSupportOrderCustomerPrepare alloc] init];
    
    
    
    if (copy) {

        copy.customerPrepareIdentifier = self.customerPrepareIdentifier;
        copy.guide = self.guide;
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.customerPrepareDescription = [self.customerPrepareDescription copyWithZone:zone];
        copy.introducer = [self.introducer copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.from = self.from;
        copy.introducerName = [self.introducerName copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.isRegister = self.isRegister;
        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
