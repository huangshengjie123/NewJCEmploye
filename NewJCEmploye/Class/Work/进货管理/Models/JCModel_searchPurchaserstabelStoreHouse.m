//
//  JCModel_searchPurchaserstabelStoreHouse.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelStoreHouse.h"


NSString *const kJCModel_searchPurchaserstabelStoreHouseId = @"id";
NSString *const kJCModel_searchPurchaserstabelStoreHouseOrg = @"org";
NSString *const kJCModel_searchPurchaserstabelStoreHouseUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_searchPurchaserstabelStoreHouseName = @"name";
NSString *const kJCModel_searchPurchaserstabelStoreHouseDescription = @"description";
NSString *const kJCModel_searchPurchaserstabelStoreHouseType = @"type";


@interface JCModel_searchPurchaserstabelStoreHouse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelStoreHouse

@synthesize storeHouseIdentifier = _storeHouseIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize storeHouseDescription = _storeHouseDescription;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storeHouseIdentifier = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseName fromDictionary:dict];
            self.storeHouseDescription = [self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchPurchaserstabelStoreHouseType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouseIdentifier] forKey:kJCModel_searchPurchaserstabelStoreHouseId];
    [mutableDict setValue:self.org forKey:kJCModel_searchPurchaserstabelStoreHouseOrg];
    [mutableDict setValue:self.userExtInfoStaffVOList forKey:kJCModel_searchPurchaserstabelStoreHouseUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_searchPurchaserstabelStoreHouseName];
    [mutableDict setValue:self.storeHouseDescription forKey:kJCModel_searchPurchaserstabelStoreHouseDescription];
    [mutableDict setValue:self.type forKey:kJCModel_searchPurchaserstabelStoreHouseType];

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

    self.storeHouseIdentifier = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelStoreHouseId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelStoreHouseOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelStoreHouseUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelStoreHouseName];
    self.storeHouseDescription = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelStoreHouseDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelStoreHouseType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_storeHouseIdentifier forKey:kJCModel_searchPurchaserstabelStoreHouseId];
    [aCoder encodeObject:_org forKey:kJCModel_searchPurchaserstabelStoreHouseOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_searchPurchaserstabelStoreHouseUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_searchPurchaserstabelStoreHouseName];
    [aCoder encodeObject:_storeHouseDescription forKey:kJCModel_searchPurchaserstabelStoreHouseDescription];
    [aCoder encodeObject:_type forKey:kJCModel_searchPurchaserstabelStoreHouseType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelStoreHouse *copy = [[JCModel_searchPurchaserstabelStoreHouse alloc] init];
    
    
    
    if (copy) {

        copy.storeHouseIdentifier = self.storeHouseIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = [self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.storeHouseDescription = [self.storeHouseDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
