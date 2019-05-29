//
//  JCModel_searchDetailsOutputFStoreHouseInfo.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFStoreHouseInfo.h"


NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoId = @"id";
NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoOrg = @"org";
NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoName = @"name";
NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoDescription = @"description";
NSString *const kJCModel_searchDetailsOutputFStoreHouseInfoType = @"type";


@interface JCModel_searchDetailsOutputFStoreHouseInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFStoreHouseInfo

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
            self.storeHouseInfoIdentifier = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoName fromDictionary:dict];
            self.storeHouseInfoDescription = [self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchDetailsOutputFStoreHouseInfoType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouseInfoIdentifier] forKey:kJCModel_searchDetailsOutputFStoreHouseInfoId];
    [mutableDict setValue:self.org forKey:kJCModel_searchDetailsOutputFStoreHouseInfoOrg];
    [mutableDict setValue:self.userExtInfoStaffVOList forKey:kJCModel_searchDetailsOutputFStoreHouseInfoUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_searchDetailsOutputFStoreHouseInfoName];
    [mutableDict setValue:self.storeHouseInfoDescription forKey:kJCModel_searchDetailsOutputFStoreHouseInfoDescription];
    [mutableDict setValue:self.type forKey:kJCModel_searchDetailsOutputFStoreHouseInfoType];

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

    self.storeHouseInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFStoreHouseInfoId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFStoreHouseInfoOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFStoreHouseInfoUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFStoreHouseInfoName];
    self.storeHouseInfoDescription = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFStoreHouseInfoDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFStoreHouseInfoType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_storeHouseInfoIdentifier forKey:kJCModel_searchDetailsOutputFStoreHouseInfoId];
    [aCoder encodeObject:_org forKey:kJCModel_searchDetailsOutputFStoreHouseInfoOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_searchDetailsOutputFStoreHouseInfoUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_searchDetailsOutputFStoreHouseInfoName];
    [aCoder encodeObject:_storeHouseInfoDescription forKey:kJCModel_searchDetailsOutputFStoreHouseInfoDescription];
    [aCoder encodeObject:_type forKey:kJCModel_searchDetailsOutputFStoreHouseInfoType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFStoreHouseInfo *copy = [[JCModel_searchDetailsOutputFStoreHouseInfo alloc] init];
    
    
    
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
