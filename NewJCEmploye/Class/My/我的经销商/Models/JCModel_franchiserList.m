//
//  JCModel_franchiserList.m
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserList.h"
#import "JCModel_franchiserStores.h"


NSString *const kJCModel_franchiserListId = @"id";
NSString *const kJCModel_franchiserListGuide = @"guide";
NSString *const kJCModel_franchiserListAreaId = @"areaId";
NSString *const kJCModel_franchiserListUid = @"uid";
NSString *const kJCModel_franchiserListPhone = @"phone";
NSString *const kJCModel_franchiserListProvince = @"province";
NSString *const kJCModel_franchiserListCom = @"com";
NSString *const kJCModel_franchiserListUserPhone = @"userPhone";
NSString *const kJCModel_franchiserListType = @"type";
NSString *const kJCModel_franchiserListRatio = @"ratio";
NSString *const kJCModel_franchiserListBalance = @"balance";
NSString *const kJCModel_franchiserListAddress = @"address";
NSString *const kJCModel_franchiserListXpath = @"xpath";
NSString *const kJCModel_franchiserListUsername = @"username";
NSString *const kJCModel_franchiserListStores = @"stores";
NSString *const kJCModel_franchiserListAccount = @"account";
NSString *const kJCModel_franchiserListName = @"name";


@interface JCModel_franchiserList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize uid = _uid;
@synthesize phone = _phone;
@synthesize province = _province;
@synthesize com = _com;
@synthesize userPhone = _userPhone;
@synthesize type = _type;
@synthesize ratio = _ratio;
@synthesize balance = _balance;
@synthesize address = _address;
@synthesize xpath = _xpath;
@synthesize username = _username;
@synthesize stores = _stores;
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
            self.listIdentifier = [self objectOrNilForKey:kJCModel_franchiserListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_franchiserListGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_franchiserListAreaId fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_franchiserListUid fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_franchiserListPhone fromDictionary:dict];
            self.province = [self objectOrNilForKey:kJCModel_franchiserListProvince fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_franchiserListCom fromDictionary:dict];
            self.userPhone = [self objectOrNilForKey:kJCModel_franchiserListUserPhone fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_franchiserListType fromDictionary:dict];
            self.ratio = [self objectOrNilForKey:kJCModel_franchiserListRatio fromDictionary:dict];
            self.balance = [[self objectOrNilForKey:kJCModel_franchiserListBalance fromDictionary:dict] doubleValue];
            self.address = [self objectOrNilForKey:kJCModel_franchiserListAddress fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_franchiserListXpath fromDictionary:dict];
            self.username = [self objectOrNilForKey:kJCModel_franchiserListUsername fromDictionary:dict];
    NSObject *receivedJCModel_franchiserStores = [dict objectForKey:kJCModel_franchiserListStores];
    NSMutableArray *parsedJCModel_franchiserStores = [NSMutableArray array];
    
    if ([receivedJCModel_franchiserStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_franchiserStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_franchiserStores addObject:[JCModel_franchiserStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_franchiserStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_franchiserStores addObject:[JCModel_franchiserStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_franchiserStores]];
    }

    self.stores = [NSArray arrayWithArray:parsedJCModel_franchiserStores];
            self.account = [self objectOrNilForKey:kJCModel_franchiserListAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_franchiserListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_franchiserListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_franchiserListGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_franchiserListAreaId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_franchiserListUid];
    [mutableDict setValue:self.phone forKey:kJCModel_franchiserListPhone];
    [mutableDict setValue:self.province forKey:kJCModel_franchiserListProvince];
    [mutableDict setValue:self.com forKey:kJCModel_franchiserListCom];
    [mutableDict setValue:self.userPhone forKey:kJCModel_franchiserListUserPhone];
    [mutableDict setValue:self.type forKey:kJCModel_franchiserListType];
    [mutableDict setValue:self.ratio forKey:kJCModel_franchiserListRatio];
    [mutableDict setValue:[NSNumber numberWithDouble:self.balance] forKey:kJCModel_franchiserListBalance];
    [mutableDict setValue:self.address forKey:kJCModel_franchiserListAddress];
    [mutableDict setValue:self.xpath forKey:kJCModel_franchiserListXpath];
    [mutableDict setValue:self.username forKey:kJCModel_franchiserListUsername];
    NSMutableArray *tempArrayForStores = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.stores) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStores addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStores addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStores] forKey:kJCModel_franchiserListStores];
    [mutableDict setValue:self.account forKey:kJCModel_franchiserListAccount];
    [mutableDict setValue:self.name forKey:kJCModel_franchiserListName];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_franchiserListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_franchiserListGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_franchiserListAreaId];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_franchiserListUid];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_franchiserListPhone];
    self.province = [aDecoder decodeObjectForKey:kJCModel_franchiserListProvince];
    self.com = [aDecoder decodeObjectForKey:kJCModel_franchiserListCom];
    self.userPhone = [aDecoder decodeObjectForKey:kJCModel_franchiserListUserPhone];
    self.type = [aDecoder decodeObjectForKey:kJCModel_franchiserListType];
    self.ratio = [aDecoder decodeObjectForKey:kJCModel_franchiserListRatio];
    self.balance = [aDecoder decodeDoubleForKey:kJCModel_franchiserListBalance];
    self.address = [aDecoder decodeObjectForKey:kJCModel_franchiserListAddress];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_franchiserListXpath];
    self.username = [aDecoder decodeObjectForKey:kJCModel_franchiserListUsername];
    self.stores = [aDecoder decodeObjectForKey:kJCModel_franchiserListStores];
    self.account = [aDecoder decodeObjectForKey:kJCModel_franchiserListAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_franchiserListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_franchiserListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_franchiserListGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_franchiserListAreaId];
    [aCoder encodeDouble:_uid forKey:kJCModel_franchiserListUid];
    [aCoder encodeObject:_phone forKey:kJCModel_franchiserListPhone];
    [aCoder encodeObject:_province forKey:kJCModel_franchiserListProvince];
    [aCoder encodeObject:_com forKey:kJCModel_franchiserListCom];
    [aCoder encodeObject:_userPhone forKey:kJCModel_franchiserListUserPhone];
    [aCoder encodeObject:_type forKey:kJCModel_franchiserListType];
    [aCoder encodeObject:_ratio forKey:kJCModel_franchiserListRatio];
    [aCoder encodeDouble:_balance forKey:kJCModel_franchiserListBalance];
    [aCoder encodeObject:_address forKey:kJCModel_franchiserListAddress];
    [aCoder encodeObject:_xpath forKey:kJCModel_franchiserListXpath];
    [aCoder encodeObject:_username forKey:kJCModel_franchiserListUsername];
    [aCoder encodeObject:_stores forKey:kJCModel_franchiserListStores];
    [aCoder encodeObject:_account forKey:kJCModel_franchiserListAccount];
    [aCoder encodeObject:_name forKey:kJCModel_franchiserListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserList *copy = [[JCModel_franchiserList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.guide = self.guide;
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.uid = self.uid;
        copy.phone = [self.phone copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.userPhone = [self.userPhone copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.ratio = [self.ratio copyWithZone:zone];
        copy.balance = self.balance;
        copy.address = [self.address copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.stores = [self.stores copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
