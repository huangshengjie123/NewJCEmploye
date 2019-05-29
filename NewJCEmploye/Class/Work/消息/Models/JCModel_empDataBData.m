//
//  JCModel_empDataBData.m
//
//  Created by   on 2019/1/14
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_empDataBData.h"


NSString *const kJCModel_empDataBDataId = @"id";
NSString *const kJCModel_empDataBDataLastName = @"lastName";
NSString *const kJCModel_empDataBDataPhone = @"phone";
NSString *const kJCModel_empDataBDataFirstName = @"firstName";
NSString *const kJCModel_empDataBDataMbPhone = @"mbPhone";
NSString *const kJCModel_empDataBDataSex = @"sex";
NSString *const kJCModel_empDataBDataWeChat = @"weChat";
NSString *const kJCModel_empDataBDataXpath = @"xpath";
NSString *const kJCModel_empDataBDataAddress = @"address";
NSString *const kJCModel_empDataBDataQq = @"qq";
NSString *const kJCModel_empDataBDataOrgName = @"orgName";
NSString *const kJCModel_empDataBDataEmail = @"email";
NSString *const kJCModel_empDataBDataName = @"name";


@interface JCModel_empDataBData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_empDataBData

@synthesize dataIdentifier = _dataIdentifier;
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
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_empDataBDataId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_empDataBDataLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_empDataBDataPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_empDataBDataFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_empDataBDataMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_empDataBDataSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_empDataBDataWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_empDataBDataXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_empDataBDataAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_empDataBDataQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_empDataBDataOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_empDataBDataEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_empDataBDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_empDataBDataId];
    [mutableDict setValue:self.lastName forKey:kJCModel_empDataBDataLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_empDataBDataPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_empDataBDataFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_empDataBDataMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_empDataBDataSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_empDataBDataWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_empDataBDataXpath];
    [mutableDict setValue:self.address forKey:kJCModel_empDataBDataAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_empDataBDataQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_empDataBDataOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_empDataBDataEmail];
    [mutableDict setValue:self.name forKey:kJCModel_empDataBDataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_empDataBDataId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_empDataBDataLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_empDataBDataPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_empDataBDataFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_empDataBDataMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_empDataBDataSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_empDataBDataWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_empDataBDataXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_empDataBDataAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_empDataBDataQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_empDataBDataOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_empDataBDataEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_empDataBDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_empDataBDataId];
    [aCoder encodeObject:_lastName forKey:kJCModel_empDataBDataLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_empDataBDataPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_empDataBDataFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_empDataBDataMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_empDataBDataSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_empDataBDataWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_empDataBDataXpath];
    [aCoder encodeObject:_address forKey:kJCModel_empDataBDataAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_empDataBDataQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_empDataBDataOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_empDataBDataEmail];
    [aCoder encodeObject:_name forKey:kJCModel_empDataBDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_empDataBData *copy = [[JCModel_empDataBData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
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
