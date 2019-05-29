//
//  JCmodel_newCustomer2CustomerAddressList.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2CustomerAddressList.h"


NSString *const kJCmodel_newCustomer2CustomerAddressListPhone = @"phone";
NSString *const kJCmodel_newCustomer2CustomerAddressListAreaId = @"areaId";
NSString *const kJCmodel_newCustomer2CustomerAddressListAddress = @"address";
NSString *const kJCmodel_newCustomer2CustomerAddressListAddressId = @"addressId";
NSString *const kJCmodel_newCustomer2CustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCmodel_newCustomer2CustomerAddressListLinkman = @"linkman";
NSString *const kJCmodel_newCustomer2CustomerAddressListCusId = @"cusId";
NSString *const kJCmodel_newCustomer2CustomerAddressListType = @"type";
NSString *const kJCmodel_newCustomer2CustomerAddressListXpath = @"xpath";


@interface JCmodel_newCustomer2CustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2CustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCmodel_newCustomer2CustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCmodel_newCustomer2CustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCmodel_newCustomer2CustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCmodel_newCustomer2CustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCmodel_newCustomer2CustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCmodel_newCustomer2CustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCmodel_newCustomer2CustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCmodel_newCustomer2CustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCmodel_newCustomer2CustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2CustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2CustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCmodel_newCustomer2CustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCmodel_newCustomer2CustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCmodel_newCustomer2CustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCmodel_newCustomer2CustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCmodel_newCustomer2CustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCmodel_newCustomer2CustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCmodel_newCustomer2CustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCmodel_newCustomer2CustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCmodel_newCustomer2CustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2CustomerAddressList *copy = [[JCmodel_newCustomer2CustomerAddressList alloc] init];

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
