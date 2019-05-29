//
//  JCModel_CreatCustomerCustomerAddressList.m
//
//  Created by   on 2018/6/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomerCustomerAddressList.h"


NSString *const kJCModel_CreatCustomerCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_CreatCustomerCustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_CreatCustomerCustomerAddressListType = @"type";
NSString *const kJCModel_CreatCustomerCustomerAddressListAddress = @"address";


@interface JCModel_CreatCustomerCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomerCustomerAddressList

@synthesize deliveryTime = _deliveryTime;
@synthesize areaId = _areaId;
@synthesize type = _type;
@synthesize address = _address;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.deliveryTime = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerAddressListDeliveryTime fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerAddressListAreaId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerAddressListType fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerAddressListAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_CreatCustomerCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.areaId forKey:kJCModel_CreatCustomerCustomerAddressListAreaId];
    [mutableDict setValue:self.type forKey:kJCModel_CreatCustomerCustomerAddressListType];
    [mutableDict setValue:self.address forKey:kJCModel_CreatCustomerCustomerAddressListAddress];

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

    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerAddressListDeliveryTime];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerAddressListAreaId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerAddressListType];
    self.address = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerAddressListAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_deliveryTime forKey:kJCModel_CreatCustomerCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_areaId forKey:kJCModel_CreatCustomerCustomerAddressListAreaId];
    [aCoder encodeObject:_type forKey:kJCModel_CreatCustomerCustomerAddressListType];
    [aCoder encodeObject:_address forKey:kJCModel_CreatCustomerCustomerAddressListAddress];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomerCustomerAddressList *copy = [[JCModel_CreatCustomerCustomerAddressList alloc] init];
    
    
    
    if (copy) {

        copy.deliveryTime = [self.deliveryTime copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
    }
    
    return copy;
}


@end
