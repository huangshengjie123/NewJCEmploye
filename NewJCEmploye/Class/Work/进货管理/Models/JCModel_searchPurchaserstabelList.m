//
//  JCModel_searchPurchaserstabelList.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelList.h"
#import "JCModel_searchPurchaserstabelPurchaserDetail.h"
#import "JCModel_searchPurchaserstabelPurchaserOrderCosts.h"


NSString *const kJCModel_searchPurchaserstabelListId = @"id";
NSString *const kJCModel_searchPurchaserstabelListComments = @"comments";
NSString *const kJCModel_searchPurchaserstabelListPurchaserDetail = @"purchaserDetail";
NSString *const kJCModel_searchPurchaserstabelListOpr = @"opr";
NSString *const kJCModel_searchPurchaserstabelListLeader = @"leader";
NSString *const kJCModel_searchPurchaserstabelListFinancer = @"financer";
NSString *const kJCModel_searchPurchaserstabelListInStoreHouse = @"inStoreHouse";
NSString *const kJCModel_searchPurchaserstabelListType = @"type";
NSString *const kJCModel_searchPurchaserstabelListInStoreHouseId = @"inStoreHouseId";
NSString *const kJCModel_searchPurchaserstabelListDistributer = @"distributer";
NSString *const kJCModel_searchPurchaserstabelListCreateTime = @"createTime";
NSString *const kJCModel_searchPurchaserstabelListEndTime = @"endTime";
NSString *const kJCModel_searchPurchaserstabelListApplicant = @"applicant";
NSString *const kJCModel_searchPurchaserstabelListStoreHouse = @"storeHouse";
NSString *const kJCModel_searchPurchaserstabelListStoreHouseId = @"storeHouseId";
NSString *const kJCModel_searchPurchaserstabelListPurchaserOrderCosts = @"purchaserOrderCosts";
NSString *const kJCModel_searchPurchaserstabelListDistributerSimp = @"distributerSimp";
NSString *const kJCModel_searchPurchaserstabelListStatus = @"status";
NSString *const kJCModel_searchPurchaserstabelListPurchaser = @"purchaser";


