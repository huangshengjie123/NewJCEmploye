//
//  JCModel_empInfo2Data.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_empInfo2Data.h"


NSString *const kJCModel_empInfo2DataId = @"id";
NSString *const kJCModel_empInfo2DataLastName = @"lastName";
NSString *const kJCModel_empInfo2DataPhone = @"phone";
NSString *const kJCModel_empInfo2DataFirstName = @"firstName";
NSString *const kJCModel_empInfo2DataMbPhone = @"mbPhone";
NSString *const kJCModel_empInfo2DataSex = @"sex";
NSString *const kJCModel_empInfo2DataWeChat = @"weChat";
NSString *const kJCModel_empInfo2DataXpath = @"xpath";
NSString *const kJCModel_empInfo2DataAddress = @"address";
NSString *const kJCModel_empInfo2DataQq = @"qq";
NSString *const kJCModel_empInfo2DataOrgName = @"orgName";
NSString *const kJCModel_empInfo2DataEmail = @"email";
NSString *const kJCModel_empInfo2DataName = @"name";


@interface JCModel_empInfo2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_empInfo2Data

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
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_empInfo2DataId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_empInfo2DataLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_empInfo2DataPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_empInfo2DataFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_empInfo2DataMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_empInfo2DataSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_empInfo2DataWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_empInfo2DataXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_empInfo2DataAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_empInfo2DataQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_empInfo2DataOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_empInfo2DataEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_empInfo2DataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_empInfo2DataId];
    [mutableDict setValue:self.lastName forKey:kJCModel_empInfo2DataLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_empInfo2DataPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_empInfo2DataFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_empInfo2DataMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_empInfo2DataSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_empInfo2DataWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_empInfo2DataXpath];
    [mutableDict setValue:self.address forKey:kJCModel_empInfo2DataAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_empInfo2DataQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_empInfo2DataOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_empInfo2DataEmail];
    [mutableDict setValue:self.name forKey:kJCModel_empInfo2DataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_empInfo2DataId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_empInfo2DataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_empInfo2DataId];
    [aCoder encodeObject:_lastName forKey:kJCModel_empInfo2DataLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_empInfo2DataPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_empInfo2DataFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_empInfo2DataMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_empInfo2DataSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_empInfo2DataWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_empInfo2DataXpath];
    [aCoder encodeObject:_address forKey:kJCModel_empInfo2DataAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_empInfo2DataQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_empInfo2DataOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_empInfo2DataEmail];
    [aCoder encodeObject:_name forKey:kJCModel_empInfo2DataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_empInfo2Data *copy = [[JCModel_empInfo2Data alloc] init];
    
    
    
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
