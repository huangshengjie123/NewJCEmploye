//
//  JCModel_SellOrderCustomerAddressList.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderCustomerAddressList.h"


NSString *const kJCModel_SellOrderCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_SellOrderCustomerAddressListAddress = @"address";
NSString *const kJCModel_SellOrderCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_SellOrderCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_SellOrderCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_SellOrderCustomerAddressListType = @"type";
NSString *const kJCModel_SellOrderCustomerAddressListXpath = @"xpath";


@interface JCModel_SellOrderCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderCustomerAddressList

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
            self.areaId = [self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_SellOrderCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_SellOrderCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_SellOrderCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_SellOrderCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_SellOrderCustomerAddressListDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_SellOrderCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_SellOrderCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_SellOrderCustomerAddressListXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_SellOrderCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAddressListDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_SellOrderCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_SellOrderCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_SellOrderCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_SellOrderCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_SellOrderCustomerAddressListDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_SellOrderCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_SellOrderCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_SellOrderCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderCustomerAddressList *copy = [[JCModel_SellOrderCustomerAddressList alloc] init];
    
    
    
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
