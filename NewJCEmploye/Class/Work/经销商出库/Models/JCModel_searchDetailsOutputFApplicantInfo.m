//
//  JCModel_searchDetailsOutputFApplicantInfo.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFApplicantInfo.h"


NSString *const kJCModel_searchDetailsOutputFApplicantInfoId = @"id";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoLastName = @"lastName";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoPhone = @"phone";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoFirstName = @"firstName";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoMbPhone = @"mbPhone";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoSex = @"sex";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoWeChat = @"weChat";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoXpath = @"xpath";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoAddress = @"address";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoQq = @"qq";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoOrgName = @"orgName";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoEmail = @"email";
NSString *const kJCModel_searchDetailsOutputFApplicantInfoName = @"name";


@interface JCModel_searchDetailsOutputFApplicantInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFApplicantInfo

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
            self.applicantInfoIdentifier = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_searchDetailsOutputFApplicantInfoName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicantInfoIdentifier] forKey:kJCModel_searchDetailsOutputFApplicantInfoId];
    [mutableDict setValue:self.lastName forKey:kJCModel_searchDetailsOutputFApplicantInfoLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_searchDetailsOutputFApplicantInfoPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_searchDetailsOutputFApplicantInfoFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_searchDetailsOutputFApplicantInfoMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_searchDetailsOutputFApplicantInfoSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_searchDetailsOutputFApplicantInfoWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_searchDetailsOutputFApplicantInfoXpath];
    [mutableDict setValue:self.address forKey:kJCModel_searchDetailsOutputFApplicantInfoAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_searchDetailsOutputFApplicantInfoQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_searchDetailsOutputFApplicantInfoOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_searchDetailsOutputFApplicantInfoEmail];
    [mutableDict setValue:self.name forKey:kJCModel_searchDetailsOutputFApplicantInfoName];

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

    self.applicantInfoIdentifier = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFApplicantInfoId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFApplicantInfoName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_applicantInfoIdentifier forKey:kJCModel_searchDetailsOutputFApplicantInfoId];
    [aCoder encodeObject:_lastName forKey:kJCModel_searchDetailsOutputFApplicantInfoLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_searchDetailsOutputFApplicantInfoPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_searchDetailsOutputFApplicantInfoFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_searchDetailsOutputFApplicantInfoMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_searchDetailsOutputFApplicantInfoSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_searchDetailsOutputFApplicantInfoWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_searchDetailsOutputFApplicantInfoXpath];
    [aCoder encodeObject:_address forKey:kJCModel_searchDetailsOutputFApplicantInfoAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_searchDetailsOutputFApplicantInfoQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_searchDetailsOutputFApplicantInfoOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_searchDetailsOutputFApplicantInfoEmail];
    [aCoder encodeObject:_name forKey:kJCModel_searchDetailsOutputFApplicantInfoName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFApplicantInfo *copy = [[JCModel_searchDetailsOutputFApplicantInfo alloc] init];
    
    
    
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
