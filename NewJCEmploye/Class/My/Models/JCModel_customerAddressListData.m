//
//  JCModel_customerAddressListData.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_customerAddressListData.h"


NSString *const kJCModel_customerAddressListDataPhone = @"phone";
NSString *const kJCModel_customerAddressListDataAreaId = @"areaId";
NSString *const kJCModel_customerAddressListDataAddress = @"address";
NSString *const kJCModel_customerAddressListDataAddressId = @"addressId";
NSString *const kJCModel_customerAddressListDataDeliveryTime = @"deliveryTime";
NSString *const kJCModel_customerAddressListDataLinkman = @"linkman";
NSString *const kJCModel_customerAddressListDataCusId = @"cusId";
NSString *const kJCModel_customerAddressListDataType = @"type";
NSString *const kJCModel_customerAddressListDataXpath = @"xpath";


@interface JCModel_customerAddressListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_customerAddressListData

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
            self.phone = [self objectOrNilForKey:kJCModel_customerAddressListDataPhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_customerAddressListDataAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_customerAddressListDataAddress fromDictionary:dict];
            self.addressId = [[self objectOrNilForKey:kJCModel_customerAddressListDataAddressId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_customerAddressListDataDeliveryTime fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kJCModel_customerAddressListDataLinkman fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_customerAddressListDataCusId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_customerAddressListDataType fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_customerAddressListDataXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_customerAddressListDataPhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_customerAddressListDataAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_customerAddressListDataAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressId] forKey:kJCModel_customerAddressListDataAddressId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_customerAddressListDataDeliveryTime];
    [mutableDict setValue:self.linkman forKey:kJCModel_customerAddressListDataLinkman];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_customerAddressListDataCusId];
    [mutableDict setValue:self.type forKey:kJCModel_customerAddressListDataType];
    [mutableDict setValue:self.xpath forKey:kJCModel_customerAddressListDataXpath];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataPhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataAddress];
    self.addressId = [aDecoder decodeDoubleForKey:kJCModel_customerAddressListDataAddressId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataDeliveryTime];
    self.linkman = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataLinkman];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_customerAddressListDataCusId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_customerAddressListDataXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_customerAddressListDataPhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_customerAddressListDataAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_customerAddressListDataAddress];
    [aCoder encodeDouble:_addressId forKey:kJCModel_customerAddressListDataAddressId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_customerAddressListDataDeliveryTime];
    [aCoder encodeObject:_linkman forKey:kJCModel_customerAddressListDataLinkman];
    [aCoder encodeDouble:_cusId forKey:kJCModel_customerAddressListDataCusId];
    [aCoder encodeObject:_type forKey:kJCModel_customerAddressListDataType];
    [aCoder encodeObject:_xpath forKey:kJCModel_customerAddressListDataXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_customerAddressListData *copy = [[JCModel_customerAddressListData alloc] init];
    
    
    
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
