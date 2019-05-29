//
//  JCModel_employeeInfoData.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_employeeInfoData.h"


NSString *const kJCModel_employeeInfoDataId = @"id";
NSString *const kJCModel_employeeInfoDataLastName = @"lastName";
NSString *const kJCModel_employeeInfoDataPhone = @"phone";
NSString *const kJCModel_employeeInfoDataFirstName = @"firstName";
NSString *const kJCModel_employeeInfoDataMbPhone = @"mbPhone";
NSString *const kJCModel_employeeInfoDataSex = @"sex";
NSString *const kJCModel_employeeInfoDataWeChat = @"weChat";
NSString *const kJCModel_employeeInfoDataAddress = @"address";
NSString *const kJCModel_employeeInfoDataQq = @"qq";
NSString *const kJCModel_employeeInfoDataOrgName = @"orgName";
NSString *const kJCModel_employeeInfoDataEmail = @"email";
NSString *const kJCModel_employeeInfoDataName = @"name";


@interface JCModel_employeeInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_employeeInfoData

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
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_employeeInfoDataId fromDictionary:dict] doubleValue];
            self.lastName = [self objectOrNilForKey:kJCModel_employeeInfoDataLastName fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_employeeInfoDataPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kJCModel_employeeInfoDataFirstName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_employeeInfoDataMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_employeeInfoDataSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_employeeInfoDataWeChat fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_employeeInfoDataAddress fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_employeeInfoDataQq fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_employeeInfoDataOrgName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_employeeInfoDataEmail fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_employeeInfoDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_employeeInfoDataId];
    [mutableDict setValue:self.lastName forKey:kJCModel_employeeInfoDataLastName];
    [mutableDict setValue:self.phone forKey:kJCModel_employeeInfoDataPhone];
    [mutableDict setValue:self.firstName forKey:kJCModel_employeeInfoDataFirstName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_employeeInfoDataMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_employeeInfoDataSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_employeeInfoDataWeChat];
    [mutableDict setValue:self.address forKey:kJCModel_employeeInfoDataAddress];
    [mutableDict setValue:self.qq forKey:kJCModel_employeeInfoDataQq];
    [mutableDict setValue:self.orgName forKey:kJCModel_employeeInfoDataOrgName];
    [mutableDict setValue:self.email forKey:kJCModel_employeeInfoDataEmail];
    [mutableDict setValue:self.name forKey:kJCModel_employeeInfoDataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_employeeInfoDataId];
    self.lastName = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataLastName];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataPhone];
    self.firstName = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataFirstName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataWeChat];
    self.address = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataAddress];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataQq];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataOrgName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataEmail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_employeeInfoDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_employeeInfoDataId];
    [aCoder encodeObject:_lastName forKey:kJCModel_employeeInfoDataLastName];
    [aCoder encodeObject:_phone forKey:kJCModel_employeeInfoDataPhone];
    [aCoder encodeObject:_firstName forKey:kJCModel_employeeInfoDataFirstName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_employeeInfoDataMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_employeeInfoDataSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_employeeInfoDataWeChat];
    [aCoder encodeObject:_address forKey:kJCModel_employeeInfoDataAddress];
    [aCoder encodeObject:_qq forKey:kJCModel_employeeInfoDataQq];
    [aCoder encodeObject:_orgName forKey:kJCModel_employeeInfoDataOrgName];
    [aCoder encodeObject:_email forKey:kJCModel_employeeInfoDataEmail];
    [aCoder encodeObject:_name forKey:kJCModel_employeeInfoDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_employeeInfoData *copy = [[JCModel_employeeInfoData alloc] init];
    
    
    
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
