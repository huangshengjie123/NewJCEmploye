//
//  JCModel_newCustomerAddressListBase.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newCustomerAddressListBase.h"


NSString *const kJCModel_newCustomerAddressListBaseCusId = @"cusId";
NSString *const kJCModel_newCustomerAddressListBaseAreaId = @"areaId";
NSString *const kJCModel_newCustomerAddressListBaseType = @"type";
NSString *const kJCModel_newCustomerAddressListBaseAddress = @"address";


@interface JCModel_newCustomerAddressListBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newCustomerAddressListBase

@synthesize cusId = _cusId;
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
            self.cusId = [self objectOrNilForKey:kJCModel_newCustomerAddressListBaseCusId fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_newCustomerAddressListBaseAreaId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_newCustomerAddressListBaseType fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_newCustomerAddressListBaseAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cusId forKey:kJCModel_newCustomerAddressListBaseCusId];
    [mutableDict setValue:self.areaId forKey:kJCModel_newCustomerAddressListBaseAreaId];
    [mutableDict setValue:self.type forKey:kJCModel_newCustomerAddressListBaseType];
    [mutableDict setValue:self.address forKey:kJCModel_newCustomerAddressListBaseAddress];

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

    self.cusId = [aDecoder decodeObjectForKey:kJCModel_newCustomerAddressListBaseCusId];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_newCustomerAddressListBaseAreaId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_newCustomerAddressListBaseType];
    self.address = [aDecoder decodeObjectForKey:kJCModel_newCustomerAddressListBaseAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cusId forKey:kJCModel_newCustomerAddressListBaseCusId];
    [aCoder encodeObject:_areaId forKey:kJCModel_newCustomerAddressListBaseAreaId];
    [aCoder encodeObject:_type forKey:kJCModel_newCustomerAddressListBaseType];
    [aCoder encodeObject:_address forKey:kJCModel_newCustomerAddressListBaseAddress];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newCustomerAddressListBase *copy = [[JCModel_newCustomerAddressListBase alloc] init];
    
    
    
    if (copy) {

        copy.cusId = [self.cusId copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
    }
    
    return copy;
}


@end
