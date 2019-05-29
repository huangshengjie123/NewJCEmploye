//
//  JCModel_baseOrgData.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_baseOrgData.h"
#import "JCModel_baseOrgState.h"
#import "JCModel_baseOrgNodes.h"


NSString *const kJCModel_baseOrgDataDescription = @"description";
NSString *const kJCModel_baseOrgDataState = @"state";
NSString *const kJCModel_baseOrgDataAreaId = @"areaId";
NSString *const kJCModel_baseOrgDataLeader = @"leader";
NSString *const kJCModel_baseOrgDataNodes = @"nodes";
NSString *const kJCModel_baseOrgDataTags = @"tags";
NSString *const kJCModel_baseOrgDataType = @"type";
NSString *const kJCModel_baseOrgDataXpath = @"xpath";
NSString *const kJCModel_baseOrgDataIcon = @"icon";
NSString *const kJCModel_baseOrgDataOrgId = @"orgId";
NSString *const kJCModel_baseOrgDataText = @"text";
NSString *const kJCModel_baseOrgDataOrgLevel = @"orgLevel";
NSString *const kJCModel_baseOrgDataOrgName = @"orgName";
NSString *const kJCModel_baseOrgDataDistPhone = @"distPhone";
NSString *const kJCModel_baseOrgDataParentId = @"parentId";


@interface JCModel_baseOrgData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_baseOrgData

@synthesize dataDescription = _dataDescription;
@synthesize state = _state;
@synthesize areaId = _areaId;
@synthesize leader = _leader;
@synthesize nodes = _nodes;
@synthesize tags = _tags;
@synthesize type = _type;
@synthesize xpath = _xpath;
@synthesize icon = _icon;
@synthesize orgId = _orgId;
@synthesize text = _text;
@synthesize orgLevel = _orgLevel;
@synthesize orgName = _orgName;
@synthesize distPhone = _distPhone;
@synthesize parentId = _parentId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataDescription = [self objectOrNilForKey:kJCModel_baseOrgDataDescription fromDictionary:dict];
            self.state = [JCModel_baseOrgState modelObjectWithDictionary:[dict objectForKey:kJCModel_baseOrgDataState]];
            self.areaId = [self objectOrNilForKey:kJCModel_baseOrgDataAreaId fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_baseOrgDataLeader fromDictionary:dict];
    NSObject *receivedJCModel_baseOrgNodes = [dict objectForKey:kJCModel_baseOrgDataNodes];
    NSMutableArray *parsedJCModel_baseOrgNodes = [NSMutableArray array];
    
    if ([receivedJCModel_baseOrgNodes isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_baseOrgNodes) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_baseOrgNodes addObject:[JCModel_baseOrgNodes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_baseOrgNodes isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_baseOrgNodes addObject:[JCModel_baseOrgNodes modelObjectWithDictionary:(NSDictionary *)receivedJCModel_baseOrgNodes]];
    }

    self.nodes = [NSArray arrayWithArray:parsedJCModel_baseOrgNodes];
            self.tags = [self objectOrNilForKey:kJCModel_baseOrgDataTags fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_baseOrgDataType fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_baseOrgDataXpath fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kJCModel_baseOrgDataIcon fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_baseOrgDataOrgId fromDictionary:dict];
            self.text = [self objectOrNilForKey:kJCModel_baseOrgDataText fromDictionary:dict];
            self.orgLevel = [[self objectOrNilForKey:kJCModel_baseOrgDataOrgLevel fromDictionary:dict] doubleValue];
            self.orgName = [self objectOrNilForKey:kJCModel_baseOrgDataOrgName fromDictionary:dict];
            self.distPhone = [self objectOrNilForKey:kJCModel_baseOrgDataDistPhone fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kJCModel_baseOrgDataParentId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_baseOrgDataDescription];
    [mutableDict setValue:[self.state dictionaryRepresentation] forKey:kJCModel_baseOrgDataState];
    [mutableDict setValue:self.areaId forKey:kJCModel_baseOrgDataAreaId];
    [mutableDict setValue:self.leader forKey:kJCModel_baseOrgDataLeader];
    NSMutableArray *tempArrayForNodes = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.nodes) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNodes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNodes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNodes] forKey:kJCModel_baseOrgDataNodes];
    [mutableDict setValue:self.tags forKey:kJCModel_baseOrgDataTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_baseOrgDataType];
    [mutableDict setValue:self.xpath forKey:kJCModel_baseOrgDataXpath];
    [mutableDict setValue:self.icon forKey:kJCModel_baseOrgDataIcon];
    [mutableDict setValue:self.orgId forKey:kJCModel_baseOrgDataOrgId];
    [mutableDict setValue:self.text forKey:kJCModel_baseOrgDataText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_baseOrgDataOrgLevel];
    [mutableDict setValue:self.orgName forKey:kJCModel_baseOrgDataOrgName];
    [mutableDict setValue:self.distPhone forKey:kJCModel_baseOrgDataDistPhone];
    [mutableDict setValue:self.parentId forKey:kJCModel_baseOrgDataParentId];

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

    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataDescription];
    self.state = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataState];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataAreaId];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataLeader];
    self.nodes = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataNodes];
    self.tags = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataTags];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_baseOrgDataType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataXpath];
    self.icon = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataIcon];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataOrgId];
    self.text = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataText];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_baseOrgDataOrgLevel];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataOrgName];
    self.distPhone = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataDistPhone];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_baseOrgDataParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataDescription forKey:kJCModel_baseOrgDataDescription];
    [aCoder encodeObject:_state forKey:kJCModel_baseOrgDataState];
    [aCoder encodeObject:_areaId forKey:kJCModel_baseOrgDataAreaId];
    [aCoder encodeObject:_leader forKey:kJCModel_baseOrgDataLeader];
    [aCoder encodeObject:_nodes forKey:kJCModel_baseOrgDataNodes];
    [aCoder encodeObject:_tags forKey:kJCModel_baseOrgDataTags];
    [aCoder encodeDouble:_type forKey:kJCModel_baseOrgDataType];
    [aCoder encodeObject:_xpath forKey:kJCModel_baseOrgDataXpath];
    [aCoder encodeObject:_icon forKey:kJCModel_baseOrgDataIcon];
    [aCoder encodeObject:_orgId forKey:kJCModel_baseOrgDataOrgId];
    [aCoder encodeObject:_text forKey:kJCModel_baseOrgDataText];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_baseOrgDataOrgLevel];
    [aCoder encodeObject:_orgName forKey:kJCModel_baseOrgDataOrgName];
    [aCoder encodeObject:_distPhone forKey:kJCModel_baseOrgDataDistPhone];
    [aCoder encodeObject:_parentId forKey:kJCModel_baseOrgDataParentId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_baseOrgData *copy = [[JCModel_baseOrgData alloc] init];
    
    
    
    if (copy) {

        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.leader = [self.leader copyWithZone:zone];
        copy.nodes = [self.nodes copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.type = self.type;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.orgLevel = self.orgLevel;
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.distPhone = [self.distPhone copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
    }
    
    return copy;
}


@end
