//
//  JCModel_DistributionCustomerAddressList.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionCustomerAddressList.h"


NSString *const kJCModel_DistributionCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_DistributionCustomerAddressListAddress = @"address";
NSString *const kJCModel_DistributionCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_DistributionCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_DistributionCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_DistributionCustomerAddressListType = @"type";
NSString *const kJCModel_DistributionCustomerAddressListXpath = @"xpath";


@interface JCModel_DistributionCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionCustomerAddressList

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
            self.areaId = [self objectOrNilForKey:kJCModel_DistributionCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_DistributionCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_DistributionCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_DistributionCustomerAddressListDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_DistributionCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_DistributionCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_DistributionCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_DistributionCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_DistributionCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_DistributionCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_DistributionCustomerAddressListDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_DistributionCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_DistributionCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_DistributionCustomerAddressListXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_DistributionCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAddressListDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_DistributionCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_DistributionCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_DistributionCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_DistributionCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_DistributionCustomerAddressListDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_DistributionCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_DistributionCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_DistributionCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionCustomerAddressList *copy = [[JCModel_DistributionCustomerAddressList alloc] init];
    
    
    
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
