//
//  JCModel_ProabtionCustomList.m
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ProabtionCustomList.h"


NSString *const kJCModel_ProabtionCustomListId = @"id";
NSString *const kJCModel_ProabtionCustomListGuide = @"guide";
NSString *const kJCModel_ProabtionCustomListDescription = @"description";
NSString *const kJCModel_ProabtionCustomListPhone = @"phone";
NSString *const kJCModel_ProabtionCustomListIntroducer = @"introducer";
NSString *const kJCModel_ProabtionCustomListFrom = @"from";
NSString *const kJCModel_ProabtionCustomListWeChat = @"weChat";
NSString *const kJCModel_ProabtionCustomListAddress = @"address";
NSString *const kJCModel_ProabtionCustomListCreateTime = @"createTime";
NSString *const kJCModel_ProabtionCustomListIsRegister = @"isRegister";
NSString *const kJCModel_ProabtionCustomListAccount = @"account";
NSString *const kJCModel_ProabtionCustomListName = @"name";


@interface JCModel_ProabtionCustomList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ProabtionCustomList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize listDescription = _listDescription;
@synthesize phone = _phone;
@synthesize introducer = _introducer;
@synthesize from = _from;
@synthesize weChat = _weChat;
@synthesize address = _address;
@synthesize createTime = _createTime;
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
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_ProabtionCustomListId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_ProabtionCustomListGuide fromDictionary:dict] doubleValue];
            self.listDescription = [self objectOrNilForKey:kJCModel_ProabtionCustomListDescription fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_ProabtionCustomListPhone fromDictionary:dict];
            self.introducer = [[self objectOrNilForKey:kJCModel_ProabtionCustomListIntroducer fromDictionary:dict] doubleValue];
            self.from = [[self objectOrNilForKey:kJCModel_ProabtionCustomListFrom fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_ProabtionCustomListWeChat fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_ProabtionCustomListAddress fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_ProabtionCustomListCreateTime fromDictionary:dict];
            self.isRegister = [[self objectOrNilForKey:kJCModel_ProabtionCustomListIsRegister fromDictionary:dict] doubleValue];
            self.account = [self objectOrNilForKey:kJCModel_ProabtionCustomListAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_ProabtionCustomListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_ProabtionCustomListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_ProabtionCustomListGuide];
    [mutableDict setValue:self.listDescription forKey:kJCModel_ProabtionCustomListDescription];
    [mutableDict setValue:self.phone forKey:kJCModel_ProabtionCustomListPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.introducer] forKey:kJCModel_ProabtionCustomListIntroducer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.from] forKey:kJCModel_ProabtionCustomListFrom];
    [mutableDict setValue:self.weChat forKey:kJCModel_ProabtionCustomListWeChat];
    [mutableDict setValue:self.address forKey:kJCModel_ProabtionCustomListAddress];
    [mutableDict setValue:self.createTime forKey:kJCModel_ProabtionCustomListCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isRegister] forKey:kJCModel_ProabtionCustomListIsRegister];
    [mutableDict setValue:self.account forKey:kJCModel_ProabtionCustomListAccount];
    [mutableDict setValue:self.name forKey:kJCModel_ProabtionCustomListName];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomListGuide];
    self.listDescription = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListDescription];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListPhone];
    self.introducer = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomListIntroducer];
    self.from = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomListFrom];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListWeChat];
    self.address = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListAddress];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListCreateTime];
    self.isRegister = [aDecoder decodeDoubleForKey:kJCModel_ProabtionCustomListIsRegister];
    self.account = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_ProabtionCustomListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_ProabtionCustomListGuide];
    [aCoder encodeObject:_listDescription forKey:kJCModel_ProabtionCustomListDescription];
    [aCoder encodeObject:_phone forKey:kJCModel_ProabtionCustomListPhone];
    [aCoder encodeDouble:_introducer forKey:kJCModel_ProabtionCustomListIntroducer];
    [aCoder encodeDouble:_from forKey:kJCModel_ProabtionCustomListFrom];
    [aCoder encodeObject:_weChat forKey:kJCModel_ProabtionCustomListWeChat];
    [aCoder encodeObject:_address forKey:kJCModel_ProabtionCustomListAddress];
    [aCoder encodeObject:_createTime forKey:kJCModel_ProabtionCustomListCreateTime];
    [aCoder encodeDouble:_isRegister forKey:kJCModel_ProabtionCustomListIsRegister];
    [aCoder encodeObject:_account forKey:kJCModel_ProabtionCustomListAccount];
    [aCoder encodeObject:_name forKey:kJCModel_ProabtionCustomListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ProabtionCustomList *copy = [[JCModel_ProabtionCustomList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.guide = self.guide;
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.introducer = self.introducer;
        copy.from = self.from;
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.isRegister = self.isRegister;
        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
