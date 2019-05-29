//
//  JCModel_WaterCardDetailsCustomerAddresses.m
//
//  Created by   on 2018/7/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardDetailsCustomerAddresses.h"


NSString *const kJCModel_WaterCardDetailsCustomerAddressesAreaId = @"areaId";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesAddress = @"address";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesAddressId = @"addressId";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesDeliveryTime = @"deliveryTime";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesCusId = @"cusId";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesType = @"type";
NSString *const kJCModel_WaterCardDetailsCustomerAddressesXpath = @"xpath";


@interface JCModel_WaterCardDetailsCustomerAddresses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardDetailsCustomerAddresses

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
            self.areaId = [self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_WaterCardDetailsCustomerAddressesXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_WaterCardDetailsCustomerAddressesAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_WaterCardDetailsCustomerAddressesAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_WaterCardDetailsCustomerAddressesAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_WaterCardDetailsCustomerAddressesDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_WaterCardDetailsCustomerAddressesCusId];
    [mutableDict setValue:self.type forKey:kJCModel_WaterCardDetailsCustomerAddressesType];
    [mutableDict setValue:self.xpath forKey:kJCModel_WaterCardDetailsCustomerAddressesXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsCustomerAddressesAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsCustomerAddressesAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsCustomerAddressesAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsCustomerAddressesDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsCustomerAddressesCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsCustomerAddressesType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsCustomerAddressesXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_WaterCardDetailsCustomerAddressesAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_WaterCardDetailsCustomerAddressesAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_WaterCardDetailsCustomerAddressesAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_WaterCardDetailsCustomerAddressesDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_WaterCardDetailsCustomerAddressesCusId];
    [aCoder encodeObject:_type forKey:kJCModel_WaterCardDetailsCustomerAddressesType];
    [aCoder encodeObject:_xpath forKey:kJCModel_WaterCardDetailsCustomerAddressesXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardDetailsCustomerAddresses *copy = [[JCModel_WaterCardDetailsCustomerAddresses alloc] init];
    
    
    
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
