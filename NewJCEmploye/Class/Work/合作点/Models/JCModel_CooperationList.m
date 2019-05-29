//
//  JCModel_CooperationList.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationList.h"


NSString *const kJCModel_CooperationListId = @"id";
NSString *const kJCModel_CooperationListGuide = @"guide";
NSString *const kJCModel_CooperationListAreaId = @"areaId";
NSString *const kJCModel_CooperationListPointPhone = @"pointPhone";
NSString *const kJCModel_CooperationListGuideName = @"guideName";
NSString *const kJCModel_CooperationListPointAddr = @"pointAddr";
NSString *const kJCModel_CooperationListCom = @"com";
NSString *const kJCModel_CooperationListLawPhone = @"lawPhone";
NSString *const kJCModel_CooperationListTag = @"tag";
NSString *const kJCModel_CooperationListXpath = @"xpath";
NSString *const kJCModel_CooperationListRemark = @"remark";
NSString *const kJCModel_CooperationListCreateTime = @"createTime";
NSString *const kJCModel_CooperationListLaw = @"law";
NSString *const kJCModel_CooperationListIsCooperation = @"isCooperation";
NSString *const kJCModel_CooperationListGuidePhone = @"guidePhone";
NSString *const kJCModel_CooperationListOrgName = @"orgName";
NSString *const kJCModel_CooperationListPointName = @"pointName";


