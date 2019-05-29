//
//  JCModel_WorkLogList.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogList.h"
#import "JCModel_WorkLogDailyLog.h"


NSString *const kJCModel_WorkLogListPhone = @"phone";
NSString *const kJCModel_WorkLogListContent = @"content";
NSString *const kJCModel_WorkLogListUid = @"uid";
NSString *const kJCModel_WorkLogListId = @"id";
NSString *const kJCModel_WorkLogListDay = @"day";
NSString *const kJCModel_WorkLogListOrgId = @"orgId";
NSString *const kJCModel_WorkLogListMbPhone = @"mbPhone";
NSString *const kJCModel_WorkLogListOrgName = @"orgName";
NSString *const kJCModel_WorkLogListXpath = @"xpath";
NSString *const kJCModel_WorkLogListName = @"name";
NSString *const kJCModel_WorkLogListDailyLog = @"dailyLog";


@interface JCModel_WorkLogList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogList

@synthesize phone = _phone;
@synthesize content = _content;
@synthesize uid = _uid;
@synthesize listIdentifier = _listIdentifier;
@synthesize day = _day;
@synthesize orgId = _orgId;
@synthesize mbPhone = _mbPhone;
@synthesize orgName = _orgName;
@synthesize xpath = _xpath;
@synthesize name = _name;
@synthesize dailyLog = _dailyLog;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.phone = [self objectOrNilForKey:kJCModel_WorkLogListPhone fromDictionary:dict];
            self.content = [self objectOrNilForKey:kJCModel_WorkLogListContent fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_WorkLogListUid fromDictionary:dict] doubleValue];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_WorkLogListId fromDictionary:dict];
            self.day = [self objectOrNilForKey:kJCModel_WorkLogListDay fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_WorkLogListOrgId fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_WorkLogListMbPhone fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_WorkLogListOrgName fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_WorkLogListXpath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_WorkLogListName fromDictionary:dict];
            self.dailyLog = [JCModel_WorkLogDailyLog modelObjectWithDictionary:[dict objectForKey:kJCModel_WorkLogListDailyLog]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_WorkLogListPhone];
    [mutableDict setValue:self.content forKey:kJCModel_WorkLogListContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_WorkLogListUid];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_WorkLogListId];
    [mutableDict setValue:self.day forKey:kJCModel_WorkLogListDay];
    [mutableDict setValue:self.orgId forKey:kJCModel_WorkLogListOrgId];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_WorkLogListMbPhone];
    [mutableDict setValue:self.orgName forKey:kJCModel_WorkLogListOrgName];
    [mutableDict setValue:self.xpath forKey:kJCModel_WorkLogListXpath];
    [mutableDict setValue:self.name forKey:kJCModel_WorkLogListName];
    [mutableDict setValue:[self.dailyLog dictionaryRepresentation] forKey:kJCModel_WorkLogListDailyLog];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_WorkLogListPhone];
    self.content = [aDecoder decodeObjectForKey:kJCModel_WorkLogListContent];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_WorkLogListUid];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_WorkLogListId];
    self.day = [aDecoder decodeObjectForKey:kJCModel_WorkLogListDay];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_WorkLogListOrgId];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_WorkLogListMbPhone];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_WorkLogListOrgName];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_WorkLogListXpath];
    self.name = [aDecoder decodeObjectForKey:kJCModel_WorkLogListName];
    self.dailyLog = [aDecoder decodeObjectForKey:kJCModel_WorkLogListDailyLog];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_WorkLogListPhone];
    [aCoder encodeObject:_content forKey:kJCModel_WorkLogListContent];
    [aCoder encodeDouble:_uid forKey:kJCModel_WorkLogListUid];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_WorkLogListId];
    [aCoder encodeObject:_day forKey:kJCModel_WorkLogListDay];
    [aCoder encodeObject:_orgId forKey:kJCModel_WorkLogListOrgId];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_WorkLogListMbPhone];
    [aCoder encodeObject:_orgName forKey:kJCModel_WorkLogListOrgName];
    [aCoder encodeObject:_xpath forKey:kJCModel_WorkLogListXpath];
    [aCoder encodeObject:_name forKey:kJCModel_WorkLogListName];
    [aCoder encodeObject:_dailyLog forKey:kJCModel_WorkLogListDailyLog];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogList *copy = [[JCModel_WorkLogList alloc] init];
    
    
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.uid = self.uid;
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.dailyLog = [self.dailyLog copyWithZone:zone];
    }
    
    return copy;
}


@end
