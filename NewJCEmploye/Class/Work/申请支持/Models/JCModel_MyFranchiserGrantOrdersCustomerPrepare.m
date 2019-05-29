//
//  JCModel_MyFranchiserGrantOrdersCustomerPrepare.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersCustomerPrepare.h"


NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareGuide = @"guide";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareAreaId = @"areaId";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPreparePhone = @"phone";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareDescription = @"description";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducer = @"introducer";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareSex = @"sex";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareFrom = @"from";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducerName = @"introducerName";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareWeChat = @"weChat";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareXpath = @"xpath";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareCreateTime = @"createTime";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareAddress = @"address";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareIsRegister = @"isRegister";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareAccount = @"account";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerPrepareName = @"name";


@interface JCModel_MyFranchiserGrantOrdersCustomerPrepare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersCustomerPrepare

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
            self.customerPrepareIdentifier = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAreaId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPreparePhone fromDictionary:dict];
            self.customerPrepareDescription = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareDescription fromDictionary:dict];
            self.introducer = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducer fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareSex fromDictionary:dict];
            self.from = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareFrom fromDictionary:dict] doubleValue];
            self.introducerName = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducerName fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAddress fromDictionary:dict];
            self.isRegister = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIsRegister fromDictionary:dict] doubleValue];
            self.account = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerPrepareIdentifier] forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAreaId];
    [mutableDict setValue:self.phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerPreparePhone];
    [mutableDict setValue:self.customerPrepareDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareDescription];
    [mutableDict setValue:self.introducer forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducer];
    [mutableDict setValue:self.sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.from] forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareFrom];
    [mutableDict setValue:self.introducerName forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducerName];
    [mutableDict setValue:self.weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isRegister] forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIsRegister];
    [mutableDict setValue:self.account forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAccount];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareName];

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

    self.customerPrepareIdentifier = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAreaId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPreparePhone];
    self.customerPrepareDescription = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareDescription];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducer];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareSex];
    self.from = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareFrom];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducerName];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAddress];
    self.isRegister = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIsRegister];
    self.account = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerPrepareIdentifier forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareId];
    [aCoder encodeDouble:_guide forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAreaId];
    [aCoder encodeObject:_phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerPreparePhone];
    [aCoder encodeObject:_customerPrepareDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareDescription];
    [aCoder encodeObject:_introducer forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducer];
    [aCoder encodeObject:_sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareSex];
    [aCoder encodeDouble:_from forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareFrom];
    [aCoder encodeObject:_introducerName forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIntroducerName];
    [aCoder encodeObject:_weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAddress];
    [aCoder encodeDouble:_isRegister forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareIsRegister];
    [aCoder encodeObject:_account forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareAccount];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersCustomerPrepareName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersCustomerPrepare *copy = [[JCModel_MyFranchiserGrantOrdersCustomerPrepare alloc] init];
    
    
    
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
