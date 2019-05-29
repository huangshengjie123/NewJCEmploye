//
//  JCModel_MyFranchiserGrantOrdersCustomerAddressList.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersCustomerAddressList.h"


NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListPhone = @"phone";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddress = @"address";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListType = @"type";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerAddressListXpath = @"xpath";


@interface JCModel_MyFranchiserGrantOrdersCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersCustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_MyFranchiserGrantOrdersCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersCustomerAddressList *copy = [[JCModel_MyFranchiserGrantOrdersCustomerAddressList alloc] init];
    
    
    
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
