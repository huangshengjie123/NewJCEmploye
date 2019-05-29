//
//  JCModel_WorkGroupList.m
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkGroupList.h"
#import "JCModel_WorkGroupGroupRelations.h"


NSString *const kJCModel_WorkGroupListOwner = @"owner";
NSString *const kJCModel_WorkGroupListOrg = @"org";
NSString *const kJCModel_WorkGroupListParent = @"parent";
NSString *const kJCModel_WorkGroupListId = @"id";
NSString *const kJCModel_WorkGroupListLevel = @"level";
NSString *const kJCModel_WorkGroupListDescription = @"description";
NSString *const kJCModel_WorkGroupListType = @"type";
NSString *const kJCModel_WorkGroupListName = @"name";
NSString *const kJCModel_WorkGroupListGroupRelations = @"groupRelations";


@interface JCModel_WorkGroupList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkGroupList

@synthesize owner = _owner;
@synthesize org = _org;
@synthesize parent = _parent;
@synthesize listIdentifier = _listIdentifier;
@synthesize level = _level;
@synthesize listDescription = _listDescription;
@synthesize type = _type;
@synthesize name = _name;
@synthesize groupRelations = _groupRelations;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [[self objectOrNilForKey:kJCModel_WorkGroupListOwner fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_WorkGroupListOrg fromDictionary:dict];
            self.parent = [self objectOrNilForKey:kJCModel_WorkGroupListParent fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_WorkGroupListId fromDictionary:dict];
            self.level = [self objectOrNilForKey:kJCModel_WorkGroupListLevel fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kJCModel_WorkGroupListDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_WorkGroupListType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_WorkGroupListName fromDictionary:dict];
    NSObject *receivedJCModel_WorkGroupGroupRelations = [dict objectForKey:kJCModel_WorkGroupListGroupRelations];
    NSMutableArray *parsedJCModel_WorkGroupGroupRelations = [NSMutableArray array];
    
    if ([receivedJCModel_WorkGroupGroupRelations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WorkGroupGroupRelations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WorkGroupGroupRelations addObject:[JCModel_WorkGroupGroupRelations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WorkGroupGroupRelations isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WorkGroupGroupRelations addObject:[JCModel_WorkGroupGroupRelations modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WorkGroupGroupRelations]];
    }

    self.groupRelations = [NSArray arrayWithArray:parsedJCModel_WorkGroupGroupRelations];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_WorkGroupListOwner];
    [mutableDict setValue:self.org forKey:kJCModel_WorkGroupListOrg];
    [mutableDict setValue:self.parent forKey:kJCModel_WorkGroupListParent];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_WorkGroupListId];
    [mutableDict setValue:self.level forKey:kJCModel_WorkGroupListLevel];
    [mutableDict setValue:self.listDescription forKey:kJCModel_WorkGroupListDescription];
    [mutableDict setValue:self.type forKey:kJCModel_WorkGroupListType];
    [mutableDict setValue:self.name forKey:kJCModel_WorkGroupListName];
    NSMutableArray *tempArrayForGroupRelations = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.groupRelations) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroupRelations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroupRelations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroupRelations] forKey:kJCModel_WorkGroupListGroupRelations];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_WorkGroupListOwner];
    self.org = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListOrg];
    self.parent = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListParent];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListId];
    self.level = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListLevel];
    self.listDescription = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListDescription];
    self.type = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListName];
    self.groupRelations = [aDecoder decodeObjectForKey:kJCModel_WorkGroupListGroupRelations];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_WorkGroupListOwner];
    [aCoder encodeObject:_org forKey:kJCModel_WorkGroupListOrg];
    [aCoder encodeObject:_parent forKey:kJCModel_WorkGroupListParent];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_WorkGroupListId];
    [aCoder encodeObject:_level forKey:kJCModel_WorkGroupListLevel];
    [aCoder encodeObject:_listDescription forKey:kJCModel_WorkGroupListDescription];
    [aCoder encodeObject:_type forKey:kJCModel_WorkGroupListType];
    [aCoder encodeObject:_name forKey:kJCModel_WorkGroupListName];
    [aCoder encodeObject:_groupRelations forKey:kJCModel_WorkGroupListGroupRelations];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkGroupList *copy = [[JCModel_WorkGroupList alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.org = [self.org copyWithZone:zone];
        copy.parent = [self.parent copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.groupRelations = [self.groupRelations copyWithZone:zone];
    }
    
    return copy;
}


@end