@interface JCModel_CooperationList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize areaId = _areaId;
@synthesize pointPhone = _pointPhone;
@synthesize guideName = _guideName;
@synthesize pointAddr = _pointAddr;
@synthesize com = _com;
@synthesize lawPhone = _lawPhone;
@synthesize tag = _tag;
@synthesize xpath = _xpath;
@synthesize remark = _remark;
@synthesize createTime = _createTime;
@synthesize law = _law;
@synthesize isCooperation = _isCooperation;
@synthesize guidePhone = _guidePhone;
@synthesize orgName = _orgName;
@synthesize pointName = _pointName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_CooperationListId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_CooperationListGuide fromDictionary:dict] doubleValue];
            self.areaId = [self objectOrNilForKey:kJCModel_CooperationListAreaId fromDictionary:dict];
            self.pointPhone = [self objectOrNilForKey:kJCModel_CooperationListPointPhone fromDictionary:dict];
            self.guideName = [self objectOrNilForKey:kJCModel_CooperationListGuideName fromDictionary:dict];
            self.pointAddr = [self objectOrNilForKey:kJCModel_CooperationListPointAddr fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_CooperationListCom fromDictionary:dict];
            self.lawPhone = [self objectOrNilForKey:kJCModel_CooperationListLawPhone fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_CooperationListTag fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_CooperationListXpath fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kJCModel_CooperationListRemark fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_CooperationListCreateTime fromDictionary:dict];
            self.law = [self objectOrNilForKey:kJCModel_CooperationListLaw fromDictionary:dict];
            self.isCooperation = [[self objectOrNilForKey:kJCModel_CooperationListIsCooperation fromDictionary:dict] doubleValue];
            self.guidePhone = [self objectOrNilForKey:kJCModel_CooperationListGuidePhone fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_CooperationListOrgName fromDictionary:dict];
            self.pointName = [self objectOrNilForKey:kJCModel_CooperationListPointName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_CooperationListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_CooperationListGuide];
    [mutableDict setValue:self.areaId forKey:kJCModel_CooperationListAreaId];
    [mutableDict setValue:self.pointPhone forKey:kJCModel_CooperationListPointPhone];
    [mutableDict setValue:self.guideName forKey:kJCModel_CooperationListGuideName];
    [mutableDict setValue:self.pointAddr forKey:kJCModel_CooperationListPointAddr];
    [mutableDict setValue:self.com forKey:kJCModel_CooperationListCom];
    [mutableDict setValue:self.lawPhone forKey:kJCModel_CooperationListLawPhone];
    [mutableDict setValue:self.tag forKey:kJCModel_CooperationListTag];
    [mutableDict setValue:self.xpath forKey:kJCModel_CooperationListXpath];
    [mutableDict setValue:self.remark forKey:kJCModel_CooperationListRemark];
    [mutableDict setValue:self.createTime forKey:kJCModel_CooperationListCreateTime];
    [mutableDict setValue:self.law forKey:kJCModel_CooperationListLaw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isCooperation] forKey:kJCModel_CooperationListIsCooperation];
    [mutableDict setValue:self.guidePhone forKey:kJCModel_CooperationListGuidePhone];
    [mutableDict setValue:self.orgName forKey:kJCModel_CooperationListOrgName];
    [mutableDict setValue:self.pointName forKey:kJCModel_CooperationListPointName];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CooperationListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_CooperationListGuide];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_CooperationListAreaId];
    self.pointPhone = [aDecoder decodeObjectForKey:kJCModel_CooperationListPointPhone];
    self.guideName = [aDecoder decodeObjectForKey:kJCModel_CooperationListGuideName];
    self.pointAddr = [aDecoder decodeObjectForKey:kJCModel_CooperationListPointAddr];
    self.com = [aDecoder decodeObjectForKey:kJCModel_CooperationListCom];
    self.lawPhone = [aDecoder decodeObjectForKey:kJCModel_CooperationListLawPhone];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_CooperationListTag];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_CooperationListXpath];
    self.remark = [aDecoder decodeObjectForKey:kJCModel_CooperationListRemark];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_CooperationListCreateTime];
    self.law = [aDecoder decodeObjectForKey:kJCModel_CooperationListLaw];
    self.isCooperation = [aDecoder decodeDoubleForKey:kJCModel_CooperationListIsCooperation];
    self.guidePhone = [aDecoder decodeObjectForKey:kJCModel_CooperationListGuidePhone];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_CooperationListOrgName];
    self.pointName = [aDecoder decodeObjectForKey:kJCModel_CooperationListPointName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_CooperationListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_CooperationListGuide];
    [aCoder encodeObject:_areaId forKey:kJCModel_CooperationListAreaId];
    [aCoder encodeObject:_pointPhone forKey:kJCModel_CooperationListPointPhone];
    [aCoder encodeObject:_guideName forKey:kJCModel_CooperationListGuideName];
    [aCoder encodeObject:_pointAddr forKey:kJCModel_CooperationListPointAddr];
    [aCoder encodeObject:_com forKey:kJCModel_CooperationListCom];
    [aCoder encodeObject:_lawPhone forKey:kJCModel_CooperationListLawPhone];
    [aCoder encodeObject:_tag forKey:kJCModel_CooperationListTag];
    [aCoder encodeObject:_xpath forKey:kJCModel_CooperationListXpath];
    [aCoder encodeObject:_remark forKey:kJCModel_CooperationListRemark];
    [aCoder encodeObject:_createTime forKey:kJCModel_CooperationListCreateTime];
    [aCoder encodeObject:_law forKey:kJCModel_CooperationListLaw];
    [aCoder encodeDouble:_isCooperation forKey:kJCModel_CooperationListIsCooperation];
    [aCoder encodeObject:_guidePhone forKey:kJCModel_CooperationListGuidePhone];
    [aCoder encodeObject:_orgName forKey:kJCModel_CooperationListOrgName];
    [aCoder encodeObject:_pointName forKey:kJCModel_CooperationListPointName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationList *copy = [[JCModel_CooperationList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.guide = self.guide;
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.pointPhone = [self.pointPhone copyWithZone:zone];
        copy.guideName = [self.guideName copyWithZone:zone];
        copy.pointAddr = [self.pointAddr copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.lawPhone = [self.lawPhone copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.law = [self.law copyWithZone:zone];
        copy.isCooperation = self.isCooperation;
        copy.guidePhone = [self.guidePhone copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.pointName = [self.pointName copyWithZone:zone];
    }
    
    return copy;
}


@end
