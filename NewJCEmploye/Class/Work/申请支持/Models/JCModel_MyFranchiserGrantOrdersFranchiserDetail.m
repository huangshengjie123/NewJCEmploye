//
//  JCModel_MyFranchiserGrantOrdersFranchiserDetail.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersFranchiserDetail.h"


NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailGuide = @"guide";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailAreaId = @"areaId";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailUid = @"uid";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailPhone = @"phone";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailCom = @"com";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailRatio = @"ratio";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailBalance = @"balance";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailType = @"type";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailCash = @"cash";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailAddress = @"address";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailIsAction = @"isAction";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailStores = @"stores";
NSString *const kJCModel_MyFranchiserGrantOrdersFranchiserDetailName = @"name";


@interface JCModel_MyFranchiserGrantOrdersFranchiserDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersFranchiserDetail

@synthesize franchiserDetailIdentifier = _franchiserDetailIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize uid = _uid;
@synthesize phone = _phone;
@synthesize com = _com;
@synthesize ratio = _ratio;
@synthesize balance = _balance;
@synthesize type = _type;
@synthesize cash = _cash;
@synthesize address = _address;
@synthesize isAction = _isAction;
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
            self.franchiserDetailIdentifier = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailId fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailGuide fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAreaId fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailUid fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailPhone fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCom fromDictionary:dict];
            self.ratio = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailRatio fromDictionary:dict];
            self.balance = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailBalance fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailType fromDictionary:dict];
            self.cash = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCash fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAddress fromDictionary:dict];
            self.isAction = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailIsAction fromDictionary:dict];
            self.stores = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailStores fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserDetailIdentifier forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailId];
    [mutableDict setValue:self.guide forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAreaId];
    [mutableDict setValue:self.uid forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailUid];
    [mutableDict setValue:self.phone forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailPhone];
    [mutableDict setValue:self.com forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCom];
    [mutableDict setValue:self.ratio forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailRatio];
    [mutableDict setValue:self.balance forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailBalance];
    [mutableDict setValue:self.type forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailType];
    [mutableDict setValue:self.cash forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCash];
    [mutableDict setValue:self.address forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAddress];
    [mutableDict setValue:self.isAction forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailIsAction];
    [mutableDict setValue:self.stores forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailStores];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailName];

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

    self.franchiserDetailIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAreaId];
    self.uid = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailUid];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailPhone];
    self.com = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCom];
    self.ratio = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailRatio];
    self.balance = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailBalance];
    self.type = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailType];
    self.cash = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCash];
    self.address = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAddress];
    self.isAction = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailIsAction];
    self.stores = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailStores];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserDetailIdentifier forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailId];
    [aCoder encodeObject:_guide forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAreaId];
    [aCoder encodeObject:_uid forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailUid];
    [aCoder encodeObject:_phone forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailPhone];
    [aCoder encodeObject:_com forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCom];
    [aCoder encodeObject:_ratio forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailRatio];
    [aCoder encodeObject:_balance forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailBalance];
    [aCoder encodeObject:_type forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailType];
    [aCoder encodeObject:_cash forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailCash];
    [aCoder encodeObject:_address forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailAddress];
    [aCoder encodeObject:_isAction forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailIsAction];
    [aCoder encodeObject:_stores forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailStores];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersFranchiserDetailName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersFranchiserDetail *copy = [[JCModel_MyFranchiserGrantOrdersFranchiserDetail alloc] init];
    
    
    
    if (copy) {

        copy.franchiserDetailIdentifier = [self.franchiserDetailIdentifier copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.ratio = [self.ratio copyWithZone:zone];
        copy.balance = [self.balance copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.cash = [self.cash copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.isAction = [self.isAction copyWithZone:zone];
        copy.stores = [self.stores copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
