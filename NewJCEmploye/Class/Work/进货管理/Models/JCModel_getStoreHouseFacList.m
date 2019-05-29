//
//  JCModel_getStoreHouseFacList.m
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseFacList.h"


NSString *const kJCModel_getStoreHouseFacListId = @"id";
NSString *const kJCModel_getStoreHouseFacListOrg = @"org";
NSString *const kJCModel_getStoreHouseFacListUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_getStoreHouseFacListName = @"name";
NSString *const kJCModel_getStoreHouseFacListDescription = @"description";
NSString *const kJCModel_getStoreHouseFacListType = @"type";


@interface JCModel_getStoreHouseFacList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseFacList

@synthesize listIdentifier = _listIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize listDescription = _listDescription;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_getStoreHouseFacListId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_getStoreHouseFacListOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_getStoreHouseFacListUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_getStoreHouseFacListName fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kJCModel_getStoreHouseFacListDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_getStoreHouseFacListType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_getStoreHouseFacListId];
    [mutableDict setValue:self.org forKey:kJCModel_getStoreHouseFacListOrg];
    NSMutableArray *tempArrayForUserExtInfoStaffVOList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.userExtInfoStaffVOList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUserExtInfoStaffVOList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUserExtInfoStaffVOList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserExtInfoStaffVOList] forKey:kJCModel_getStoreHouseFacListUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_getStoreHouseFacListName];
    [mutableDict setValue:self.listDescription forKey:kJCModel_getStoreHouseFacListDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_getStoreHouseFacListType];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacListId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacListOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacListUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacListName];
    self.listDescription = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacListDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacListType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_getStoreHouseFacListId];
    [aCoder encodeObject:_org forKey:kJCModel_getStoreHouseFacListOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_getStoreHouseFacListUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_getStoreHouseFacListName];
    [aCoder encodeObject:_listDescription forKey:kJCModel_getStoreHouseFacListDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_getStoreHouseFacListType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseFacList *copy = [[JCModel_getStoreHouseFacList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = [self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
