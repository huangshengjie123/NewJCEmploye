//
//  JCModel_NewDistributionCarDetailsCustomerAddressList.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsCustomerAddressList.h"


NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListPhone = @"phone";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListAddress = @"address";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListType = @"type";
NSString *const kJCModel_NewDistributionCarDetailsCustomerAddressListXpath = @"xpath";


@interface JCModel_NewDistributionCarDetailsCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsCustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_NewDistributionCarDetailsCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsCustomerAddressList *copy = [[JCModel_NewDistributionCarDetailsCustomerAddressList alloc] init];
    
    
    
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
