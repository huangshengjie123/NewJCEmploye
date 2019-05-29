//
//  JCModel_DepartmentUserInfoData.m
//
//  Created by   on 2018/4/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentUserInfoData.h"


NSString *const kJCModel_DepartmentUserInfoDataId = @"id";
NSString *const kJCModel_DepartmentUserInfoDataLastName = @"lastName";
NSString *const kJCModel_DepartmentUserInfoDataPhone = @"phone";
NSString *const kJCModel_DepartmentUserInfoDataFirstName = @"firstName";
NSString *const kJCModel_DepartmentUserInfoDataMbPhone = @"mbPhone";
NSString *const kJCModel_DepartmentUserInfoDataSex = @"sex";
NSString *const kJCModel_DepartmentUserInfoDataWeChat = @"weChat";
NSString *const kJCModel_DepartmentUserInfoDataAddress = @"address";
NSString *const kJCModel_DepartmentUserInfoDataQq = @"qq";
NSString *const kJCModel_DepartmentUserInfoDataOrgName = @"orgName";
NSString *const kJCModel_DepartmentUserInfoDataEmail = @"email";
NSString *const kJCModel_DepartmentUserInfoDataName = @"name";


@interface JCModel_DepartmentUserInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentUserInfoData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize lastName = _lastName;
@synthesize phone = _phone;
@synthesize firstName = _firstName;
@synthesize mbPhone = _mbPhone;
@synthesize sex = _sex;
@synthesize weChat = _weChat;
@synthesize address = _address;
@synthesize qq = _qq;
@synthesize orgName = _orgName;
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
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_DepartmentUserInfoDataId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataWeChat fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_DepartmentUserInfoDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_DepartmentUserInfoDataId];
    [mutableDict setValue:self.lastName forKey:kJCModel_DepartmentUserInfoDataLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_DepartmentUserInfoDataPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_DepartmentUserInfoDataFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_DepartmentUserInfoDataMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_DepartmentUserInfoDataSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_DepartmentUserInfoDataWeChat];
    [mutableDict setValue:self.address forKey:kJCModel_DepartmentUserInfoDataAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_DepartmentUserInfoDataQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_DepartmentUserInfoDataOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_DepartmentUserInfoDataEmail];
    [mutableDict setValue:self.name forKey:kJCModel_DepartmentUserInfoDataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_DepartmentUserInfoDataId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataWeChat];
    self.address = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_DepartmentUserInfoDataId];
    [aCoder encodeObject:_lastName forKey:kJCModel_DepartmentUserInfoDataLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_DepartmentUserInfoDataPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_DepartmentUserInfoDataFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_DepartmentUserInfoDataMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_DepartmentUserInfoDataSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_DepartmentUserInfoDataWeChat];
    [aCoder encodeObject:_address forKey:kJCModel_DepartmentUserInfoDataAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_DepartmentUserInfoDataQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_DepartmentUserInfoDataOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_DepartmentUserInfoDataEmail];
    [aCoder encodeObject:_name forKey:kJCModel_DepartmentUserInfoDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentUserInfoData *copy = [[JCModel_DepartmentUserInfoData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
