//
//  JCModel_NewDostribution1CustomerAddressList.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1CustomerAddressList.h"


NSString *const kJCModel_NewDostribution1CustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_NewDostribution1CustomerAddressListAddress = @"address";
NSString *const kJCModel_NewDostribution1CustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_NewDostribution1CustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_NewDostribution1CustomerAddressListCusId = @"cusId";
NSString *const kJCModel_NewDostribution1CustomerAddressListType = @"type";
NSString *const kJCModel_NewDostribution1CustomerAddressListXpath = @"xpath";


@interface JCModel_NewDostribution1CustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1CustomerAddressList

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
            self.areaId = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListDeliveryTime fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_NewDostribution1CustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_NewDostribution1CustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_NewDostribution1CustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_NewDostribution1CustomerAddressListDeliveryTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_NewDostribution1CustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_NewDostribution1CustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_NewDostribution1CustomerAddressListXpath];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1CustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAddressListDeliveryTime];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1CustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_NewDostribution1CustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_NewDostribution1CustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_NewDostribution1CustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_NewDostribution1CustomerAddressListDeliveryTime];
    [aCoder encodeDouble:_cusId forKey:kJCModel_NewDostribution1CustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_NewDostribution1CustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_NewDostribution1CustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1CustomerAddressList *copy = [[JCModel_NewDostribution1CustomerAddressList alloc] init];
    
    
    
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
