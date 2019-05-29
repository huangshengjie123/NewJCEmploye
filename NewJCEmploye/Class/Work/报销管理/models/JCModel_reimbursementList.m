//
//  JCModel_reimbursementList.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementList.h"
#import "JCModel_reimbursementMgrInfo.h"
#import "JCModel_reimbursementLeaderInfo.h"
#import "JCModel_reimbursementApprInfo.h"
#import "JCModel_reimbursementReimbursementItems.h"


NSString *const kJCModel_reimbursementListId = @"id";
NSString *const kJCModel_reimbursementListMgrInfo = @"mgrInfo";
NSString *const kJCModel_reimbursementListLeader = @"leader";
NSString *const kJCModel_reimbursementListAmount = @"amount";
NSString *const kJCModel_reimbursementListAccountantInfo = @"accountantInfo";
NSString *const kJCModel_reimbursementListAccountant = @"accountant";
NSString *const kJCModel_reimbursementListTime = @"time";
NSString *const kJCModel_reimbursementListMgr = @"mgr";
NSString *const kJCModel_reimbursementListCom = @"com";
NSString *const kJCModel_reimbursementListFaOrdrerId = @"faOrdrerId";
NSString *const kJCModel_reimbursementListType = @"type";
NSString *const kJCModel_reimbursementListComment = @"comment";
NSString *const kJCModel_reimbursementListLeaderInfo = @"leaderInfo";
NSString *const kJCModel_reimbursementListApprInfo = @"apprInfo";
NSString *const kJCModel_reimbursementListAppr = @"appr";
NSString *const kJCModel_reimbursementListReimbursementItems = @"reimbursementItems";
NSString *const kJCModel_reimbursementListStatus = @"status";


@interface JCModel_reimbursementList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementList

