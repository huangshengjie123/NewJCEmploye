//
//  JCModel_GetCustmerCustomerAddressList.m
//
//  Created by   on 2019/2/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetCustmerCustomerAddressList.h"


NSString *const kJCModel_GetCustmerCustomerAddressListPhone = @"phone";
NSString *const kJCModel_GetCustmerCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_GetCustmerCustomerAddressListAddress = @"address";
NSString *const kJCModel_GetCustmerCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_GetCustmerCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_GetCustmerCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_GetCustmerCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_GetCustmerCustomerAddressListType = @"type";
NSString *const kJCModel_GetCustmerCustomerAddressListXpath = @"xpath";


@interface JCModel_GetCustmerCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetCustmerCustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_GetCustmerCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_GetCustmerCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_GetCustmerCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_GetCustmerCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_GetCustmerCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_GetCustmerCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_GetCustmerCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_GetCustmerCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_GetCustmerCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_GetCustmerCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_GetCustmerCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_GetCustmerCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_GetCustmerCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_GetCustmerCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_GetCustmerCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_GetCustmerCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_GetCustmerCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_GetCustmerCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_GetCustmerCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetCustmerCustomerAddressList *copy = [[JCModel_GetCustmerCustomerAddressList alloc] init];
    
    
    
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
