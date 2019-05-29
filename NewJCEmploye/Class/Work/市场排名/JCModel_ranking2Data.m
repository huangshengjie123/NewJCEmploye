//
//  JCModel_ranking2Data.m
//
//  Created by   on 2019/3/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ranking2Data.h"


NSString *const kJCModel_ranking2DataId = @"id";
NSString *const kJCModel_ranking2DataResale = @"resale";
NSString *const kJCModel_ranking2DataCoo = @"coo";
NSString *const kJCModel_ranking2DataGroupAmount = @"groupAmount";
NSString *const kJCModel_ranking2DataComName = @"comName";
NSString *const kJCModel_ranking2DataCom = @"com";
NSString *const kJCModel_ranking2DataFranSale = @"franSale";
NSString *const kJCModel_ranking2DataMadeWater = @"madeWater";
NSString *const kJCModel_ranking2DataUserName = @"userName";
NSString *const kJCModel_ranking2DataFranNonlocalSale = @"franNonlocalSale";
NSString *const kJCModel_ranking2DataComCoo = @"comCoo";
NSString *const kJCModel_ranking2DataReferral = @"referral";
NSString *const kJCModel_ranking2DataXpath = @"xpath";
NSString *const kJCModel_ranking2DataReNonlocalSale = @"reNonlocalSale";
NSString *const kJCModel_ranking2DataUserAmount = @"userAmount";
NSString *const kJCModel_ranking2DataFranStock = @"franStock";
NSString *const kJCModel_ranking2DataGroupId = @"groupId";
NSString *const kJCModel_ranking2DataGroupName = @"groupName";
NSString *const kJCModel_ranking2DataComAmount = @"comAmount";


@interface JCModel_ranking2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ranking2Data

