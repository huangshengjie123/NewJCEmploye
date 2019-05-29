//
//  JCModel_DistributionUserExtInfo.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionUserExtInfo.h"


NSString *const kJCModel_DistributionUserExtInfoId = @"id";
NSString *const kJCModel_DistributionUserExtInfoLastName = @"lastName";
NSString *const kJCModel_DistributionUserExtInfoPhone = @"phone";
NSString *const kJCModel_DistributionUserExtInfoFirstName = @"firstName";
NSString *const kJCModel_DistributionUserExtInfoMbPhone = @"mbPhone";
NSString *const kJCModel_DistributionUserExtInfoSex = @"sex";
NSString *const kJCModel_DistributionUserExtInfoWeChat = @"weChat";
NSString *const kJCModel_DistributionUserExtInfoXpath = @"xpath";
NSString *const kJCModel_DistributionUserExtInfoAddress = @"address";
NSString *const kJCModel_DistributionUserExtInfoQq = @"qq";
NSString *const kJCModel_DistributionUserExtInfoOrgName = @"orgName";
NSString *const kJCModel_DistributionUserExtInfoEmail = @"email";
NSString *const kJCModel_DistributionUserExtInfoName = @"name";


@interface JCModel_DistributionUserExtInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionUserExtInfo

@synthesize userExtInfoIdentifier = _userExtInfoIdentifier;
@synthesize lastName = _lastName;
@synthesize phone = _phone;
@synthesize firstName = _firstName;
@synthesize mbPhone = _mbPhone;
@synthesize sex = _sex;
@synthesize weChat = _weChat;
@synthesize xpath = _xpath;
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
            self.userExtInfoIdentifier = [[self objectOrNilForKey:kJCModel_DistributionUserExtInfoId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_DistributionUserExtInfoName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userExtInfoIdentifier] forKey:kJCModel_DistributionUserExtInfoId];
    [mutableDict setValue:self.lastName forKey:kJCModel_DistributionUserExtInfoLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_DistributionUserExtInfoPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_DistributionUserExtInfoFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_DistributionUserExtInfoMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_DistributionUserExtInfoSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_DistributionUserExtInfoWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_DistributionUserExtInfoXpath];
    [mutableDict setValue:self.address forKey:kJCModel_DistributionUserExtInfoAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_DistributionUserExtInfoQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_DistributionUserExtInfoOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_DistributionUserExtInfoEmail];
    [mutableDict setValue:self.name forKey:kJCModel_DistributionUserExtInfoName];

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

    self.userExtInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_DistributionUserExtInfoId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_DistributionUserExtInfoName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userExtInfoIdentifier forKey:kJCModel_DistributionUserExtInfoId];
    [aCoder encodeObject:_lastName forKey:kJCModel_DistributionUserExtInfoLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_DistributionUserExtInfoPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_DistributionUserExtInfoFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_DistributionUserExtInfoMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_DistributionUserExtInfoSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_DistributionUserExtInfoWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_DistributionUserExtInfoXpath];
    [aCoder encodeObject:_address forKey:kJCModel_DistributionUserExtInfoAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_DistributionUserExtInfoQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_DistributionUserExtInfoOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_DistributionUserExtInfoEmail];
    [aCoder encodeObject:_name forKey:kJCModel_DistributionUserExtInfoName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionUserExtInfo *copy = [[JCModel_DistributionUserExtInfo alloc] init];
    
    
    
    if (copy) {

        copy.userExtInfoIdentifier = self.userExtInfoIdentifier;
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
