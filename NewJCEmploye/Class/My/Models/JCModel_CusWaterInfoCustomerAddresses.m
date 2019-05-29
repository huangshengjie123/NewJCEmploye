//
//  JCModel_CusWaterInfoCustomerAddresses.m
//
//  Created by   on 2018/8/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CusWaterInfoCustomerAddresses.h"


NSString *const kJCModel_CusWaterInfoCustomerAddressesAreaId = @"areaId";
NSString *const kJCModel_CusWaterInfoCustomerAddressesAddress = @"address";
NSString *const kJCModel_CusWaterInfoCustomerAddressesAddressId = @"addressId";
NSString *const kJCModel_CusWaterInfoCustomerAddressesDeliveryTime = @"deliveryTime";
NSString *const kJCModel_CusWaterInfoCustomerAddressesCusId = @"cusId";
NSString *const kJCModel_CusWaterInfoCustomerAddressesType = @"type";
NSString *const kJCModel_CusWaterInfoCustomerAddressesXpath = @"xpath";


@interface JCModel_CusWaterInfoCustomerAddresses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CusWaterInfoCustomerAddresses

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
            self.areaId = [self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_CusWaterInfoCustomerAddressesXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_CusWaterInfoCustomerAddressesAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_CusWaterInfoCustomerAddressesAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_CusWaterInfoCustomerAddressesAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_CusWaterInfoCustomerAddressesDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_CusWaterInfoCustomerAddressesCusId];
    [mutableDict setValue:self.type forKey:kJCModel_CusWaterInfoCustomerAddressesType];
    [mutableDict setValue:self.xpath forKey:kJCModel_CusWaterInfoCustomerAddressesXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoCustomerAddressesAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoCustomerAddressesAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoCustomerAddressesAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoCustomerAddressesDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoCustomerAddressesCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoCustomerAddressesType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoCustomerAddressesXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_CusWaterInfoCustomerAddressesAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_CusWaterInfoCustomerAddressesAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_CusWaterInfoCustomerAddressesAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_CusWaterInfoCustomerAddressesDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_CusWaterInfoCustomerAddressesCusId];
    [aCoder encodeObject:_type forKey:kJCModel_CusWaterInfoCustomerAddressesType];
    [aCoder encodeObject:_xpath forKey:kJCModel_CusWaterInfoCustomerAddressesXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CusWaterInfoCustomerAddresses *copy = [[JCModel_CusWaterInfoCustomerAddresses alloc] init];
    
    
    
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
