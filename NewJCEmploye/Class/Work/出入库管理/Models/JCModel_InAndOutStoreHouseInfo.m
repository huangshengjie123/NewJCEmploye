//
//  JCModel_InAndOutStoreHouseInfo.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutStoreHouseInfo.h"


NSString *const kJCModel_InAndOutStoreHouseInfoId = @"id";
NSString *const kJCModel_InAndOutStoreHouseInfoOrg = @"org";
NSString *const kJCModel_InAndOutStoreHouseInfoUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_InAndOutStoreHouseInfoName = @"name";
NSString *const kJCModel_InAndOutStoreHouseInfoDescription = @"description";
NSString *const kJCModel_InAndOutStoreHouseInfoType = @"type";


@interface JCModel_InAndOutStoreHouseInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutStoreHouseInfo

@synthesize storeHouseInfoIdentifier = _storeHouseInfoIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize storeHouseInfoDescription = _storeHouseInfoDescription;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storeHouseInfoIdentifier = [[self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoName fromDictionary:dict];
            self.storeHouseInfoDescription = [self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_InAndOutStoreHouseInfoType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouseInfoIdentifier] forKey:kJCModel_InAndOutStoreHouseInfoId];
    [mutableDict setValue:self.org forKey:kJCModel_InAndOutStoreHouseInfoOrg];
    [mutableDict setValue:self.userExtInfoStaffVOList forKey:kJCModel_InAndOutStoreHouseInfoUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_InAndOutStoreHouseInfoName];
    [mutableDict setValue:self.storeHouseInfoDescription forKey:kJCModel_InAndOutStoreHouseInfoDescription];
    [mutableDict setValue:self.type forKey:kJCModel_InAndOutStoreHouseInfoType];

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

    self.storeHouseInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_InAndOutStoreHouseInfoId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_InAndOutStoreHouseInfoOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_InAndOutStoreHouseInfoUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InAndOutStoreHouseInfoName];
    self.storeHouseInfoDescription = [aDecoder decodeObjectForKey:kJCModel_InAndOutStoreHouseInfoDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_InAndOutStoreHouseInfoType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_storeHouseInfoIdentifier forKey:kJCModel_InAndOutStoreHouseInfoId];
    [aCoder encodeObject:_org forKey:kJCModel_InAndOutStoreHouseInfoOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_InAndOutStoreHouseInfoUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_InAndOutStoreHouseInfoName];
    [aCoder encodeObject:_storeHouseInfoDescription forKey:kJCModel_InAndOutStoreHouseInfoDescription];
    [aCoder encodeObject:_type forKey:kJCModel_InAndOutStoreHouseInfoType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutStoreHouseInfo *copy = [[JCModel_InAndOutStoreHouseInfo alloc] init];
    
    
    
    if (copy) {

        copy.storeHouseInfoIdentifier = self.storeHouseInfoIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = [self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.storeHouseInfoDescription = [self.storeHouseInfoDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
