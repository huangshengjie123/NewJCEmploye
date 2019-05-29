//
//  JCModel_ReceivableOrderCustomerAddressList.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderCustomerAddressList.h"


NSString *const kJCModel_ReceivableOrderCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_ReceivableOrderCustomerAddressListAddress = @"address";
NSString *const kJCModel_ReceivableOrderCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_ReceivableOrderCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_ReceivableOrderCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_ReceivableOrderCustomerAddressListType = @"type";
NSString *const kJCModel_ReceivableOrderCustomerAddressListXpath = @"xpath";


@interface JCModel_ReceivableOrderCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderCustomerAddressList

@synthesize areaId = _areaId;
@synthesize address = _address;
@synthesize addressId = _addressId;
@synthesize deliveryTime = _deliveryTime;
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
            self.areaId = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_ReceivableOrderCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_ReceivableOrderCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_ReceivableOrderCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_ReceivableOrderCustomerAddressListDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_ReceivableOrderCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_ReceivableOrderCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_ReceivableOrderCustomerAddressListXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAddressListDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_ReceivableOrderCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_ReceivableOrderCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_ReceivableOrderCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_ReceivableOrderCustomerAddressListDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_ReceivableOrderCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_ReceivableOrderCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_ReceivableOrderCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderCustomerAddressList *copy = [[JCModel_ReceivableOrderCustomerAddressList alloc] init];
    
    
    
    if (copy) {

        copy.areaId = [self.areaId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.addressId = self.addressId;
        copy.deliveryTime = [self.deliveryTime copyWithZone:zone];
        copy.cusId = self.cusId;
        copy.type = [self.type copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
    }
    
    return copy;
}


@end
