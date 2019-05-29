//
//  JCModel_EmpSupportOrderCustomerAddressList.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderCustomerAddressList.h"


NSString *const kJCModel_EmpSupportOrderCustomerAddressListPhone = @"phone";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListAddress = @"address";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListType = @"type";
NSString *const kJCModel_EmpSupportOrderCustomerAddressListXpath = @"xpath";


@interface JCModel_EmpSupportOrderCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderCustomerAddressList

@synthesize phone = _phone;
@synthesize areaId = _areaId;
@synthesize address = _address;
@synthesize addressId = _addressId;
@synthesize deliveryTime = _deliveryTime;
@synthesize linkman = _linkman;
@synthesize cusId = _cusId;
@synthesize type = _type;
@synthesize xpath = _xpath;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.phone = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpSupportOrderCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_EmpSupportOrderCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_EmpSupportOrderCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_EmpSupportOrderCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_EmpSupportOrderCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_EmpSupportOrderCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_EmpSupportOrderCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_EmpSupportOrderCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_EmpSupportOrderCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_EmpSupportOrderCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_EmpSupportOrderCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_EmpSupportOrderCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_EmpSupportOrderCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_EmpSupportOrderCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_EmpSupportOrderCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_EmpSupportOrderCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_EmpSupportOrderCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_EmpSupportOrderCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderCustomerAddressList *copy = [[JCModel_EmpSupportOrderCustomerAddressList alloc] init];
    
    
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.addressId = self.addressId;
        copy.deliveryTime = [self.deliveryTime copyWithZone:zone];
        copy.linkman = [self.linkman copyWithZone:zone];
        copy.cusId = self.cusId;
        copy.type = [self.type copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
    }
    
    return copy;
}


@end
