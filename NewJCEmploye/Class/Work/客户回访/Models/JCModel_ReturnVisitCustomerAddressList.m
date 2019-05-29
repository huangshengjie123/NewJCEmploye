//
//  JCModel_ReturnVisitCustomerAddressList.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitCustomerAddressList.h"


NSString *const kJCModel_ReturnVisitCustomerAddressListPhone = @"phone";
NSString *const kJCModel_ReturnVisitCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_ReturnVisitCustomerAddressListAddress = @"address";
NSString *const kJCModel_ReturnVisitCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_ReturnVisitCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_ReturnVisitCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_ReturnVisitCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_ReturnVisitCustomerAddressListType = @"type";
NSString *const kJCModel_ReturnVisitCustomerAddressListXpath = @"xpath";


@interface JCModel_ReturnVisitCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitCustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_ReturnVisitCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_ReturnVisitCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_ReturnVisitCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_ReturnVisitCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_ReturnVisitCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_ReturnVisitCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_ReturnVisitCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_ReturnVisitCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_ReturnVisitCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_ReturnVisitCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_ReturnVisitCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_ReturnVisitCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_ReturnVisitCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_ReturnVisitCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_ReturnVisitCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_ReturnVisitCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_ReturnVisitCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_ReturnVisitCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitCustomerAddressList *copy = [[JCModel_ReturnVisitCustomerAddressList alloc] init];
    
    
    
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
