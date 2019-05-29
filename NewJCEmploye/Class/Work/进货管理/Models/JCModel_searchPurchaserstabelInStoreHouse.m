//
//  JCModel_searchPurchaserstabelInStoreHouse.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelInStoreHouse.h"


NSString *const kJCModel_searchPurchaserstabelInStoreHouseId = @"id";
NSString *const kJCModel_searchPurchaserstabelInStoreHouseOrg = @"org";
NSString *const kJCModel_searchPurchaserstabelInStoreHouseUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_searchPurchaserstabelInStoreHouseName = @"name";
NSString *const kJCModel_searchPurchaserstabelInStoreHouseDescription = @"description";
NSString *const kJCModel_searchPurchaserstabelInStoreHouseType = @"type";


@interface JCModel_searchPurchaserstabelInStoreHouse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelInStoreHouse

@synthesize inStoreHouseIdentifier = _inStoreHouseIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize inStoreHouseDescription = _inStoreHouseDescription;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inStoreHouseIdentifier = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseName fromDictionary:dict];
            self.inStoreHouseDescription = [self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchPurchaserstabelInStoreHouseType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inStoreHouseIdentifier] forKey:kJCModel_searchPurchaserstabelInStoreHouseId];
    [mutableDict setValue:self.org forKey:kJCModel_searchPurchaserstabelInStoreHouseOrg];
    [mutableDict setValue:self.userExtInfoStaffVOList forKey:kJCModel_searchPurchaserstabelInStoreHouseUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_searchPurchaserstabelInStoreHouseName];
    [mutableDict setValue:self.inStoreHouseDescription forKey:kJCModel_searchPurchaserstabelInStoreHouseDescription];
    [mutableDict setValue:self.type forKey:kJCModel_searchPurchaserstabelInStoreHouseType];

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

    self.inStoreHouseIdentifier = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelInStoreHouseId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelInStoreHouseOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelInStoreHouseUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelInStoreHouseName];
    self.inStoreHouseDescription = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelInStoreHouseDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelInStoreHouseType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_inStoreHouseIdentifier forKey:kJCModel_searchPurchaserstabelInStoreHouseId];
    [aCoder encodeObject:_org forKey:kJCModel_searchPurchaserstabelInStoreHouseOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_searchPurchaserstabelInStoreHouseUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_searchPurchaserstabelInStoreHouseName];
    [aCoder encodeObject:_inStoreHouseDescription forKey:kJCModel_searchPurchaserstabelInStoreHouseDescription];
    [aCoder encodeObject:_type forKey:kJCModel_searchPurchaserstabelInStoreHouseType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelInStoreHouse *copy = [[JCModel_searchPurchaserstabelInStoreHouse alloc] init];
    
    
    
    if (copy) {

        copy.inStoreHouseIdentifier = self.inStoreHouseIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = [self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.inStoreHouseDescription = [self.inStoreHouseDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
