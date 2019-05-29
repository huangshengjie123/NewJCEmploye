//
//  JCModel_FinfoData.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinfoData.h"
#import "JCModel_FinfoStores.h"


NSString *const kJCModel_FinfoDataId = @"id";
NSString *const kJCModel_FinfoDataGuide = @"guide";
NSString *const kJCModel_FinfoDataAreaId = @"areaId";
NSString *const kJCModel_FinfoDataUid = @"uid";
NSString *const kJCModel_FinfoDataPhone = @"phone";
NSString *const kJCModel_FinfoDataProvince = @"province";
NSString *const kJCModel_FinfoDataCom = @"com";
NSString *const kJCModel_FinfoDataUserPhone = @"userPhone";
NSString *const kJCModel_FinfoDataBalance = @"balance";
NSString *const kJCModel_FinfoDataXpath = @"xpath";
NSString *const kJCModel_FinfoDataAddress = @"address";
NSString *const kJCModel_FinfoDataUsername = @"username";
NSString *const kJCModel_FinfoDataStores = @"stores";
NSString *const kJCModel_FinfoDataName = @"name";


@interface JCModel_FinfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinfoData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize uid = _uid;
@synthesize phone = _phone;
@synthesize province = _province;
@synthesize com = _com;
@synthesize userPhone = _userPhone;
@synthesize balance = _balance;
@synthesize xpath = _xpath;
@synthesize address = _address;
@synthesize username = _username;
@synthesize stores = _stores;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_FinfoDataId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_FinfoDataGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_FinfoDataAreaId fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_FinfoDataUid fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_FinfoDataPhone fromDictionary:dict];
            self.province = [self objectOrNilForKey:kJCModel_FinfoDataProvince fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_FinfoDataCom fromDictionary:dict];
            self.userPhone = [self objectOrNilForKey:kJCModel_FinfoDataUserPhone fromDictionary:dict];
            self.balance = [[self objectOrNilForKey:kJCModel_FinfoDataBalance fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_FinfoDataXpath fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_FinfoDataAddress fromDictionary:dict];
            self.username = [self objectOrNilForKey:kJCModel_FinfoDataUsername fromDictionary:dict];
    NSObject *receivedJCModel_FinfoStores = [dict objectForKey:kJCModel_FinfoDataStores];
    NSMutableArray *parsedJCModel_FinfoStores = [NSMutableArray array];
    
    if ([receivedJCModel_FinfoStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_FinfoStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_FinfoStores addObject:[JCModel_FinfoStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_FinfoStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_FinfoStores addObject:[JCModel_FinfoStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_FinfoStores]];
    }

    self.stores = [NSArray arrayWithArray:parsedJCModel_FinfoStores];
            self.name = [self objectOrNilForKey:kJCModel_FinfoDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_FinfoDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_FinfoDataGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_FinfoDataAreaId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_FinfoDataUid];
    [mutableDict setValue:self.phone forKey:kJCModel_FinfoDataPhone];
    [mutableDict setValue:self.province forKey:kJCModel_FinfoDataProvince];
    [mutableDict setValue:self.com forKey:kJCModel_FinfoDataCom];
    [mutableDict setValue:self.userPhone forKey:kJCModel_FinfoDataUserPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.balance] forKey:kJCModel_FinfoDataBalance];
    [mutableDict setValue:self.xpath forKey:kJCModel_FinfoDataXpath];
    [mutableDict setValue:self.address forKey:kJCModel_FinfoDataAddress];
    [mutableDict setValue:self.username forKey:kJCModel_FinfoDataUsername];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStores] forKey:kJCModel_FinfoDataStores];
    [mutableDict setValue:self.name forKey:kJCModel_FinfoDataName];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_FinfoDataId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_FinfoDataGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_FinfoDataAreaId];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_FinfoDataUid];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_FinfoDataPhone];
    self.province = [aDecoder decodeObjectForKey:kJCModel_FinfoDataProvince];
    self.com = [aDecoder decodeObjectForKey:kJCModel_FinfoDataCom];
    self.userPhone = [aDecoder decodeObjectForKey:kJCModel_FinfoDataUserPhone];
    self.balance = [aDecoder decodeDoubleForKey:kJCModel_FinfoDataBalance];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_FinfoDataXpath];
    self.address = [aDecoder decodeObjectForKey:kJCModel_FinfoDataAddress];
    self.username = [aDecoder decodeObjectForKey:kJCModel_FinfoDataUsername];
    self.stores = [aDecoder decodeObjectForKey:kJCModel_FinfoDataStores];
    self.name = [aDecoder decodeObjectForKey:kJCModel_FinfoDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_FinfoDataId];
    [aCoder encodeDouble:_guide forKey:kJCModel_FinfoDataGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_FinfoDataAreaId];
    [aCoder encodeDouble:_uid forKey:kJCModel_FinfoDataUid];
    [aCoder encodeObject:_phone forKey:kJCModel_FinfoDataPhone];
    [aCoder encodeObject:_province forKey:kJCModel_FinfoDataProvince];
    [aCoder encodeObject:_com forKey:kJCModel_FinfoDataCom];
    [aCoder encodeObject:_userPhone forKey:kJCModel_FinfoDataUserPhone];
    [aCoder encodeDouble:_balance forKey:kJCModel_FinfoDataBalance];
    [aCoder encodeObject:_xpath forKey:kJCModel_FinfoDataXpath];
    [aCoder encodeObject:_address forKey:kJCModel_FinfoDataAddress];
    [aCoder encodeObject:_username forKey:kJCModel_FinfoDataUsername];
    [aCoder encodeObject:_stores forKey:kJCModel_FinfoDataStores];
    [aCoder encodeObject:_name forKey:kJCModel_FinfoDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinfoData *copy = [[JCModel_FinfoData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.guide = self.guide;
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.uid = self.uid;
        copy.phone = [self.phone copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.userPhone = [self.userPhone copyWithZone:zone];
        copy.balance = self.balance;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.stores = [self.stores copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
