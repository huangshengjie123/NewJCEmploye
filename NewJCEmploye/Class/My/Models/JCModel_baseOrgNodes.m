//
//  JCModel_baseOrgNodes.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_baseOrgNodes.h"
#import "JCModel_baseOrgState.h"


NSString *const kJCModel_baseOrgNodesDescription = @"description";
NSString *const kJCModel_baseOrgNodesState = @"state";
NSString *const kJCModel_baseOrgNodesAreaId = @"areaId";
NSString *const kJCModel_baseOrgNodesLeader = @"leader";
NSString *const kJCModel_baseOrgNodesNodes = @"nodes";
NSString *const kJCModel_baseOrgNodesTags = @"tags";
NSString *const kJCModel_baseOrgNodesType = @"type";
NSString *const kJCModel_baseOrgNodesXpath = @"xpath";
NSString *const kJCModel_baseOrgNodesIcon = @"icon";
NSString *const kJCModel_baseOrgNodesOrgId = @"orgId";
NSString *const kJCModel_baseOrgNodesText = @"text";
NSString *const kJCModel_baseOrgNodesOrgLevel = @"orgLevel";
NSString *const kJCModel_baseOrgNodesOrgName = @"orgName";
NSString *const kJCModel_baseOrgNodesDistPhone = @"distPhone";
NSString *const kJCModel_baseOrgNodesParentId = @"parentId";


@interface JCModel_baseOrgNodes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_baseOrgNodes

@synthesize nodesDescription = _nodesDescription;
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
            self.nodesDescription = [self objectOrNilForKey:kJCModel_baseOrgNodesDescription fromDictionary:dict];
            self.state = [JCModel_baseOrgState modelObjectWithDictionary:[dict objectForKey:kJCModel_baseOrgNodesState]];
            self.areaId = [self objectOrNilForKey:kJCModel_baseOrgNodesAreaId fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_baseOrgNodesLeader fromDictionary:dict];
            self.nodes = [self objectOrNilForKey:kJCModel_baseOrgNodesNodes fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kJCModel_baseOrgNodesTags fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_baseOrgNodesType fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_baseOrgNodesXpath fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kJCModel_baseOrgNodesIcon fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_baseOrgNodesOrgId fromDictionary:dict];
            self.text = [self objectOrNilForKey:kJCModel_baseOrgNodesText fromDictionary:dict];
            self.orgLevel = [[self objectOrNilForKey:kJCModel_baseOrgNodesOrgLevel fromDictionary:dict] doubleValue];
            self.orgName = [self objectOrNilForKey:kJCModel_baseOrgNodesOrgName fromDictionary:dict];
            self.distPhone = [self objectOrNilForKey:kJCModel_baseOrgNodesDistPhone fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kJCModel_baseOrgNodesParentId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nodesDescription forKey:kJCModel_baseOrgNodesDescription];
    [mutableDict setValue:[self.state dictionaryRepresentation] forKey:kJCModel_baseOrgNodesState];
    [mutableDict setValue:self.areaId forKey:kJCModel_baseOrgNodesAreaId];
    [mutableDict setValue:self.leader forKey:kJCModel_baseOrgNodesLeader];
    [mutableDict setValue:self.nodes forKey:kJCModel_baseOrgNodesNodes];
    [mutableDict setValue:self.tags forKey:kJCModel_baseOrgNodesTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_baseOrgNodesType];
    [mutableDict setValue:self.xpath forKey:kJCModel_baseOrgNodesXpath];
    [mutableDict setValue:self.icon forKey:kJCModel_baseOrgNodesIcon];
    [mutableDict setValue:self.orgId forKey:kJCModel_baseOrgNodesOrgId];
    [mutableDict setValue:self.text forKey:kJCModel_baseOrgNodesText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_baseOrgNodesOrgLevel];
    [mutableDict setValue:self.orgName forKey:kJCModel_baseOrgNodesOrgName];
    [mutableDict setValue:self.distPhone forKey:kJCModel_baseOrgNodesDistPhone];
    [mutableDict setValue:self.parentId forKey:kJCModel_baseOrgNodesParentId];

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

    self.nodesDescription = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesDescription];
    self.state = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesState];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesAreaId];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesLeader];
    self.nodes = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesNodes];
    self.tags = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesTags];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_baseOrgNodesType];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesXpath];
    self.icon = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesIcon];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesOrgId];
    self.text = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesText];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_baseOrgNodesOrgLevel];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesOrgName];
    self.distPhone = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesDistPhone];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_baseOrgNodesParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nodesDescription forKey:kJCModel_baseOrgNodesDescription];
    [aCoder encodeObject:_state forKey:kJCModel_baseOrgNodesState];
    [aCoder encodeObject:_areaId forKey:kJCModel_baseOrgNodesAreaId];
    [aCoder encodeObject:_leader forKey:kJCModel_baseOrgNodesLeader];
    [aCoder encodeObject:_nodes forKey:kJCModel_baseOrgNodesNodes];
    [aCoder encodeObject:_tags forKey:kJCModel_baseOrgNodesTags];
    [aCoder encodeDouble:_type forKey:kJCModel_baseOrgNodesType];
    [aCoder encodeObject:_xpath forKey:kJCModel_baseOrgNodesXpath];
    [aCoder encodeObject:_icon forKey:kJCModel_baseOrgNodesIcon];
    [aCoder encodeObject:_orgId forKey:kJCModel_baseOrgNodesOrgId];
    [aCoder encodeObject:_text forKey:kJCModel_baseOrgNodesText];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_baseOrgNodesOrgLevel];
    [aCoder encodeObject:_orgName forKey:kJCModel_baseOrgNodesOrgName];
    [aCoder encodeObject:_distPhone forKey:kJCModel_baseOrgNodesDistPhone];
    [aCoder encodeObject:_parentId forKey:kJCModel_baseOrgNodesParentId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_baseOrgNodes *copy = [[JCModel_baseOrgNodes alloc] init];
    
    
    
    if (copy) {

        copy.nodesDescription = [self.nodesDescription copyWithZone:zone];
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
