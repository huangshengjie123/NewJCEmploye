//
//  JCModel_updateAddressMainBase.m
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateAddressMainBase.h"


NSString *const kJCModel_updateAddressMainBaseCusId = @"cusId";
NSString *const kJCModel_updateAddressMainBaseId = @"addressId";
NSString *const kJCModel_updateAddressMainBaseType = @"type";


@interface JCModel_updateAddressMainBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateAddressMainBase

@synthesize cusId = _cusId;
@synthesize addressId = _addressId;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cusId = [self objectOrNilForKey:kJCModel_updateAddressMainBaseCusId fromDictionary:dict];
            self.addressId = [self objectOrNilForKey:kJCModel_updateAddressMainBaseId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_updateAddressMainBaseType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cusId forKey:kJCModel_updateAddressMainBaseCusId];
    [mutableDict setValue:self.addressId forKey:kJCModel_updateAddressMainBaseId];
    [mutableDict setValue:self.type forKey:kJCModel_updateAddressMainBaseType];

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

    self.cusId = [aDecoder decodeObjectForKey:kJCModel_updateAddressMainBaseCusId];
    self.addressId = [aDecoder decodeObjectForKey:kJCModel_updateAddressMainBaseId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_updateAddressMainBaseType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cusId forKey:kJCModel_updateAddressMainBaseCusId];
    [aCoder encodeObject:_addressId forKey:kJCModel_updateAddressMainBaseId];
    [aCoder encodeObject:_type forKey:kJCModel_updateAddressMainBaseType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateAddressMainBase *copy = [[JCModel_updateAddressMainBase alloc] init];
    
    
    
    if (copy) {

        copy.cusId = [self.cusId copyWithZone:zone];
        copy.addressId = [self.addressId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
