//
//  JCModel_GroupEMPList.m
//
//  Created by   on 2018/11/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupEMPList.h"


NSString *const kJCModel_GroupEMPListId = @"id";
NSString *const kJCModel_GroupEMPListPhone = @"phone";
NSString *const kJCModel_GroupEMPListMbPhone = @"mbPhone";
NSString *const kJCModel_GroupEMPListSex = @"sex";
NSString *const kJCModel_GroupEMPListWeChat = @"weChat";
NSString *const kJCModel_GroupEMPListType = @"type";
NSString *const kJCModel_GroupEMPListSaleGroupId = @"saleGroupId";
NSString *const kJCModel_GroupEMPListAddress = @"address";
NSString *const kJCModel_GroupEMPListCreateTime = @"createTime";
NSString *const kJCModel_GroupEMPListOrgId = @"orgId";
NSString *const kJCModel_GroupEMPListLock = @"lock";
NSString *const kJCModel_GroupEMPListQq = @"qq";
NSString *const kJCModel_GroupEMPListAccount = @"account";
NSString *const kJCModel_GroupEMPListOrgName = @"orgName";
NSString *const kJCModel_GroupEMPListName = @"name";
NSString *const kJCModel_GroupEMPListEmail = @"email";


@interface JCModel_GroupEMPList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupEMPList

@synthesize listIdentifier = _listIdentifier;
@synthesize phone = _phone;
@synthesize mbPhone = _mbPhone;
@synthesize sex = _sex;
@synthesize weChat = _weChat;
@synthesize type = _type;
@synthesize saleGroupId = _saleGroupId;
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
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_GroupEMPListId fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_GroupEMPListPhone fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_GroupEMPListMbPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_GroupEMPListSex fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_GroupEMPListWeChat fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_GroupEMPListType fromDictionary:dict];
            self.saleGroupId = [self objectOrNilForKey:kJCModel_GroupEMPListSaleGroupId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_GroupEMPListAddress fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_GroupEMPListCreateTime fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_GroupEMPListOrgId fromDictionary:dict];
            self.lock = [[self objectOrNilForKey:kJCModel_GroupEMPListLock fromDictionary:dict] doubleValue];
            self.qq = [self objectOrNilForKey:kJCModel_GroupEMPListQq fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_GroupEMPListAccount fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_GroupEMPListOrgName fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_GroupEMPListName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_GroupEMPListEmail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_GroupEMPListId];
    [mutableDict setValue:self.phone forKey:kJCModel_GroupEMPListPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_GroupEMPListMbPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_GroupEMPListSex];
    [mutableDict setValue:self.weChat forKey:kJCModel_GroupEMPListWeChat];
    [mutableDict setValue:self.type forKey:kJCModel_GroupEMPListType];
    [mutableDict setValue:self.saleGroupId forKey:kJCModel_GroupEMPListSaleGroupId];
    [mutableDict setValue:self.address forKey:kJCModel_GroupEMPListAddress];
    [mutableDict setValue:self.createTime forKey:kJCModel_GroupEMPListCreateTime];
    [mutableDict setValue:self.orgId forKey:kJCModel_GroupEMPListOrgId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lock] forKey:kJCModel_GroupEMPListLock];
    [mutableDict setValue:self.qq forKey:kJCModel_GroupEMPListQq];
    [mutableDict setValue:self.account forKey:kJCModel_GroupEMPListAccount];
    [mutableDict setValue:self.orgName forKey:kJCModel_GroupEMPListOrgName];
    [mutableDict setValue:self.name forKey:kJCModel_GroupEMPListName];
    [mutableDict setValue:self.email forKey:kJCModel_GroupEMPListEmail];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPListId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListMbPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListSex];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListWeChat];
    self.type = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListType];
    self.saleGroupId = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListSaleGroupId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListAddress];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListCreateTime];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListOrgId];
    self.lock = [aDecoder decodeDoubleForKey:kJCModel_GroupEMPListLock];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListQq];
    self.account = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListAccount];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListOrgName];
    self.name = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_GroupEMPListEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_GroupEMPListId];
    [aCoder encodeObject:_phone forKey:kJCModel_GroupEMPListPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_GroupEMPListMbPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_GroupEMPListSex];
    [aCoder encodeObject:_weChat forKey:kJCModel_GroupEMPListWeChat];
    [aCoder encodeObject:_type forKey:kJCModel_GroupEMPListType];
    [aCoder encodeObject:_saleGroupId forKey:kJCModel_GroupEMPListSaleGroupId];
    [aCoder encodeObject:_address forKey:kJCModel_GroupEMPListAddress];
    [aCoder encodeObject:_createTime forKey:kJCModel_GroupEMPListCreateTime];
    [aCoder encodeObject:_orgId forKey:kJCModel_GroupEMPListOrgId];
    [aCoder encodeDouble:_lock forKey:kJCModel_GroupEMPListLock];
    [aCoder encodeObject:_qq forKey:kJCModel_GroupEMPListQq];
    [aCoder encodeObject:_account forKey:kJCModel_GroupEMPListAccount];
    [aCoder encodeObject:_orgName forKey:kJCModel_GroupEMPListOrgName];
    [aCoder encodeObject:_name forKey:kJCModel_GroupEMPListName];
    [aCoder encodeObject:_email forKey:kJCModel_GroupEMPListEmail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupEMPList *copy = [[JCModel_GroupEMPList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.phone = [self.phone copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.saleGroupId = [self.saleGroupId copyWithZone:zone];
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
