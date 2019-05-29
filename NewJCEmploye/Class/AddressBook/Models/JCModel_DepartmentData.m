//
//  JCModel_DepartmentData.m
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentData.h"
#import "JCModel_DepartmentState.h"
#import "JCModel_DepartmentNodes.h"


NSString *const kJCModel_DepartmentDataState = @"state";
NSString *const kJCModel_DepartmentDataDescription = @"description";
NSString *const kJCModel_DepartmentDataAreaId = @"areaId";
NSString *const kJCModel_DepartmentDataNodes = @"nodes";
NSString *const kJCModel_DepartmentDataTags = @"tags";
NSString *const kJCModel_DepartmentDataType = @"type";
NSString *const kJCModel_DepartmentDataIcon = @"icon";
NSString *const kJCModel_DepartmentDataOrgId = @"orgId";
NSString *const kJCModel_DepartmentDataText = @"text";
NSString *const kJCModel_DepartmentDataOrgLevel = @"orgLevel";
NSString *const kJCModel_DepartmentDataOrgName = @"orgName";
NSString *const kJCModel_DepartmentDataParentId = @"parentId";


@interface JCModel_DepartmentData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentData

@synthesize state = _state;
@synthesize dataDescription = _dataDescription;
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
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.state = [JCModel_DepartmentState modelObjectWithDictionary:[dict objectForKey:kJCModel_DepartmentDataState]];
        self.dataDescription = [self objectOrNilForKey:kJCModel_DepartmentDataDescription fromDictionary:dict];
        self.areaId = [self objectOrNilForKey:kJCModel_DepartmentDataAreaId fromDictionary:dict];
        NSObject *receivedJCModel_DepartmentNodes = [dict objectForKey:kJCModel_DepartmentDataNodes];
        NSMutableArray *parsedJCModel_DepartmentNodes = [NSMutableArray array];
        
        if ([receivedJCModel_DepartmentNodes isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedJCModel_DepartmentNodes)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedJCModel_DepartmentNodes addObject:[JCModel_DepartmentNodes modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedJCModel_DepartmentNodes isKindOfClass:[NSDictionary class]])
        {
            [parsedJCModel_DepartmentNodes addObject:[JCModel_DepartmentNodes modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DepartmentNodes]];
        }
        
        self.nodes = [NSArray arrayWithArray:parsedJCModel_DepartmentNodes];
        self.tags = [self objectOrNilForKey:kJCModel_DepartmentDataTags fromDictionary:dict];
        self.type = [[self objectOrNilForKey:kJCModel_DepartmentDataType fromDictionary:dict] doubleValue];
        self.icon = [self objectOrNilForKey:kJCModel_DepartmentDataIcon fromDictionary:dict];
        self.orgId = [self objectOrNilForKey:kJCModel_DepartmentDataOrgId fromDictionary:dict];
        self.text = [self objectOrNilForKey:kJCModel_DepartmentDataText fromDictionary:dict];
        self.orgLevel = [[self objectOrNilForKey:kJCModel_DepartmentDataOrgLevel fromDictionary:dict] doubleValue];
        self.orgName = [self objectOrNilForKey:kJCModel_DepartmentDataOrgName fromDictionary:dict];
        self.parentId = [self objectOrNilForKey:kJCModel_DepartmentDataParentId fromDictionary:dict];
        
    }
    
    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.state dictionaryRepresentation] forKey:kJCModel_DepartmentDataState];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_DepartmentDataDescription];
    [mutableDict setValue:self.areaId forKey:kJCModel_DepartmentDataAreaId];
    NSMutableArray *tempArrayForNodes = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.nodes)
    {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)])
        {
            // This class is a model object
            [tempArrayForNodes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else
        {
            // Generic object
            [tempArrayForNodes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNodes] forKey:kJCModel_DepartmentDataNodes];
    [mutableDict setValue:self.tags forKey:kJCModel_DepartmentDataTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_DepartmentDataType];
    [mutableDict setValue:self.icon forKey:kJCModel_DepartmentDataIcon];
    [mutableDict setValue:self.orgId forKey:kJCModel_DepartmentDataOrgId];
    [mutableDict setValue:self.text forKey:kJCModel_DepartmentDataText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orgLevel] forKey:kJCModel_DepartmentDataOrgLevel];
    [mutableDict setValue:self.orgName forKey:kJCModel_DepartmentDataOrgName];
    [mutableDict setValue:self.parentId forKey:kJCModel_DepartmentDataParentId];

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

    self.state = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataState];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataDescription];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataAreaId];
    self.nodes = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataNodes];
    self.tags = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataTags];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_DepartmentDataType];
    self.icon = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataIcon];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataOrgId];
    self.text = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataText];
    self.orgLevel = [aDecoder decodeDoubleForKey:kJCModel_DepartmentDataOrgLevel];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataOrgName];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_DepartmentDataParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_state forKey:kJCModel_DepartmentDataState];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_DepartmentDataDescription];
    [aCoder encodeObject:_areaId forKey:kJCModel_DepartmentDataAreaId];
    [aCoder encodeObject:_nodes forKey:kJCModel_DepartmentDataNodes];
    [aCoder encodeObject:_tags forKey:kJCModel_DepartmentDataTags];
    [aCoder encodeDouble:_type forKey:kJCModel_DepartmentDataType];
    [aCoder encodeObject:_icon forKey:kJCModel_DepartmentDataIcon];
    [aCoder encodeObject:_orgId forKey:kJCModel_DepartmentDataOrgId];
    [aCoder encodeObject:_text forKey:kJCModel_DepartmentDataText];
    [aCoder encodeDouble:_orgLevel forKey:kJCModel_DepartmentDataOrgLevel];
    [aCoder encodeObject:_orgName forKey:kJCModel_DepartmentDataOrgName];
    [aCoder encodeObject:_parentId forKey:kJCModel_DepartmentDataParentId];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_DepartmentData *copy = [[JCModel_DepartmentData alloc] init];
    
    if (copy)
    {

        copy.state = [self.state copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.nodes = [self.nodes copyWithZone:zone];
        copy.tags = (id)[self.tags copyWithZone:zone];
        copy.type = self.type;
        copy.icon = [self.icon copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.orgLevel = self.orgLevel;
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.parentId = (id)[self.parentId copyWithZone:zone];
    }
    
    return copy;
}


@end
