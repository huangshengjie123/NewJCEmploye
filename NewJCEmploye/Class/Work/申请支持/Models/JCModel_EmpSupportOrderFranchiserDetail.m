//
//  JCModel_EmpSupportOrderFranchiserDetail.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderFranchiserDetail.h"


NSString *const kJCModel_EmpSupportOrderFranchiserDetailId = @"id";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailGuide = @"guide";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailAreaId = @"areaId";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailUid = @"uid";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailPhone = @"phone";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailCom = @"com";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailRatio = @"ratio";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailBalance = @"balance";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailType = @"type";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailCash = @"cash";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailAddress = @"address";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailIsAction = @"isAction";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailStores = @"stores";
NSString *const kJCModel_EmpSupportOrderFranchiserDetailName = @"name";


@interface JCModel_EmpSupportOrderFranchiserDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderFranchiserDetail

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
            self.franchiserDetailIdentifier = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailId fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailGuide fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailAreaId fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailUid fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailPhone fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailCom fromDictionary:dict];
            self.ratio = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailRatio fromDictionary:dict];
            self.balance = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailBalance fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailType fromDictionary:dict];
            self.cash = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailCash fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailAddress fromDictionary:dict];
            self.isAction = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailIsAction fromDictionary:dict];
            self.stores = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailStores fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranchiserDetailName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserDetailIdentifier forKey:kJCModel_EmpSupportOrderFranchiserDetailId];
    [mutableDict setValue:self.guide forKey:kJCModel_EmpSupportOrderFranchiserDetailGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_EmpSupportOrderFranchiserDetailAreaId];
    [mutableDict setValue:self.uid forKey:kJCModel_EmpSupportOrderFranchiserDetailUid];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpSupportOrderFranchiserDetailPhone];
    [mutableDict setValue:self.com forKey:kJCModel_EmpSupportOrderFranchiserDetailCom];
    [mutableDict setValue:self.ratio forKey:kJCModel_EmpSupportOrderFranchiserDetailRatio];
    [mutableDict setValue:self.balance forKey:kJCModel_EmpSupportOrderFranchiserDetailBalance];
    [mutableDict setValue:self.type forKey:kJCModel_EmpSupportOrderFranchiserDetailType];
    [mutableDict setValue:self.cash forKey:kJCModel_EmpSupportOrderFranchiserDetailCash];
    [mutableDict setValue:self.address forKey:kJCModel_EmpSupportOrderFranchiserDetailAddress];
    [mutableDict setValue:self.isAction forKey:kJCModel_EmpSupportOrderFranchiserDetailIsAction];
    [mutableDict setValue:self.stores forKey:kJCModel_EmpSupportOrderFranchiserDetailStores];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderFranchiserDetailName];

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

    self.franchiserDetailIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailAreaId];
    self.uid = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailUid];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailPhone];
    self.com = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailCom];
    self.ratio = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailRatio];
    self.balance = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailBalance];
    self.type = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailType];
    self.cash = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailCash];
    self.address = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailAddress];
    self.isAction = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailIsAction];
    self.stores = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailStores];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranchiserDetailName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserDetailIdentifier forKey:kJCModel_EmpSupportOrderFranchiserDetailId];
    [aCoder encodeObject:_guide forKey:kJCModel_EmpSupportOrderFranchiserDetailGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_EmpSupportOrderFranchiserDetailAreaId];
    [aCoder encodeObject:_uid forKey:kJCModel_EmpSupportOrderFranchiserDetailUid];
    [aCoder encodeObject:_phone forKey:kJCModel_EmpSupportOrderFranchiserDetailPhone];
    [aCoder encodeObject:_com forKey:kJCModel_EmpSupportOrderFranchiserDetailCom];
    [aCoder encodeObject:_ratio forKey:kJCModel_EmpSupportOrderFranchiserDetailRatio];
    [aCoder encodeObject:_balance forKey:kJCModel_EmpSupportOrderFranchiserDetailBalance];
    [aCoder encodeObject:_type forKey:kJCModel_EmpSupportOrderFranchiserDetailType];
    [aCoder encodeObject:_cash forKey:kJCModel_EmpSupportOrderFranchiserDetailCash];
    [aCoder encodeObject:_address forKey:kJCModel_EmpSupportOrderFranchiserDetailAddress];
    [aCoder encodeObject:_isAction forKey:kJCModel_EmpSupportOrderFranchiserDetailIsAction];
    [aCoder encodeObject:_stores forKey:kJCModel_EmpSupportOrderFranchiserDetailStores];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderFranchiserDetailName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderFranchiserDetail *copy = [[JCModel_EmpSupportOrderFranchiserDetail alloc] init];
    
    
    
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
