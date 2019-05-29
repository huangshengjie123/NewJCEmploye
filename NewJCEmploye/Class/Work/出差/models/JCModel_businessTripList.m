//
//  JCModel_businessTripList.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripList.h"
#import "JCModel_businessTripLeaderInfo.h"
#import "JCModel_businessTripApprInfo.h"


NSString *const kJCModel_businessTripListId = @"id";
NSString *const kJCModel_businessTripListStart = @"start";
NSString *const kJCModel_businessTripListLeader = @"leader";
NSString *const kJCModel_businessTripListLeaderInfo = @"leaderInfo";
NSString *const kJCModel_businessTripListFrom = @"from";
NSString *const kJCModel_businessTripListTime = @"time";
NSString *const kJCModel_businessTripListCom = @"com";
NSString *const kJCModel_businessTripListType = @"type";
NSString *const kJCModel_businessTripListComment = @"comment";
NSString *const kJCModel_businessTripListChecker = @"checker";
NSString *const kJCModel_businessTripListApprInfo = @"apprInfo";
NSString *const kJCModel_businessTripListEnd = @"end";
NSString *const kJCModel_businessTripListAppr = @"appr";
NSString *const kJCModel_businessTripListOrg = @"org";
NSString *const kJCModel_businessTripListStatus = @"status";
NSString *const kJCModel_businessTripListTo = @"to";


@interface JCModel_businessTripList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripList

@synthesize listIdentifier = _listIdentifier;
@synthesize start = _start;
@synthesize leader = _leader;
@synthesize leaderInfo = _leaderInfo;
@synthesize from = _from;
@synthesize time = _time;
@synthesize com = _com;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize checker = _checker;
@synthesize apprInfo = _apprInfo;
@synthesize endProperty = _endProperty;
@synthesize appr = _appr;
@synthesize org = _org;
@synthesize status = _status;
@synthesize to = _to;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];

    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_businessTripListId fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_businessTripListStart fromDictionary:dict];
            self.leader = [[self objectOrNilForKey:kJCModel_businessTripListLeader fromDictionary:dict] doubleValue];
            self.leaderInfo = [JCModel_businessTripLeaderInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_businessTripListLeaderInfo]];
            self.from = [self objectOrNilForKey:kJCModel_businessTripListFrom fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_businessTripListTime fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_businessTripListCom fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_businessTripListType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_businessTripListComment fromDictionary:dict];
            self.checker = [self objectOrNilForKey:kJCModel_businessTripListChecker fromDictionary:dict];
            self.apprInfo = [JCModel_businessTripApprInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_businessTripListApprInfo]];
            self.endProperty = [self objectOrNilForKey:kJCModel_businessTripListEnd fromDictionary:dict];
            self.appr = [[self objectOrNilForKey:kJCModel_businessTripListAppr fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_businessTripListOrg fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_businessTripListStatus fromDictionary:dict];
            self.to = [self objectOrNilForKey:kJCModel_businessTripListTo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_businessTripListId];
    [mutableDict setValue:self.start forKey:kJCModel_businessTripListStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_businessTripListLeader];
    [mutableDict setValue:[self.leaderInfo dictionaryRepresentation] forKey:kJCModel_businessTripListLeaderInfo];
    [mutableDict setValue:self.from forKey:kJCModel_businessTripListFrom];
    [mutableDict setValue:self.time forKey:kJCModel_businessTripListTime];
    [mutableDict setValue:self.com forKey:kJCModel_businessTripListCom];
    [mutableDict setValue:self.type forKey:kJCModel_businessTripListType];
    [mutableDict setValue:self.comment forKey:kJCModel_businessTripListComment];
    [mutableDict setValue:self.checker forKey:kJCModel_businessTripListChecker];
    [mutableDict setValue:[self.apprInfo dictionaryRepresentation] forKey:kJCModel_businessTripListApprInfo];
    [mutableDict setValue:self.endProperty forKey:kJCModel_businessTripListEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appr] forKey:kJCModel_businessTripListAppr];
    [mutableDict setValue:self.org forKey:kJCModel_businessTripListOrg];
    [mutableDict setValue:self.status forKey:kJCModel_businessTripListStatus];
    [mutableDict setValue:self.to forKey:kJCModel_businessTripListTo];

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
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_businessTripListId];
    self.start = [aDecoder decodeObjectForKey:kJCModel_businessTripListStart];
    self.leader = [aDecoder decodeDoubleForKey:kJCModel_businessTripListLeader];
    self.leaderInfo = [aDecoder decodeObjectForKey:kJCModel_businessTripListLeaderInfo];
    self.from = [aDecoder decodeObjectForKey:kJCModel_businessTripListFrom];
    self.time = [aDecoder decodeObjectForKey:kJCModel_businessTripListTime];
    self.com = [aDecoder decodeObjectForKey:kJCModel_businessTripListCom];
    self.type = [aDecoder decodeObjectForKey:kJCModel_businessTripListType];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_businessTripListComment];
    self.checker = [aDecoder decodeObjectForKey:kJCModel_businessTripListChecker];
    self.apprInfo = [aDecoder decodeObjectForKey:kJCModel_businessTripListApprInfo];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_businessTripListEnd];
    self.appr = [aDecoder decodeDoubleForKey:kJCModel_businessTripListAppr];
    self.org = [aDecoder decodeObjectForKey:kJCModel_businessTripListOrg];
    self.status = [aDecoder decodeObjectForKey:kJCModel_businessTripListStatus];
    self.to = [aDecoder decodeObjectForKey:kJCModel_businessTripListTo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_businessTripListId];
    [aCoder encodeObject:_start forKey:kJCModel_businessTripListStart];
    [aCoder encodeDouble:_leader forKey:kJCModel_businessTripListLeader];
    [aCoder encodeObject:_leaderInfo forKey:kJCModel_businessTripListLeaderInfo];
    [aCoder encodeObject:_from forKey:kJCModel_businessTripListFrom];
    [aCoder encodeObject:_time forKey:kJCModel_businessTripListTime];
    [aCoder encodeObject:_com forKey:kJCModel_businessTripListCom];
    [aCoder encodeObject:_type forKey:kJCModel_businessTripListType];
    [aCoder encodeObject:_comment forKey:kJCModel_businessTripListComment];
    [aCoder encodeObject:_checker forKey:kJCModel_businessTripListChecker];
    [aCoder encodeObject:_apprInfo forKey:kJCModel_businessTripListApprInfo];
    [aCoder encodeObject:_endProperty forKey:kJCModel_businessTripListEnd];
    [aCoder encodeDouble:_appr forKey:kJCModel_businessTripListAppr];
    [aCoder encodeObject:_org forKey:kJCModel_businessTripListOrg];
    [aCoder encodeObject:_status forKey:kJCModel_businessTripListStatus];
    [aCoder encodeObject:_to forKey:kJCModel_businessTripListTo];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_businessTripList *copy = [[JCModel_businessTripList alloc] init];

    if (copy)
    {
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
        copy.leader = self.leader;
        copy.leaderInfo = [self.leaderInfo copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.checker = (id)[self.checker copyWithZone:zone];
        copy.apprInfo = [self.apprInfo copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.appr = self.appr;
        copy.org = [self.org copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.to = [self.to copyWithZone:zone];
    }
    return copy;
    
}


@end