@synthesize listIdentifier = _listIdentifier;
@synthesize mgrInfo = _mgrInfo;
@synthesize leader = _leader;
@synthesize amount = _amount;
@synthesize accountantInfo = _accountantInfo;
@synthesize accountant = _accountant;
@synthesize time = _time;
@synthesize mgr = _mgr;
@synthesize com = _com;
@synthesize faOrdrerId = _faOrdrerId;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize leaderInfo = _leaderInfo;
@synthesize apprInfo = _apprInfo;
@synthesize appr = _appr;
@synthesize reimbursementItems = _reimbursementItems;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_reimbursementListId fromDictionary:dict];
            self.mgrInfo = [JCModel_reimbursementMgrInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_reimbursementListMgrInfo]];
            self.leader = [[self objectOrNilForKey:kJCModel_reimbursementListLeader fromDictionary:dict] doubleValue];
            self.amount = [[self objectOrNilForKey:kJCModel_reimbursementListAmount fromDictionary:dict] doubleValue];
            self.accountantInfo = [self objectOrNilForKey:kJCModel_reimbursementListAccountantInfo fromDictionary:dict];
            self.accountant = [self objectOrNilForKey:kJCModel_reimbursementListAccountant fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_reimbursementListTime fromDictionary:dict];
            self.mgr = [[self objectOrNilForKey:kJCModel_reimbursementListMgr fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_reimbursementListCom fromDictionary:dict];
            self.faOrdrerId = [self objectOrNilForKey:kJCModel_reimbursementListFaOrdrerId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_reimbursementListType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_reimbursementListComment fromDictionary:dict];
            self.leaderInfo = [JCModel_reimbursementLeaderInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_reimbursementListLeaderInfo]];
            self.apprInfo = [JCModel_reimbursementApprInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_reimbursementListApprInfo]];
            self.appr = [[self objectOrNilForKey:kJCModel_reimbursementListAppr fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_reimbursementReimbursementItems = [dict objectForKey:kJCModel_reimbursementListReimbursementItems];
    NSMutableArray *parsedJCModel_reimbursementReimbursementItems = [NSMutableArray array];
    
    if ([receivedJCModel_reimbursementReimbursementItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_reimbursementReimbursementItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_reimbursementReimbursementItems addObject:[JCModel_reimbursementReimbursementItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_reimbursementReimbursementItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_reimbursementReimbursementItems addObject:[JCModel_reimbursementReimbursementItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_reimbursementReimbursementItems]];
    }

    self.reimbursementItems = [NSArray arrayWithArray:parsedJCModel_reimbursementReimbursementItems];
            self.status = [self objectOrNilForKey:kJCModel_reimbursementListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_reimbursementListId];
    [mutableDict setValue:[self.mgrInfo dictionaryRepresentation] forKey:kJCModel_reimbursementListMgrInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_reimbursementListLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_reimbursementListAmount];
    [mutableDict setValue:self.accountantInfo forKey:kJCModel_reimbursementListAccountantInfo];
    [mutableDict setValue:self.accountant forKey:kJCModel_reimbursementListAccountant];
    [mutableDict setValue:self.time forKey:kJCModel_reimbursementListTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mgr] forKey:kJCModel_reimbursementListMgr];
    [mutableDict setValue:self.com forKey:kJCModel_reimbursementListCom];
    [mutableDict setValue:self.faOrdrerId forKey:kJCModel_reimbursementListFaOrdrerId];
    [mutableDict setValue:self.type forKey:kJCModel_reimbursementListType];
    [mutableDict setValue:self.comment forKey:kJCModel_reimbursementListComment];
    [mutableDict setValue:[self.leaderInfo dictionaryRepresentation] forKey:kJCModel_reimbursementListLeaderInfo];
    [mutableDict setValue:[self.apprInfo dictionaryRepresentation] forKey:kJCModel_reimbursementListApprInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appr] forKey:kJCModel_reimbursementListAppr];
    NSMutableArray *tempArrayForReimbursementItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.reimbursementItems) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReimbursementItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReimbursementItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReimbursementItems] forKey:kJCModel_reimbursementListReimbursementItems];
    [mutableDict setValue:self.status forKey:kJCModel_reimbursementListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_reimbursementListId];
    self.mgrInfo = [aDecoder decodeObjectForKey:kJCModel_reimbursementListMgrInfo];
    self.leader = [aDecoder decodeDoubleForKey:kJCModel_reimbursementListLeader];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_reimbursementListAmount];
    self.accountantInfo = [aDecoder decodeObjectForKey:kJCModel_reimbursementListAccountantInfo];
    self.accountant = [aDecoder decodeObjectForKey:kJCModel_reimbursementListAccountant];
    self.time = [aDecoder decodeObjectForKey:kJCModel_reimbursementListTime];
    self.mgr = [aDecoder decodeDoubleForKey:kJCModel_reimbursementListMgr];
    self.com = [aDecoder decodeObjectForKey:kJCModel_reimbursementListCom];
    self.faOrdrerId = [aDecoder decodeObjectForKey:kJCModel_reimbursementListFaOrdrerId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_reimbursementListType];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_reimbursementListComment];
    self.leaderInfo = [aDecoder decodeObjectForKey:kJCModel_reimbursementListLeaderInfo];
    self.apprInfo = [aDecoder decodeObjectForKey:kJCModel_reimbursementListApprInfo];
    self.appr = [aDecoder decodeDoubleForKey:kJCModel_reimbursementListAppr];
    self.reimbursementItems = [aDecoder decodeObjectForKey:kJCModel_reimbursementListReimbursementItems];
    self.status = [aDecoder decodeObjectForKey:kJCModel_reimbursementListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_reimbursementListId];
    [aCoder encodeObject:_mgrInfo forKey:kJCModel_reimbursementListMgrInfo];
    [aCoder encodeDouble:_leader forKey:kJCModel_reimbursementListLeader];
    [aCoder encodeDouble:_amount forKey:kJCModel_reimbursementListAmount];
    [aCoder encodeObject:_accountantInfo forKey:kJCModel_reimbursementListAccountantInfo];
    [aCoder encodeObject:_accountant forKey:kJCModel_reimbursementListAccountant];
    [aCoder encodeObject:_time forKey:kJCModel_reimbursementListTime];
    [aCoder encodeDouble:_mgr forKey:kJCModel_reimbursementListMgr];
    [aCoder encodeObject:_com forKey:kJCModel_reimbursementListCom];
    [aCoder encodeObject:_faOrdrerId forKey:kJCModel_reimbursementListFaOrdrerId];
    [aCoder encodeObject:_type forKey:kJCModel_reimbursementListType];
    [aCoder encodeObject:_comment forKey:kJCModel_reimbursementListComment];
    [aCoder encodeObject:_leaderInfo forKey:kJCModel_reimbursementListLeaderInfo];
    [aCoder encodeObject:_apprInfo forKey:kJCModel_reimbursementListApprInfo];
    [aCoder encodeDouble:_appr forKey:kJCModel_reimbursementListAppr];
    [aCoder encodeObject:_reimbursementItems forKey:kJCModel_reimbursementListReimbursementItems];
    [aCoder encodeObject:_status forKey:kJCModel_reimbursementListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementList *copy = [[JCModel_reimbursementList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.mgrInfo = [self.mgrInfo copyWithZone:zone];
        copy.leader = self.leader;
        copy.amount = self.amount;
        copy.accountantInfo = [self.accountantInfo copyWithZone:zone];
        copy.accountant = [self.accountant copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.mgr = self.mgr;
        copy.com = [self.com copyWithZone:zone];
        copy.faOrdrerId = [self.faOrdrerId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.leaderInfo = [self.leaderInfo copyWithZone:zone];
        copy.apprInfo = [self.apprInfo copyWithZone:zone];
        copy.appr = self.appr;
        copy.reimbursementItems = [self.reimbursementItems copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
