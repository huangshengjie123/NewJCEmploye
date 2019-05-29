//
//  JCModel_DepartmentNodes.m
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentNodes.h"
#import "JCModel_DepartmentState.h"


NSString *const kJCModel_DepartmentNodesState = @"state";
NSString *const kJCModel_DepartmentNodesDescription = @"description";
NSString *const kJCModel_DepartmentNodesAreaId = @"areaId";
NSString *const kJCModel_DepartmentNodesNodes = @"nodes";
NSString *const kJCModel_DepartmentNodesTags = @"tags";
NSString *const kJCModel_DepartmentNodesType = @"type";
NSString *const kJCModel_DepartmentNodesIcon = @"icon";
NSString *const kJCModel_DepartmentNodesOrgId = @"orgId";
NSString *const kJCModel_DepartmentNodesText = @"text";
NSString *const kJCModel_DepartmentNodesOrgLevel = @"orgLevel";
NSString *const kJCModel_DepartmentNodesOrgName = @"orgName";
NSString *const kJCModel_DepartmentNodesParentId = @"parentId";


@interface JCModel_DepartmentNodes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentNodes

@synthesize state = _state;
@synthesize nodesDescription = _nodesDescription;
@synthesize areaId = _areaId;
@synthesize nodes = _nodes;
@synthesize tags = _tags;
@synthesize type = _type;
@synthesize icon = _icon;
@synthesize orgId = _orgId;
@synthesize text = _text;
@synthesize orgLevel = _orgLevel;
@synthesize orgName = _orgName;
@synthesize parentId = _parentId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.state = [JCModel_DepartmentState modelObjectWithDictionary:[dict objectForKey:kJCModel_DepartmentNodesState]];
            self.nodesDescription = [self objectOrNilForKey:kJCModel_DepartmentNodesDescription fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_DepartmentNodesAreaId fromDictionary:dict];
            self.nodes = [self objectOrNilForKey:kJCModel_DepartmentNodesNodes fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kJCModel_DepartmentNodesTags fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_DepartmentNodesType fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kJCModel_DepartmentNodesIcon fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_DepartmentNodesOrgId fromDictionary:dict];
            self.text = [self objectOrNilForKey:kJCModel_DepartmentNodesText fromDictionary:dict];
            self.orgLevel = [[self objectOrNilForKey:kJCModel_DepartmentNodesOrgLevel fromDictionary:dict] doubleValue];
            self.orgName = [self objectOrNilForKey:kJCModel_DepartmentNodesOrgName fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kJCModel_DepartmentNodesParentId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.state dictionaryRepresentation] forKey:kJCModel_DepartmentNodesState];
    [mutableDict setValue:self.nodesDescription forKey:kJCModel_DepartmentNodesDescription];
    [mutableDict setValue:self.areaId forKey:kJCModel_DepartmentNodesAreaId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNodes] forKey:kJCModel_DepartmentNodesNodes];
    [mutableDict setValue:self.tags forKey:kJCModel_DepartmentNodesTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_DepartmentNodesType];
    [mutableDict setValue:self.icon forKey:kJCModel_DepartmentNodesIcon];
    [mutableDict setValue:self.orgId forKey:kJCModel_DepartmentNodesOrgId];
    [mutableDict setValue:self.text forKey:kJCModel_DepartmentNodesText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_DepartmentNodesOrgLevel];
    [mutableDict setValue:self.orgName forKey:kJCModel_DepartmentNodesOrgName];
    [mutableDict setValue:self.parentId forKey:kJCModel_DepartmentNodesParentId];

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

    self.state = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesState];
    self.nodesDescription = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesDescription];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesAreaId];
    self.nodes = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesNodes];
    self.tags = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesTags];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_DepartmentNodesType];
    self.icon = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesIcon];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesOrgId];
    self.text = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesText];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_DepartmentNodesOrgLevel];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesOrgName];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_DepartmentNodesParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_state forKey:kJCModel_DepartmentNodesState];
    [aCoder encodeObject:_nodesDescription forKey:kJCModel_DepartmentNodesDescription];
    [aCoder encodeObject:_areaId forKey:kJCModel_DepartmentNodesAreaId];
    [aCoder encodeObject:_nodes forKey:kJCModel_DepartmentNodesNodes];
    [aCoder encodeObject:_tags forKey:kJCModel_DepartmentNodesTags];
    [aCoder encodeDouble:_type forKey:kJCModel_DepartmentNodesType];
    [aCoder encodeObject:_icon forKey:kJCModel_DepartmentNodesIcon];
    [aCoder encodeObject:_orgId forKey:kJCModel_DepartmentNodesOrgId];
    [aCoder encodeObject:_text forKey:kJCModel_DepartmentNodesText];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_DepartmentNodesOrgLevel];
    [aCoder encodeObject:_orgName forKey:kJCModel_DepartmentNodesOrgName];
    [aCoder encodeObject:_parentId forKey:kJCModel_DepartmentNodesParentId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentNodes *copy = [[JCModel_DepartmentNodes alloc] init];
    
    
    
    if (copy) {

        copy.state = [self.state copyWithZone:zone];
        copy.nodesDescription = [self.nodesDescription copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.nodes = [self.nodes copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.type = self.type;
        copy.icon = [self.icon copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.orgLevel = self.orgLevel;
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
    }
    
    return copy;
}


@end
