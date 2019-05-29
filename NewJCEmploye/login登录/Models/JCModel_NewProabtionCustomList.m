//
//  JCModel_NewProabtionCustomList.m
//
//  Created by   on 2019/2/15
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProabtionCustomList.h"


NSString *const kJCModel_NewProabtionCustomListId = @"id";
NSString *const kJCModel_NewProabtionCustomListGuide = @"guide";
NSString *const kJCModel_NewProabtionCustomListAreaId = @"areaId";
NSString *const kJCModel_NewProabtionCustomListPhone = @"phone";
NSString *const kJCModel_NewProabtionCustomListDescription = @"description";
NSString *const kJCModel_NewProabtionCustomListIntroducer = @"introducer";
NSString *const kJCModel_NewProabtionCustomListSex = @"sex";
NSString *const kJCModel_NewProabtionCustomListFrom = @"from";
NSString *const kJCModel_NewProabtionCustomListIntroducerName = @"introducerName";
NSString *const kJCModel_NewProabtionCustomListWeChat = @"weChat";
NSString *const kJCModel_NewProabtionCustomListXpath = @"xpath";
NSString *const kJCModel_NewProabtionCustomListCreateTime = @"createTime";
NSString *const kJCModel_NewProabtionCustomListAddress = @"address";
NSString *const kJCModel_NewProabtionCustomListIsRegister = @"isRegister";
NSString *const kJCModel_NewProabtionCustomListAccount = @"account";
NSString *const kJCModel_NewProabtionCustomListName = @"name";


@interface JCModel_NewProabtionCustomList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProabtionCustomList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize phone = _phone;
@synthesize listDescription = _listDescription;
@synthesize introducer = _introducer;
@synthesize sex = _sex;
@synthesize from = _from;
@synthesize introducerName = _introducerName;
@synthesize weChat = _weChat;
@synthesize xpath = _xpath;
@synthesize createTime = _createTime;
@synthesize address = _address;
@synthesize isRegister = _isRegister;
@synthesize account = _account;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_NewProabtionCustomListId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_NewProabtionCustomListGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_NewProabtionCustomListAreaId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_NewProabtionCustomListPhone fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kJCModel_NewProabtionCustomListDescription fromDictionary:dict];
            self.introducer = [self objectOrNilForKey:kJCModel_NewProabtionCustomListIntroducer fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_NewProabtionCustomListSex fromDictionary:dict];
            self.from = [[self objectOrNilForKey:kJCModel_NewProabtionCustomListFrom fromDictionary:dict] doubleValue];
            self.introducerName = [self objectOrNilForKey:kJCModel_NewProabtionCustomListIntroducerName fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_NewProabtionCustomListWeChat fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_NewProabtionCustomListXpath fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_NewProabtionCustomListCreateTime fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_NewProabtionCustomListAddress fromDictionary:dict];
            self.isRegister = [[self objectOrNilForKey:kJCModel_NewProabtionCustomListIsRegister fromDictionary:dict] doubleValue];
            self.account = [self objectOrNilForKey:kJCModel_NewProabtionCustomListAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewProabtionCustomListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_NewProabtionCustomListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_NewProabtionCustomListGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_NewProabtionCustomListAreaId];
    [mutableDict setValue:self.phone forKey:kJCModel_NewProabtionCustomListPhone];
    [mutableDict setValue:self.listDescription forKey:kJCModel_NewProabtionCustomListDescription];
    [mutableDict setValue:self.introducer forKey:kJCModel_NewProabtionCustomListIntroducer];
    [mutableDict setValue:self.sex forKey:kJCModel_NewProabtionCustomListSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.from] forKey:kJCModel_NewProabtionCustomListFrom];
    [mutableDict setValue:self.introducerName forKey:kJCModel_NewProabtionCustomListIntroducerName];
    [mutableDict setValue:self.weChat forKey:kJCModel_NewProabtionCustomListWeChat];
    [mutableDict setValue:self.xpath forKey:kJCModel_NewProabtionCustomListXpath];
    [mutableDict setValue:self.createTime forKey:kJCModel_NewProabtionCustomListCreateTime];
    [mutableDict setValue:self.address forKey:kJCModel_NewProabtionCustomListAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isRegister] forKey:kJCModel_NewProabtionCustomListIsRegister];
    [mutableDict setValue:self.account forKey:kJCModel_NewProabtionCustomListAccount];
    [mutableDict setValue:self.name forKey:kJCModel_NewProabtionCustomListName];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomListGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListAreaId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListPhone];
    self.listDescription = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListDescription];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListIntroducer];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListSex];
    self.from = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomListFrom];
    self.introducerName = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListIntroducerName];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListWeChat];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListXpath];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListCreateTime];
    self.address = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListAddress];
    self.isRegister = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomListIsRegister];
    self.account = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_NewProabtionCustomListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_NewProabtionCustomListGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_NewProabtionCustomListAreaId];
    [aCoder encodeObject:_phone forKey:kJCModel_NewProabtionCustomListPhone];
    [aCoder encodeObject:_listDescription forKey:kJCModel_NewProabtionCustomListDescription];
    [aCoder encodeObject:_introducer forKey:kJCModel_NewProabtionCustomListIntroducer];
    [aCoder encodeObject:_sex forKey:kJCModel_NewProabtionCustomListSex];
    [aCoder encodeDouble:_from forKey:kJCModel_NewProabtionCustomListFrom];
    [aCoder encodeObject:_introducerName forKey:kJCModel_NewProabtionCustomListIntroducerName];
    [aCoder encodeObject:_weChat forKey:kJCModel_NewProabtionCustomListWeChat];
    [aCoder encodeObject:_xpath forKey:kJCModel_NewProabtionCustomListXpath];
    [aCoder encodeObject:_createTime forKey:kJCModel_NewProabtionCustomListCreateTime];
    [aCoder encodeObject:_address forKey:kJCModel_NewProabtionCustomListAddress];
    [aCoder encodeDouble:_isRegister forKey:kJCModel_NewProabtionCustomListIsRegister];
    [aCoder encodeObject:_account forKey:kJCModel_NewProabtionCustomListAccount];
    [aCoder encodeObject:_name forKey:kJCModel_NewProabtionCustomListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProabtionCustomList *copy = [[JCModel_NewProabtionCustomList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.guide = self.guide;
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.introducer = [self.introducer copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.from = self.from;
        copy.introducerName = [self.introducerName copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.isRegister = self.isRegister;
        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
