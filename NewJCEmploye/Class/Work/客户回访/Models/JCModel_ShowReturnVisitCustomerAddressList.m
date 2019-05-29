//
//  JCModel_ShowReturnVisitCustomerAddressList.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitCustomerAddressList.h"


NSString *const kJCModel_ShowReturnVisitCustomerAddressListPhone = @"phone";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListAddress = @"address";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListAddressId = @"addressId";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListLinkman = @"linkman";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListType = @"type";
NSString *const kJCModel_ShowReturnVisitCustomerAddressListXpath = @"xpath";


@interface JCModel_ShowReturnVisitCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitCustomerAddressList

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
            self.phone = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAddressListXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_ShowReturnVisitCustomerAddressListPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_ShowReturnVisitCustomerAddressListAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_ShowReturnVisitCustomerAddressListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_ShowReturnVisitCustomerAddressListAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_ShowReturnVisitCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_ShowReturnVisitCustomerAddressListLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_ShowReturnVisitCustomerAddressListCusId];
    [mutableDict setValue:self.type forKey:kJCModel_ShowReturnVisitCustomerAddressListType];
    [mutableDict setValue:self.xpath forKey:kJCModel_ShowReturnVisitCustomerAddressListXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitCustomerAddressListAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitCustomerAddressListCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAddressListXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_ShowReturnVisitCustomerAddressListPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_ShowReturnVisitCustomerAddressListAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_ShowReturnVisitCustomerAddressListAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_ShowReturnVisitCustomerAddressListAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_ShowReturnVisitCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_ShowReturnVisitCustomerAddressListLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_ShowReturnVisitCustomerAddressListCusId];
    [aCoder encodeObject:_type forKey:kJCModel_ShowReturnVisitCustomerAddressListType];
    [aCoder encodeObject:_xpath forKey:kJCModel_ShowReturnVisitCustomerAddressListXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitCustomerAddressList *copy = [[JCModel_ShowReturnVisitCustomerAddressList alloc] init];
    
    
    
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
