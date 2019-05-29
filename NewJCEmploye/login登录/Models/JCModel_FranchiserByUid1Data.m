//
//  JCModel_FranchiserByUid1Data.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FranchiserByUid1Data.h"
#import "JCModel_FranchiserByUid1Stores.h"


NSString *const kJCModel_FranchiserByUid1DataPhone = @"phone";
NSString *const kJCModel_FranchiserByUid1DataUid = @"uid";
NSString *const kJCModel_FranchiserByUid1DataStores = @"stores";
NSString *const kJCModel_FranchiserByUid1DataId = @"id";
NSString *const kJCModel_FranchiserByUid1DataUserPhone = @"userPhone";
NSString *const kJCModel_FranchiserByUid1DataUsername = @"username";
NSString *const kJCModel_FranchiserByUid1DataGuide = @"guide";
NSString *const kJCModel_FranchiserByUid1DataCom = @"com";
NSString *const kJCModel_FranchiserByUid1DataXpath = @"xpath";
NSString *const kJCModel_FranchiserByUid1DataName = @"name";
NSString *const kJCModel_FranchiserByUid1DataBalance = @"balance";


@interface JCModel_FranchiserByUid1Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FranchiserByUid1Data

@synthesize phone = _phone;
@synthesize uid = _uid;
@synthesize stores = _stores;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize userPhone = _userPhone;
@synthesize username = _username;
@synthesize guide = _guide;
@synthesize com = _com;
@synthesize xpath = _xpath;
@synthesize name = _name;
@synthesize balance = _balance;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.phone = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataPhone fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_FranchiserByUid1DataUid fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_FranchiserByUid1Stores = [dict objectForKey:kJCModel_FranchiserByUid1DataStores];
    NSMutableArray *parsedJCModel_FranchiserByUid1Stores = [NSMutableArray array];
    
    if ([receivedJCModel_FranchiserByUid1Stores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_FranchiserByUid1Stores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_FranchiserByUid1Stores addObject:[JCModel_FranchiserByUid1Stores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_FranchiserByUid1Stores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_FranchiserByUid1Stores addObject:[JCModel_FranchiserByUid1Stores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_FranchiserByUid1Stores]];
    }

    self.stores = [NSArray arrayWithArray:parsedJCModel_FranchiserByUid1Stores];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataId fromDictionary:dict];
            self.userPhone = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataUserPhone fromDictionary:dict];
            self.username = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataUsername fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_FranchiserByUid1DataGuide fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataCom fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataXpath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_FranchiserByUid1DataName fromDictionary:dict];
            self.balance = [[self objectOrNilForKey:kJCModel_FranchiserByUid1DataBalance fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_FranchiserByUid1DataPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_FranchiserByUid1DataUid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStores] forKey:kJCModel_FranchiserByUid1DataStores];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_FranchiserByUid1DataId];
    [mutableDict setValue:self.userPhone forKey:kJCModel_FranchiserByUid1DataUserPhone];
    [mutableDict setValue:self.username forKey:kJCModel_FranchiserByUid1DataUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_FranchiserByUid1DataGuide];
    [mutableDict setValue:self.com forKey:kJCModel_FranchiserByUid1DataCom];
    [mutableDict setValue:self.xpath forKey:kJCModel_FranchiserByUid1DataXpath];
    [mutableDict setValue:self.name forKey:kJCModel_FranchiserByUid1DataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.balance] forKey:kJCModel_FranchiserByUid1DataBalance];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataPhone];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_FranchiserByUid1DataUid];
    self.stores = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataStores];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataId];
    self.userPhone = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataUserPhone];
    self.username = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataUsername];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_FranchiserByUid1DataGuide];
    self.com = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataCom];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataXpath];
    self.name = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1DataName];
    self.balance = [aDecoder decodeDoubleForKey:kJCModel_FranchiserByUid1DataBalance];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_FranchiserByUid1DataPhone];
    [aCoder encodeDouble:_uid forKey:kJCModel_FranchiserByUid1DataUid];
    [aCoder encodeObject:_stores forKey:kJCModel_FranchiserByUid1DataStores];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_FranchiserByUid1DataId];
    [aCoder encodeObject:_userPhone forKey:kJCModel_FranchiserByUid1DataUserPhone];
    [aCoder encodeObject:_username forKey:kJCModel_FranchiserByUid1DataUsername];
    [aCoder encodeDouble:_guide forKey:kJCModel_FranchiserByUid1DataGuide];
    [aCoder encodeObject:_com forKey:kJCModel_FranchiserByUid1DataCom];
    [aCoder encodeObject:_xpath forKey:kJCModel_FranchiserByUid1DataXpath];
    [aCoder encodeObject:_name forKey:kJCModel_FranchiserByUid1DataName];
    [aCoder encodeDouble:_balance forKey:kJCModel_FranchiserByUid1DataBalance];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FranchiserByUid1Data *copy = [[JCModel_FranchiserByUid1Data alloc] init];
    
    
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.uid = self.uid;
        copy.stores = [self.stores copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.userPhone = [self.userPhone copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.guide = self.guide;
        copy.com = [self.com copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.balance = self.balance;
    }
    
    return copy;
}


@end
