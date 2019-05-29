//
//  JCModel_UserData.m
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UserData.h"


NSString *const kJCModel_UserDataId = @"id";
NSString *const kJCModel_UserDataPhone = @"phone";
NSString *const kJCModel_UserDataMbPhone = @"mbPhone";
NSString *const kJCModel_UserDataSex = @"sex";
NSString *const kJCModel_UserDataWeChat = @"weChat";
NSString *const kJCModel_UserDataType = @"type";
NSString *const kJCModel_UserDataThePasswd = @"thePasswd";
NSString *const kJCModel_UserDataAddress = @"address";
NSString *const kJCModel_UserDataCreateTime = @"createTime";
NSString *const kJCModel_UserDataOrgId = @"orgId";
NSString *const kJCModel_UserDataLock = @"lock";
NSString *const kJCModel_UserDataQq = @"qq";
NSString *const kJCModel_UserDataAccount = @"account";
NSString *const kJCModel_UserDataOrgName = @"orgName";
NSString *const kJCModel_UserDataName = @"name";
NSString *const kJCModel_UserDataEmail = @"email";


@interface JCModel_UserData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UserData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize phone = _phone;
@synthesize mbPhone = _mbPhone;
@synthesize sex = _sex;
@synthesize weChat = _weChat;
@synthesize type = _type;
@synthesize thePasswd = _thePasswd;
@synthesize address = _address;
@synthesize createTime = _createTime;
@synthesize orgId = _orgId;
@synthesize lock = _lock;
@synthesize qq = _qq;
@synthesize account = _account;
@synthesize orgName = _orgName;
@synthesize name = _name;
@synthesize email = _email;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_UserDataId fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_UserDataPhone fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_UserDataMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_UserDataSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_UserDataWeChat fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_UserDataType fromDictionary:dict];
            self.thePasswd = [self objectOrNilForKey:kJCModel_UserDataThePasswd fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_UserDataAddress fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_UserDataCreateTime fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_UserDataOrgId fromDictionary:dict];
            self.lock = [[self objectOrNilForKey:kJCModel_UserDataLock fromDictionary:dict] doubleValue];
            self.qq = [self objectOrNilForKey:kJCModel_UserDataQq fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_UserDataAccount fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_UserDataOrgName fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_UserDataName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_UserDataEmail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_UserDataId];
    [mutableDict setValue:self.phone forKey:kJCModel_UserDataPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_UserDataMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_UserDataSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_UserDataWeChat];
    [mutableDict setValue:self.type forKey:kJCModel_UserDataType];
    [mutableDict setValue:self.thePasswd forKey:kJCModel_UserDataThePasswd];
    [mutableDict setValue:self.address forKey:kJCModel_UserDataAddress];
    [mutableDict setValue:self.createTime forKey:kJCModel_UserDataCreateTime];
    [mutableDict setValue:self.orgId forKey:kJCModel_UserDataOrgId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lock] forKey:kJCModel_UserDataLock];
    [mutableDict setValue:self.qq forKey:kJCModel_UserDataQq];
    [mutableDict setValue:self.account forKey:kJCModel_UserDataAccount];
    [mutableDict setValue:self.orgName forKey:kJCModel_UserDataOrgName];
    [mutableDict setValue:self.name forKey:kJCModel_UserDataName];
    [mutableDict setValue:self.email forKey:kJCModel_UserDataEmail];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_UserDataId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_UserDataPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_UserDataMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_UserDataSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_UserDataWeChat];
    self.type = [aDecoder decodeObjectForKey:kJCModel_UserDataType];
    self.thePasswd = [aDecoder decodeObjectForKey:kJCModel_UserDataThePasswd];
    self.address = [aDecoder decodeObjectForKey:kJCModel_UserDataAddress];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_UserDataCreateTime];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_UserDataOrgId];
    self.lock = [aDecoder decodeDoubleForKey:kJCModel_UserDataLock];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_UserDataQq];
    self.account = [aDecoder decodeObjectForKey:kJCModel_UserDataAccount];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_UserDataOrgName];
    self.name = [aDecoder decodeObjectForKey:kJCModel_UserDataName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_UserDataEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_UserDataId];
    [aCoder encodeObject:_phone forKey:kJCModel_UserDataPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_UserDataMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_UserDataSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_UserDataWeChat];
    [aCoder encodeObject:_type forKey:kJCModel_UserDataType];
    [aCoder encodeObject:_thePasswd forKey:kJCModel_UserDataThePasswd];
    [aCoder encodeObject:_address forKey:kJCModel_UserDataAddress];
    [aCoder encodeObject:_createTime forKey:kJCModel_UserDataCreateTime];
    [aCoder encodeObject:_orgId forKey:kJCModel_UserDataOrgId];
    [aCoder encodeDouble:_lock forKey:kJCModel_UserDataLock];
    [aCoder encodeObject:_qq forKey:kJCModel_UserDataQq];
    [aCoder encodeObject:_account forKey:kJCModel_UserDataAccount];
    [aCoder encodeObject:_orgName forKey:kJCModel_UserDataOrgName];
    [aCoder encodeObject:_name forKey:kJCModel_UserDataName];
    [aCoder encodeObject:_email forKey:kJCModel_UserDataEmail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UserData *copy = [[JCModel_UserData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.phone = [self.phone copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.thePasswd = [self.thePasswd copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.lock = self.lock;
        copy.qq = [self.qq copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
    }
    
    return copy;
}


@end