@synthesize dataIdentifier = _dataIdentifier;
@synthesize resale = _resale;
@synthesize coo = _coo;
@synthesize groupAmount = _groupAmount;
@synthesize comName = _comName;
@synthesize com = _com;
@synthesize franSale = _franSale;
@synthesize madeWater = _madeWater;
@synthesize userName = _userName;
@synthesize franNonlocalSale = _franNonlocalSale;
@synthesize comCoo = _comCoo;
@synthesize referral = _referral;
@synthesize xpath = _xpath;
@synthesize reNonlocalSale = _reNonlocalSale;
@synthesize userAmount = _userAmount;
@synthesize franStock = _franStock;
@synthesize groupId = _groupId;
@synthesize groupName = _groupName;
@synthesize comAmount = _comAmount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];

    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.dataIdentifier = [[self objectOrNilForKey:kJCModel_ranking2DataId fromDictionary:dict] doubleValue];
        self.resale = [[self objectOrNilForKey:kJCModel_ranking2DataResale fromDictionary:dict] doubleValue];
        self.coo = [[self objectOrNilForKey:kJCModel_ranking2DataCoo fromDictionary:dict] doubleValue];
        self.groupAmount = [self objectOrNilForKey:kJCModel_ranking2DataGroupAmount fromDictionary:dict];
        self.comName = [self objectOrNilForKey:kJCModel_ranking2DataComName fromDictionary:dict];
        self.com = [self objectOrNilForKey:kJCModel_ranking2DataCom fromDictionary:dict];
        self.franSale = [[self objectOrNilForKey:kJCModel_ranking2DataFranSale fromDictionary:dict] doubleValue];
        self.madeWater = [[self objectOrNilForKey:kJCModel_ranking2DataMadeWater fromDictionary:dict] doubleValue];
        self.userName = [self objectOrNilForKey:kJCModel_ranking2DataUserName fromDictionary:dict];
        self.franNonlocalSale = [[self objectOrNilForKey:kJCModel_ranking2DataFranNonlocalSale fromDictionary:dict] doubleValue];
        self.comCoo = [self objectOrNilForKey:kJCModel_ranking2DataComCoo fromDictionary:dict];
        self.referral = [[self objectOrNilForKey:kJCModel_ranking2DataReferral fromDictionary:dict] doubleValue];
        self.xpath = [self objectOrNilForKey:kJCModel_ranking2DataXpath fromDictionary:dict];
        self.reNonlocalSale = [[self objectOrNilForKey:kJCModel_ranking2DataReNonlocalSale fromDictionary:dict] doubleValue];
        self.userAmount = [[self objectOrNilForKey:kJCModel_ranking2DataUserAmount fromDictionary:dict] doubleValue];
        self.franStock = [[self objectOrNilForKey:kJCModel_ranking2DataFranStock fromDictionary:dict] doubleValue];
        self.groupId = [self objectOrNilForKey:kJCModel_ranking2DataGroupId fromDictionary:dict];
        self.groupName = [self objectOrNilForKey:kJCModel_ranking2DataGroupName fromDictionary:dict];
        self.comAmount = [self objectOrNilForKey:kJCModel_ranking2DataComAmount fromDictionary:dict];
    
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_ranking2DataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resale] forKey:kJCModel_ranking2DataResale];
    [mutableDict setValue:[NSNumber numberWithDouble:self.coo] forKey:kJCModel_ranking2DataCoo];
    [mutableDict setValue:self.groupAmount forKey:kJCModel_ranking2DataGroupAmount];
    [mutableDict setValue:self.comName forKey:kJCModel_ranking2DataComName];
    [mutableDict setValue:self.com forKey:kJCModel_ranking2DataCom];
    [mutableDict setValue:[NSNumber numberWithDouble:self.franSale] forKey:kJCModel_ranking2DataFranSale];
    [mutableDict setValue:[NSNumber numberWithDouble:self.madeWater] forKey:kJCModel_ranking2DataMadeWater];
    [mutableDict setValue:self.userName forKey:kJCModel_ranking2DataUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.franNonlocalSale] forKey:kJCModel_ranking2DataFranNonlocalSale];
    [mutableDict setValue:self.comCoo forKey:kJCModel_ranking2DataComCoo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.referral] forKey:kJCModel_ranking2DataReferral];
    [mutableDict setValue:self.xpath forKey:kJCModel_ranking2DataXpath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reNonlocalSale] forKey:kJCModel_ranking2DataReNonlocalSale];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userAmount] forKey:kJCModel_ranking2DataUserAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.franStock] forKey:kJCModel_ranking2DataFranStock];
    [mutableDict setValue:self.groupId forKey:kJCModel_ranking2DataGroupId];
    [mutableDict setValue:self.groupName forKey:kJCModel_ranking2DataGroupName];
    [mutableDict setValue:self.comAmount forKey:kJCModel_ranking2DataComAmount];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataId];
    self.resale = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataResale];
    self.coo = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataCoo];
    self.groupAmount = [aDecoder decodeObjectForKey:kJCModel_ranking2DataGroupAmount];
    self.comName = [aDecoder decodeObjectForKey:kJCModel_ranking2DataComName];
    self.com = [aDecoder decodeObjectForKey:kJCModel_ranking2DataCom];
    self.franSale = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataFranSale];
    self.madeWater = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataMadeWater];
    self.userName = [aDecoder decodeObjectForKey:kJCModel_ranking2DataUserName];
    self.franNonlocalSale = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataFranNonlocalSale];
    self.comCoo = [aDecoder decodeObjectForKey:kJCModel_ranking2DataComCoo];
    self.referral = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataReferral];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ranking2DataXpath];
    self.reNonlocalSale = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataReNonlocalSale];
    self.userAmount = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataUserAmount];
    self.franStock = [aDecoder decodeDoubleForKey:kJCModel_ranking2DataFranStock];
    self.groupId = [aDecoder decodeObjectForKey:kJCModel_ranking2DataGroupId];
    self.groupName = [aDecoder decodeObjectForKey:kJCModel_ranking2DataGroupName];
    self.comAmount = [aDecoder decodeObjectForKey:kJCModel_ranking2DataComAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_ranking2DataId];
    [aCoder encodeDouble:_resale forKey:kJCModel_ranking2DataResale];
    [aCoder encodeDouble:_coo forKey:kJCModel_ranking2DataCoo];
    [aCoder encodeObject:_groupAmount forKey:kJCModel_ranking2DataGroupAmount];
    [aCoder encodeObject:_comName forKey:kJCModel_ranking2DataComName];
    [aCoder encodeObject:_com forKey:kJCModel_ranking2DataCom];
    [aCoder encodeDouble:_franSale forKey:kJCModel_ranking2DataFranSale];
    [aCoder encodeDouble:_madeWater forKey:kJCModel_ranking2DataMadeWater];
    [aCoder encodeObject:_userName forKey:kJCModel_ranking2DataUserName];
    [aCoder encodeDouble:_franNonlocalSale forKey:kJCModel_ranking2DataFranNonlocalSale];
    [aCoder encodeObject:_comCoo forKey:kJCModel_ranking2DataComCoo];
    [aCoder encodeDouble:_referral forKey:kJCModel_ranking2DataReferral];
    [aCoder encodeObject:_xpath forKey:kJCModel_ranking2DataXpath];
    [aCoder encodeDouble:_reNonlocalSale forKey:kJCModel_ranking2DataReNonlocalSale];
    [aCoder encodeDouble:_userAmount forKey:kJCModel_ranking2DataUserAmount];
    [aCoder encodeDouble:_franStock forKey:kJCModel_ranking2DataFranStock];
    [aCoder encodeObject:_groupId forKey:kJCModel_ranking2DataGroupId];
    [aCoder encodeObject:_groupName forKey:kJCModel_ranking2DataGroupName];
    [aCoder encodeObject:_comAmount forKey:kJCModel_ranking2DataComAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_ranking2Data *copy = [[JCModel_ranking2Data alloc] init];
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.resale = self.resale;
        copy.coo = self.coo;
        copy.groupAmount = (id)[self.groupAmount copyWithZone:zone];
        copy.comName = (id)[self.comName copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.franSale = self.franSale;
        copy.madeWater = self.madeWater;
        copy.userName = [self.userName copyWithZone:zone];
        copy.franNonlocalSale = self.franNonlocalSale;
        copy.comCoo = (id)[self.comCoo copyWithZone:zone];
        copy.referral = self.referral;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.reNonlocalSale = self.reNonlocalSale;
        copy.userAmount = self.userAmount;
        copy.franStock = self.franStock;
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.groupName = (id)[self.groupName copyWithZone:zone];
        copy.comAmount = (id)[self.comAmount copyWithZone:zone];
    }
    
    return copy;
}


@end
