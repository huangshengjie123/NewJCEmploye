//
//  JCModel_probationOrderCustomer.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderCustomer.h"


NSString *const kJCModel_probationOrderCustomerId = @"id";
NSString *const kJCModel_probationOrderCustomerGuide = @"guide";
NSString *const kJCModel_probationOrderCustomerAreaId = @"areaId";
NSString *const kJCModel_probationOrderCustomerPhone = @"phone";
NSString *const kJCModel_probationOrderCustomerDescription = @"description";
NSString *const kJCModel_probationOrderCustomerIntroducer = @"introducer";
NSString *const kJCModel_probationOrderCustomerSex = @"sex";
NSString *const kJCModel_probationOrderCustomerFrom = @"from";
NSString *const kJCModel_probationOrderCustomerIntroducerName = @"introducerName";
NSString *const kJCModel_probationOrderCustomerWeChat = @"weChat";
NSString *const kJCModel_probationOrderCustomerXpath = @"xpath";
NSString *const kJCModel_probationOrderCustomerCreateTime = @"createTime";
NSString *const kJCModel_probationOrderCustomerAddress = @"address";
NSString *const kJCModel_probationOrderCustomerIsRegister = @"isRegister";
NSString *const kJCModel_probationOrderCustomerAccount = @"account";
NSString *const kJCModel_probationOrderCustomerName = @"name";


@interface JCModel_probationOrderCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderCustomer

@synthesize customerIdentifier = _customerIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize phone = _phone;
@synthesize customerDescription = _customerDescription;
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
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_probationOrderCustomerId fromDictionary:dict] doubleValue];
            self.guide = [self objectOrNilForKey:kJCModel_probationOrderCustomerGuide fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_probationOrderCustomerAreaId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_probationOrderCustomerPhone fromDictionary:dict];
            self.customerDescription = [self objectOrNilForKey:kJCModel_probationOrderCustomerDescription fromDictionary:dict];
            self.introducer = [self objectOrNilForKey:kJCModel_probationOrderCustomerIntroducer fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_probationOrderCustomerSex fromDictionary:dict];
            self.from = [self objectOrNilForKey:kJCModel_probationOrderCustomerFrom fromDictionary:dict];
            self.introducerName = [self objectOrNilForKey:kJCModel_probationOrderCustomerIntroducerName fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_probationOrderCustomerWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_probationOrderCustomerXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_probationOrderCustomerCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_probationOrderCustomerAddress fromDictionary:dict];
            self.isRegister = [self objectOrNilForKey:kJCModel_probationOrderCustomerIsRegister fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_probationOrderCustomerAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_probationOrderCustomerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_probationOrderCustomerId];
    [mutableDict setValue:self.guide forKey:kJCModel_probationOrderCustomerGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_probationOrderCustomerAreaId];
    [mutableDict setValue:self.phone forKey:kJCModel_probationOrderCustomerPhone];
    [mutableDict setValue:self.customerDescription forKey:kJCModel_probationOrderCustomerDescription];
    [mutableDict setValue:self.introducer forKey:kJCModel_probationOrderCustomerIntroducer];
    [mutableDict setValue:self.sex forKey:kJCModel_probationOrderCustomerSex];
    [mutableDict setValue:self.from forKey:kJCModel_probationOrderCustomerFrom];
    [mutableDict setValue:self.introducerName forKey:kJCModel_probationOrderCustomerIntroducerName];
    [mutableDict setValue:self.weChat forKey:kJCModel_probationOrderCustomerWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_probationOrderCustomerXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_probationOrderCustomerCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_probationOrderCustomerAddress];
    [mutableDict setValue:self.isRegister forKey:kJCModel_probationOrderCustomerIsRegister];
    [mutableDict setValue:self.account forKey:kJCModel_probationOrderCustomerAccount];
    [mutableDict setValue:self.name forKey:kJCModel_probationOrderCustomerName];

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

    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_probationOrderCustomerId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerAreaId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerPhone];
    self.customerDescription = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerDescription];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerIntroducer];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerSex];
    self.from = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerFrom];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerIntroducerName];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerAddress];
    self.isRegister = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerIsRegister];
    self.account = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_probationOrderCustomerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_probationOrderCustomerId];
    [aCoder encodeObject:_guide forKey:kJCModel_probationOrderCustomerGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_probationOrderCustomerAreaId];
    [aCoder encodeObject:_phone forKey:kJCModel_probationOrderCustomerPhone];
    [aCoder encodeObject:_customerDescription forKey:kJCModel_probationOrderCustomerDescription];
    [aCoder encodeObject:_introducer forKey:kJCModel_probationOrderCustomerIntroducer];
    [aCoder encodeObject:_sex forKey:kJCModel_probationOrderCustomerSex];
    [aCoder encodeObject:_from forKey:kJCModel_probationOrderCustomerFrom];
    [aCoder encodeObject:_introducerName forKey:kJCModel_probationOrderCustomerIntroducerName];
    [aCoder encodeObject:_weChat forKey:kJCModel_probationOrderCustomerWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_probationOrderCustomerXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_probationOrderCustomerCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_probationOrderCustomerAddress];
    [aCoder encodeObject:_isRegister forKey:kJCModel_probationOrderCustomerIsRegister];
    [aCoder encodeObject:_account forKey:kJCModel_probationOrderCustomerAccount];
    [aCoder encodeObject:_name forKey:kJCModel_probationOrderCustomerName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderCustomer *copy = [[JCModel_probationOrderCustomer alloc] init];
    
    
    
    if (copy) {

        copy.customerIdentifier = self.customerIdentifier;
        copy.guide = [self.guide copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.customerDescription = [self.customerDescription copyWithZone:zone];
        copy.introducer = [self.introducer copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.introducerName = [self.introducerName copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.isRegister = [self.isRegister copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
