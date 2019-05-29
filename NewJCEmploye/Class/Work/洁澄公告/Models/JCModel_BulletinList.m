//
//  JCModel_BulletinList.m
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BulletinList.h"


NSString *const kJCModel_BulletinListOwner = @"owner";
NSString *const kJCModel_BulletinListContent = @"content";
NSString *const kJCModel_BulletinListId = @"id";
NSString *const kJCModel_BulletinListFile = @"file";
NSString *const kJCModel_BulletinListOrgId = @"orgId";
NSString *const kJCModel_BulletinListCreateTime = @"createTime";
NSString *const kJCModel_BulletinListName = @"name";


@interface JCModel_BulletinList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BulletinList

@synthesize owner = _owner;
@synthesize content = _content;
@synthesize listIdentifier = _listIdentifier;
@synthesize file = _file;
@synthesize orgId = _orgId;
@synthesize createTime = _createTime;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [[self objectOrNilForKey:kJCModel_BulletinListOwner fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kJCModel_BulletinListContent fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_BulletinListId fromDictionary:dict] doubleValue];
            self.file = [self objectOrNilForKey:kJCModel_BulletinListFile fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kJCModel_BulletinListOrgId fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_BulletinListCreateTime fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_BulletinListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_BulletinListOwner];
    [mutableDict setValue:self.content forKey:kJCModel_BulletinListContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_BulletinListId];
    [mutableDict setValue:self.file forKey:kJCModel_BulletinListFile];
    [mutableDict setValue:self.orgId forKey:kJCModel_BulletinListOrgId];
    [mutableDict setValue:self.createTime forKey:kJCModel_BulletinListCreateTime];
    [mutableDict setValue:self.name forKey:kJCModel_BulletinListName];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_BulletinListOwner];
    self.content = [aDecoder decodeObjectForKey:kJCModel_BulletinListContent];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_BulletinListId];
    self.file = [aDecoder decodeObjectForKey:kJCModel_BulletinListFile];
    self.orgId = [aDecoder decodeObjectForKey:kJCModel_BulletinListOrgId];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_BulletinListCreateTime];
    self.name = [aDecoder decodeObjectForKey:kJCModel_BulletinListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_BulletinListOwner];
    [aCoder encodeObject:_content forKey:kJCModel_BulletinListContent];
    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_BulletinListId];
    [aCoder encodeObject:_file forKey:kJCModel_BulletinListFile];
    [aCoder encodeObject:_orgId forKey:kJCModel_BulletinListOrgId];
    [aCoder encodeObject:_createTime forKey:kJCModel_BulletinListCreateTime];
    [aCoder encodeObject:_name forKey:kJCModel_BulletinListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BulletinList *copy = [[JCModel_BulletinList alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.content = [self.content copyWithZone:zone];
        copy.listIdentifier = self.listIdentifier;
        copy.file = [self.file copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
