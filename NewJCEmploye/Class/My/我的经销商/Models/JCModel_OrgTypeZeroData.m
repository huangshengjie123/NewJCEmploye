//
//  JCModel_OrgTypeZeroData.m
//
//  Created by   on 2018/9/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OrgTypeZeroData.h"


NSString *const kJCModel_OrgTypeZeroDataLeader = @"leader";
NSString *const kJCModel_OrgTypeZeroDataParentId = @"parentId";
NSString *const kJCModel_OrgTypeZeroDataAreaId = @"areaId";
NSString *const kJCModel_OrgTypeZeroDataDescription = @"description";
NSString *const kJCModel_OrgTypeZeroDataOrgId = @"orgId";
NSString *const kJCModel_OrgTypeZeroDataOrgName = @"orgName";
NSString *const kJCModel_OrgTypeZeroDataType = @"type";
NSString *const kJCModel_OrgTypeZeroDataXpath = @"xpath";
NSString *const kJCModel_OrgTypeZeroDataDistPhone = @"distPhone";
NSString *const kJCModel_OrgTypeZeroDataOrgLevel = @"orgLevel";


@interface JCModel_OrgTypeZeroData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OrgTypeZeroData

@synthesize leader = _leader;
@synthesize parentId = _parentId;
@synthesize areaId = _areaId;
@synthesize dataDescription = _dataDescription;
@synthesize orgId = _orgId;
@synthesize orgName = _orgName;
@synthesize type = _type;
@synthesize xpath = _xpath;
@synthesize distPhone = _distPhone;
@synthesize orgLevel = _orgLevel;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.leader = [[self objectOrNilForKey:kJCModel_OrgTypeZeroDataLeader fromDictionary:dict] doubleValue];
            self.parentId = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataParentId fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataAreaId fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataDescription fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataOrgId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataOrgName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_OrgTypeZeroDataType fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataXpath fromDictionary:dict];
            self.distPhone = [self objectOrNilForKey:kJCModel_OrgTypeZeroDataDistPhone fromDictionary:dict];
            self.orgLevel = [[self objectOrNilForKey:kJCModel_OrgTypeZeroDataOrgLevel fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_OrgTypeZeroDataLeader];
    [mutableDict setValue:self.parentId forKey:kJCModel_OrgTypeZeroDataParentId];
    [mutableDict setValue:self.areaId forKey:kJCModel_OrgTypeZeroDataAreaId];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_OrgTypeZeroDataDescription];
    [mutableDict setValue:self.orgId forKey:kJCModel_OrgTypeZeroDataOrgId];
    [mutableDict setValue:self.orgName forKey:kJCModel_OrgTypeZeroDataOrgName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_OrgTypeZeroDataType];
    [mutableDict setValue:self.xpath forKey:kJCModel_OrgTypeZeroDataXpath];
    [mutableDict setValue:self.distPhone forKey:kJCModel_OrgTypeZeroDataDistPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_OrgTypeZeroDataOrgLevel];

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

    self.leader = [aDecoder decodeDoubleForKey:kJCModel_OrgTypeZeroDataLeader];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataParentId];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataAreaId];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataDescription];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataOrgId];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataOrgName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_OrgTypeZeroDataType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataXpath];
    self.distPhone = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroDataDistPhone];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_OrgTypeZeroDataOrgLevel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leader forKey:kJCModel_OrgTypeZeroDataLeader];
    [aCoder encodeObject:_parentId forKey:kJCModel_OrgTypeZeroDataParentId];
    [aCoder encodeObject:_areaId forKey:kJCModel_OrgTypeZeroDataAreaId];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_OrgTypeZeroDataDescription];
    [aCoder encodeObject:_orgId forKey:kJCModel_OrgTypeZeroDataOrgId];
    [aCoder encodeObject:_orgName forKey:kJCModel_OrgTypeZeroDataOrgName];
    [aCoder encodeDouble:_type forKey:kJCModel_OrgTypeZeroDataType];
    [aCoder encodeObject:_xpath forKey:kJCModel_OrgTypeZeroDataXpath];
    [aCoder encodeObject:_distPhone forKey:kJCModel_OrgTypeZeroDataDistPhone];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_OrgTypeZeroDataOrgLevel];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OrgTypeZeroData *copy = [[JCModel_OrgTypeZeroData alloc] init];
    
    
    
    if (copy) {

        copy.leader = self.leader;
        copy.parentId = [self.parentId copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.type = self.type;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.distPhone = [self.distPhone copyWithZone:zone];
        copy.orgLevel = self.orgLevel;
    }
    
    return copy;
}


@end