@interface JCModel_searchPurchaserstabelList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize purchaserDetail = _purchaserDetail;
@synthesize opr = _opr;
@synthesize leader = _leader;
@synthesize financer = _financer;
@synthesize inStoreHouse = _inStoreHouse;
@synthesize type = _type;
@synthesize inStoreHouseId = _inStoreHouseId;
@synthesize distributer = _distributer;
@synthesize createTime = _createTime;
@synthesize endTime = _endTime;
@synthesize applicant = _applicant;
@synthesize storeHouse = _storeHouse;
@synthesize storeHouseId = _storeHouseId;
@synthesize purchaserOrderCosts = _purchaserOrderCosts;
@synthesize distributerSimp = _distributerSimp;
@synthesize status = _status;
@synthesize purchaser = _purchaser;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListComments fromDictionary:dict];
            self.purchaserDetail = [JCModel_searchPurchaserstabelPurchaserDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_searchPurchaserstabelListPurchaserDetail]];
            self.opr = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelListOpr fromDictionary:dict] doubleValue];
            self.leader = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelListLeader fromDictionary:dict] doubleValue];
            self.financer = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListFinancer fromDictionary:dict];
            self.inStoreHouse = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListInStoreHouse fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListType fromDictionary:dict];
            self.inStoreHouseId = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListInStoreHouseId fromDictionary:dict];
            self.distributer = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListDistributer fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListCreateTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListEndTime fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelListApplicant fromDictionary:dict] doubleValue];
            self.storeHouse = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListStoreHouse fromDictionary:dict];
            self.storeHouseId = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListStoreHouseId fromDictionary:dict];
    NSObject *receivedJCModel_searchPurchaserstabelPurchaserOrderCosts = [dict objectForKey:kJCModel_searchPurchaserstabelListPurchaserOrderCosts];
    NSMutableArray *parsedJCModel_searchPurchaserstabelPurchaserOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_searchPurchaserstabelPurchaserOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_searchPurchaserstabelPurchaserOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_searchPurchaserstabelPurchaserOrderCosts addObject:[JCModel_searchPurchaserstabelPurchaserOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_searchPurchaserstabelPurchaserOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_searchPurchaserstabelPurchaserOrderCosts addObject:[JCModel_searchPurchaserstabelPurchaserOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_searchPurchaserstabelPurchaserOrderCosts]];
    }

    self.purchaserOrderCosts = [NSArray arrayWithArray:parsedJCModel_searchPurchaserstabelPurchaserOrderCosts];
            self.distributerSimp = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListDistributerSimp fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListStatus fromDictionary:dict];
            self.purchaser = [self objectOrNilForKey:kJCModel_searchPurchaserstabelListPurchaser fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_searchPurchaserstabelListId];
    [mutableDict setValue:self.comments forKey:kJCModel_searchPurchaserstabelListComments];
    [mutableDict setValue:[self.purchaserDetail dictionaryRepresentation] forKey:kJCModel_searchPurchaserstabelListPurchaserDetail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opr] forKey:kJCModel_searchPurchaserstabelListOpr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_searchPurchaserstabelListLeader];
    [mutableDict setValue:self.financer forKey:kJCModel_searchPurchaserstabelListFinancer];
    [mutableDict setValue:self.inStoreHouse forKey:kJCModel_searchPurchaserstabelListInStoreHouse];
    [mutableDict setValue:self.type forKey:kJCModel_searchPurchaserstabelListType];
    [mutableDict setValue:self.inStoreHouseId forKey:kJCModel_searchPurchaserstabelListInStoreHouseId];
    [mutableDict setValue:self.distributer forKey:kJCModel_searchPurchaserstabelListDistributer];
    [mutableDict setValue:self.createTime forKey:kJCModel_searchPurchaserstabelListCreateTime];
    [mutableDict setValue:self.endTime forKey:kJCModel_searchPurchaserstabelListEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_searchPurchaserstabelListApplicant];
    [mutableDict setValue:self.storeHouse forKey:kJCModel_searchPurchaserstabelListStoreHouse];
    [mutableDict setValue:self.storeHouseId forKey:kJCModel_searchPurchaserstabelListStoreHouseId];
    NSMutableArray *tempArrayForPurchaserOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.purchaserOrderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPurchaserOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPurchaserOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserOrderCosts] forKey:kJCModel_searchPurchaserstabelListPurchaserOrderCosts];
    [mutableDict setValue:self.distributerSimp forKey:kJCModel_searchPurchaserstabelListDistributerSimp];
    [mutableDict setValue:self.status forKey:kJCModel_searchPurchaserstabelListStatus];
    [mutableDict setValue:self.purchaser forKey:kJCModel_searchPurchaserstabelListPurchaser];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListComments];
    self.purchaserDetail = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListPurchaserDetail];
    self.opr = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelListOpr];
    self.leader = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelListLeader];
    self.financer = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListFinancer];
    self.inStoreHouse = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListInStoreHouse];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListType];
    self.inStoreHouseId = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListInStoreHouseId];
    self.distributer = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListDistributer];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListCreateTime];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListEndTime];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelListApplicant];
    self.storeHouse = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListStoreHouse];
    self.storeHouseId = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListStoreHouseId];
    self.purchaserOrderCosts = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListPurchaserOrderCosts];
    self.distributerSimp = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListDistributerSimp];
    self.status = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListStatus];
    self.purchaser = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelListPurchaser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_searchPurchaserstabelListId];
    [aCoder encodeObject:_comments forKey:kJCModel_searchPurchaserstabelListComments];
    [aCoder encodeObject:_purchaserDetail forKey:kJCModel_searchPurchaserstabelListPurchaserDetail];
    [aCoder encodeDouble:_opr forKey:kJCModel_searchPurchaserstabelListOpr];
    [aCoder encodeDouble:_leader forKey:kJCModel_searchPurchaserstabelListLeader];
    [aCoder encodeObject:_financer forKey:kJCModel_searchPurchaserstabelListFinancer];
    [aCoder encodeObject:_inStoreHouse forKey:kJCModel_searchPurchaserstabelListInStoreHouse];
    [aCoder encodeObject:_type forKey:kJCModel_searchPurchaserstabelListType];
    [aCoder encodeObject:_inStoreHouseId forKey:kJCModel_searchPurchaserstabelListInStoreHouseId];
    [aCoder encodeObject:_distributer forKey:kJCModel_searchPurchaserstabelListDistributer];
    [aCoder encodeObject:_createTime forKey:kJCModel_searchPurchaserstabelListCreateTime];
    [aCoder encodeObject:_endTime forKey:kJCModel_searchPurchaserstabelListEndTime];
    [aCoder encodeDouble:_applicant forKey:kJCModel_searchPurchaserstabelListApplicant];
    [aCoder encodeObject:_storeHouse forKey:kJCModel_searchPurchaserstabelListStoreHouse];
    [aCoder encodeObject:_storeHouseId forKey:kJCModel_searchPurchaserstabelListStoreHouseId];
    [aCoder encodeObject:_purchaserOrderCosts forKey:kJCModel_searchPurchaserstabelListPurchaserOrderCosts];
    [aCoder encodeObject:_distributerSimp forKey:kJCModel_searchPurchaserstabelListDistributerSimp];
    [aCoder encodeObject:_status forKey:kJCModel_searchPurchaserstabelListStatus];
    [aCoder encodeObject:_purchaser forKey:kJCModel_searchPurchaserstabelListPurchaser];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelList *copy = [[JCModel_searchPurchaserstabelList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.purchaserDetail = [self.purchaserDetail copyWithZone:zone];
        copy.opr = self.opr;
        copy.leader = self.leader;
        copy.financer = [self.financer copyWithZone:zone];
        copy.inStoreHouse = [self.inStoreHouse copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.inStoreHouseId = [self.inStoreHouseId copyWithZone:zone];
        copy.distributer = [self.distributer copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.applicant = self.applicant;
        copy.storeHouse = [self.storeHouse copyWithZone:zone];
        copy.storeHouseId = [self.storeHouseId copyWithZone:zone];
        copy.purchaserOrderCosts = [self.purchaserOrderCosts copyWithZone:zone];
        copy.distributerSimp = [self.distributerSimp copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.purchaser = [self.purchaser copyWithZone:zone];
    }
    
    return copy;
}


@end
