//
//  JCModel_StoreHouseInfoUserExtInfoStaffVOList.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_StoreHouseInfoUserExtInfoStaffVOList.h"


NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListId = @"id";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListStaff = @"staff";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListPhone = @"phone";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListFirstName = @"firstName";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListMbPhone = @"mbPhone";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListSex = @"sex";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListLastName = @"lastName";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListWeChat = @"weChat";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListAddress = @"address";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListQq = @"qq";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListEmail = @"email";
NSString *const kJCModel_StoreHouseInfoUserExtInfoStaffVOListName = @"name";


@interface JCModel_StoreHouseInfoUserExtInfoStaffVOList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_StoreHouseInfoUserExtInfoStaffVOList

@synthesize userExtInfoStaffVOListIdentifier = _userExtInfoStaffVOListIdentifier;
@synthesize staff = _staff;
@synthesize phone = _phone;
@synthesize firstName = _firstName;
@synthesize mbPhone = _mbPhone;
@synthesize sex = _sex;
@synthesize lastName = _lastName;
@synthesize weChat = _weChat;
@synthesize address = _address;
@synthesize qq = _qq;
@synthesize email = _email;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.userExtInfoStaffVOListIdentifier = [[self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListId fromDictionary:dict] doubleValue];
            self.staff = [[self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListStaff fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListSex fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListLastName fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListWeChat fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListQq fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userExtInfoStaffVOListIdentifier] forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staff] forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListStaff];
    [mutableDict setValue:self.phone forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListSex];
    [mutableDict setValue:self.lastName forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListLastName];
    [mutableDict setValue:self.weChat forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListWeChat];
    [mutableDict setValue:self.address forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListQq];
    [mutableDict setValue:self.email forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListEmail];
    [mutableDict setValue:self.name forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListName];

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

    self.userExtInfoStaffVOListIdentifier = [aDecoder decodeDoubleForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListId];
    self.staff = [aDecoder decodeDoubleForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListStaff];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListSex];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListLastName];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListWeChat];
    self.address = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListQq];
    self.email = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userExtInfoStaffVOListIdentifier forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListId];
    [aCoder encodeDouble:_staff forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListStaff];
    [aCoder encodeObject:_phone forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListSex];
    [aCoder encodeObject:_lastName forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListLastName];
    [aCoder encodeObject:_weChat forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListWeChat];
    [aCoder encodeObject:_address forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListQq];
    [aCoder encodeObject:_email forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListEmail];
    [aCoder encodeObject:_name forKey:kJCModel_StoreHouseInfoUserExtInfoStaffVOListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_StoreHouseInfoUserExtInfoStaffVOList *copy = [[JCModel_StoreHouseInfoUserExtInfoStaffVOList alloc] init];
    
    
    
    if (copy) {

        copy.userExtInfoStaffVOListIdentifier = self.userExtInfoStaffVOListIdentifier;
        copy.staff = self.staff;
        copy.phone = [self.phone copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
