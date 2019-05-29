//
//  JCModel_CreatCustomer2CustomerAddressList.m
//
//  Created by   on 2019/1/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomer2CustomerAddressList.h"


NSString *const kJCModel_CreatCustomer2CustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_CreatCustomer2CustomerAddressListAreaId = @"areaId";
NSString *const kJCModel_CreatCustomer2CustomerAddressListType = @"type";
NSString *const kJCModel_CreatCustomer2CustomerAddressListAddress = @"address";


@interface JCModel_CreatCustomer2CustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomer2CustomerAddressList

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
            self.deliveryTime = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerAddressListDeliveryTime fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerAddressListAreaId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerAddressListType fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerAddressListAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_CreatCustomer2CustomerAddressListDeliveryTime];
    [mutableDict setValue:self.areaId forKey:kJCModel_CreatCustomer2CustomerAddressListAreaId];
    [mutableDict setValue:self.type forKey:kJCModel_CreatCustomer2CustomerAddressListType];
    [mutableDict setValue:self.address forKey:kJCModel_CreatCustomer2CustomerAddressListAddress];

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

    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerAddressListDeliveryTime];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerAddressListAreaId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerAddressListType];
    self.address = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerAddressListAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_deliveryTime forKey:kJCModel_CreatCustomer2CustomerAddressListDeliveryTime];
    [aCoder encodeObject:_areaId forKey:kJCModel_CreatCustomer2CustomerAddressListAreaId];
    [aCoder encodeObject:_type forKey:kJCModel_CreatCustomer2CustomerAddressListType];
    [aCoder encodeObject:_address forKey:kJCModel_CreatCustomer2CustomerAddressListAddress];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomer2CustomerAddressList *copy = [[JCModel_CreatCustomer2CustomerAddressList alloc] init];
    
    
    
    if (copy) {

        copy.deliveryTime = [self.deliveryTime copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
    }
    
    return copy;
}


@end
