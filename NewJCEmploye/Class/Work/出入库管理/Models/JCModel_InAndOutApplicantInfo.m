//
//  JCModel_InAndOutApplicantInfo.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutApplicantInfo.h"


NSString *const kJCModel_InAndOutApplicantInfoId = @"id";
NSString *const kJCModel_InAndOutApplicantInfoLastName = @"lastName";
NSString *const kJCModel_InAndOutApplicantInfoPhone = @"phone";
NSString *const kJCModel_InAndOutApplicantInfoFirstName = @"firstName";
NSString *const kJCModel_InAndOutApplicantInfoMbPhone = @"mbPhone";
NSString *const kJCModel_InAndOutApplicantInfoSex = @"sex";
NSString *const kJCModel_InAndOutApplicantInfoWeChat = @"weChat";
NSString *const kJCModel_InAndOutApplicantInfoXpath = @"xpath";
NSString *const kJCModel_InAndOutApplicantInfoAddress = @"address";
NSString *const kJCModel_InAndOutApplicantInfoQq = @"qq";
NSString *const kJCModel_InAndOutApplicantInfoOrgName = @"orgName";
NSString *const kJCModel_InAndOutApplicantInfoEmail = @"email";
NSString *const kJCModel_InAndOutApplicantInfoName = @"name";


@interface JCModel_InAndOutApplicantInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutApplicantInfo

@synthesize applicantInfoIdentifier = _applicantInfoIdentifier;
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
            self.applicantInfoIdentifier = [[self objectOrNilForKey:kJCModel_InAndOutApplicantInfoId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_InAndOutApplicantInfoName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicantInfoIdentifier] forKey:kJCModel_InAndOutApplicantInfoId];
    [mutableDict setValue:self.lastName forKey:kJCModel_InAndOutApplicantInfoLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_InAndOutApplicantInfoPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_InAndOutApplicantInfoFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_InAndOutApplicantInfoMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_InAndOutApplicantInfoSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_InAndOutApplicantInfoWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_InAndOutApplicantInfoXpath];
    [mutableDict setValue:self.address forKey:kJCModel_InAndOutApplicantInfoAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_InAndOutApplicantInfoQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_InAndOutApplicantInfoOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_InAndOutApplicantInfoEmail];
    [mutableDict setValue:self.name forKey:kJCModel_InAndOutApplicantInfoName];

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

    self.applicantInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_InAndOutApplicantInfoId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InAndOutApplicantInfoName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_applicantInfoIdentifier forKey:kJCModel_InAndOutApplicantInfoId];
    [aCoder encodeObject:_lastName forKey:kJCModel_InAndOutApplicantInfoLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_InAndOutApplicantInfoPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_InAndOutApplicantInfoFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_InAndOutApplicantInfoMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_InAndOutApplicantInfoSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_InAndOutApplicantInfoWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_InAndOutApplicantInfoXpath];
    [aCoder encodeObject:_address forKey:kJCModel_InAndOutApplicantInfoAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_InAndOutApplicantInfoQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_InAndOutApplicantInfoOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_InAndOutApplicantInfoEmail];
    [aCoder encodeObject:_name forKey:kJCModel_InAndOutApplicantInfoName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutApplicantInfo *copy = [[JCModel_InAndOutApplicantInfo alloc] init];
    
    
    
    if (copy) {

        copy.applicantInfoIdentifier = self.applicantInfoIdentifier;
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
