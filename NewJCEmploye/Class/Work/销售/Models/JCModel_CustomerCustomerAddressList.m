//
//  JCModel_CustomerCustomerAddressList.m
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CustomerCustomerAddressList.h"


NSString *const kJCModel_CustomerCustomerAddressListCusId = @"cusId";
NSString *const kJCModel_CustomerCustomerAddressListId = @"id";
NSString *const kJCModel_CustomerCustomerAddressListDeliveryTime = @"deliveryTime";
NSString *const kJCModel_CustomerCustomerAddressListAddress = @"address";


@interface JCModel_CustomerCustomerAddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CustomerCustomerAddressList

@synthesize cusId = _cusId;
@synthesize customerAddressListIdentifier = _customerAddressListIdentifier;
@synthesize deliveryTime = _deliveryTime;
@synthesize address = _address;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cusId = [[self objectOrNilForKey:kJCModel_CustomerCustomerAddressListCusId fromDictionary:dict] doubleValue];
            self.customerAddressListIdentifier = [[self objectOrNilForKey:kJCModel_CustomerCustomerAddressListId fromDictionary:dict] doubleValue];
            self.deliveryTime = [self objectOrNilForKey:kJCModel_CustomerCustomerAddressListDeliveryTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_CustomerCustomerAddressListAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_CustomerCustomerAddressListCusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerAddressListIdentifier] forKey:kJCModel_CustomerCustomerAddressListId];
    [mutableDict setValue:self.deliveryTime forKey:kJCModel_CustomerCustomerAddressListDeliveryTime];
    [mutableDict setValue:self.address forKey:kJCModel_CustomerCustomerAddressListAddress];

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

    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_CustomerCustomerAddressListCusId];
    self.customerAddressListIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CustomerCustomerAddressListId];
    self.deliveryTime = [aDecoder decodeObjectForKey:kJCModel_CustomerCustomerAddressListDeliveryTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_CustomerCustomerAddressListAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cusId forKey:kJCModel_CustomerCustomerAddressListCusId];
    [aCoder encodeDouble:_customerAddressListIdentifier forKey:kJCModel_CustomerCustomerAddressListId];
    [aCoder encodeObject:_deliveryTime forKey:kJCModel_CustomerCustomerAddressListDeliveryTime];
    [aCoder encodeObject:_address forKey:kJCModel_CustomerCustomerAddressListAddress];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CustomerCustomerAddressList *copy = [[JCModel_CustomerCustomerAddressList alloc] init];
    
    
    
    if (copy) {

        copy.cusId = self.cusId;
        copy.customerAddressListIdentifier = self.customerAddressListIdentifier;
        copy.deliveryTime = [self.deliveryTime copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
    }
    
    return copy;
}


@end
