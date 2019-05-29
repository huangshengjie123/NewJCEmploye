//
//  JCModel_ReadWaterCard1Data.m
//
//  Created by   on 2018/10/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWaterCard1Data.h"


NSString *const kJCModel_ReadWaterCard1DataLeader = @"leader";
NSString *const kJCModel_ReadWaterCard1DataParentId = @"parentId";
NSString *const kJCModel_ReadWaterCard1DataAreaId = @"areaId";
NSString *const kJCModel_ReadWaterCard1DataDescription = @"description";
NSString *const kJCModel_ReadWaterCard1DataOrgId = @"orgId";
NSString *const kJCModel_ReadWaterCard1DataOrgName = @"orgName";
NSString *const kJCModel_ReadWaterCard1DataType = @"type";
NSString *const kJCModel_ReadWaterCard1DataXpath = @"xpath";
NSString *const kJCModel_ReadWaterCard1DataDistPhone = @"distPhone";
NSString *const kJCModel_ReadWaterCard1DataOrgLevel = @"orgLevel";


@interface JCModel_ReadWaterCard1Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWaterCard1Data

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
            self.leader = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataLeader fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataParentId fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataAreaId fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataDescription fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataOrgId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataOrgName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_ReadWaterCard1DataType fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataXpath fromDictionary:dict];
            self.distPhone = [self objectOrNilForKey:kJCModel_ReadWaterCard1DataDistPhone fromDictionary:dict];
            self.orgLevel = [[self objectOrNilForKey:kJCModel_ReadWaterCard1DataOrgLevel fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.leader forKey:kJCModel_ReadWaterCard1DataLeader];
    [mutableDict setValue:self.parentId forKey:kJCModel_ReadWaterCard1DataParentId];
    [mutableDict setValue:self.areaId forKey:kJCModel_ReadWaterCard1DataAreaId];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_ReadWaterCard1DataDescription];
    [mutableDict setValue:self.orgId forKey:kJCModel_ReadWaterCard1DataOrgId];
    [mutableDict setValue:self.orgName forKey:kJCModel_ReadWaterCard1DataOrgName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_ReadWaterCard1DataType];
    [mutableDict setValue:self.xpath forKey:kJCModel_ReadWaterCard1DataXpath];
    [mutableDict setValue:self.distPhone forKey:kJCModel_ReadWaterCard1DataDistPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_ReadWaterCard1DataOrgLevel];

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

    self.leader = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataLeader];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataParentId];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataAreaId];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataDescription];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataOrgId];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataOrgName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_ReadWaterCard1DataType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataXpath];
    self.distPhone = [aDecoder decodeObjectForKey:kJCModel_ReadWaterCard1DataDistPhone];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_ReadWaterCard1DataOrgLevel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_leader forKey:kJCModel_ReadWaterCard1DataLeader];
    [aCoder encodeObject:_parentId forKey:kJCModel_ReadWaterCard1DataParentId];
    [aCoder encodeObject:_areaId forKey:kJCModel_ReadWaterCard1DataAreaId];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_ReadWaterCard1DataDescription];
    [aCoder encodeObject:_orgId forKey:kJCModel_ReadWaterCard1DataOrgId];
    [aCoder encodeObject:_orgName forKey:kJCModel_ReadWaterCard1DataOrgName];
    [aCoder encodeDouble:_type forKey:kJCModel_ReadWaterCard1DataType];
    [aCoder encodeObject:_xpath forKey:kJCModel_ReadWaterCard1DataXpath];
    [aCoder encodeObject:_distPhone forKey:kJCModel_ReadWaterCard1DataDistPhone];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_ReadWaterCard1DataOrgLevel];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWaterCard1Data *copy = [[JCModel_ReadWaterCard1Data alloc] init];
    
    
    
    if (copy) {

        copy.leader = [self.leader copyWithZone:zone];
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
