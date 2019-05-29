//
//  JCModel_watercardRecordsList.m
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_watercardRecordsList.h"


NSString *const kJCModel_watercardRecordsListReason = @"reason";
NSString *const kJCModel_watercardRecordsListReid = @"reid";
NSString *const kJCModel_watercardRecordsListCreateTime = @"createTime";
NSString *const kJCModel_watercardRecordsListId = @"id";
NSString *const kJCModel_watercardRecordsListUpdater = @"updater";
NSString *const kJCModel_watercardRecordsListUsername = @"username";
NSString *const kJCModel_watercardRecordsListType = @"type";
NSString *const kJCModel_watercardRecordsListNum = @"num";
NSString *const kJCModel_watercardRecordsListItem = @"item";
NSString *const kJCModel_watercardRecordsListName = @"name";


@interface JCModel_watercardRecordsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_watercardRecordsList

@synthesize reason = _reason;
@synthesize reid = _reid;
@synthesize createTime = _createTime;
@synthesize listIdentifier = _listIdentifier;
@synthesize updater = _updater;
@synthesize username = _username;
@synthesize type = _type;
@synthesize num = _num;
@synthesize item = _item;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.reason = [self objectOrNilForKey:kJCModel_watercardRecordsListReason fromDictionary:dict];
            self.reid = [self objectOrNilForKey:kJCModel_watercardRecordsListReid fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_watercardRecordsListCreateTime fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_watercardRecordsListId fromDictionary:dict];
            self.updater = [[self objectOrNilForKey:kJCModel_watercardRecordsListUpdater fromDictionary:dict] doubleValue];
            self.username = [self objectOrNilForKey:kJCModel_watercardRecordsListUsername fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_watercardRecordsListType fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kJCModel_watercardRecordsListNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_watercardRecordsListItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_watercardRecordsListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reason forKey:kJCModel_watercardRecordsListReason];
    [mutableDict setValue:self.reid forKey:kJCModel_watercardRecordsListReid];
    [mutableDict setValue:self.createTime forKey:kJCModel_watercardRecordsListCreateTime];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_watercardRecordsListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updater] forKey:kJCModel_watercardRecordsListUpdater];
    [mutableDict setValue:self.username forKey:kJCModel_watercardRecordsListUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_watercardRecordsListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_watercardRecordsListNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_watercardRecordsListItem];
    [mutableDict setValue:self.name forKey:kJCModel_watercardRecordsListName];

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

    self.reason = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListReason];
    self.reid = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListReid];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListCreateTime];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListId];
    self.updater = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsListUpdater];
    self.username = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListUsername];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsListType];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsListNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_watercardRecordsListItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reason forKey:kJCModel_watercardRecordsListReason];
    [aCoder encodeObject:_reid forKey:kJCModel_watercardRecordsListReid];
    [aCoder encodeObject:_createTime forKey:kJCModel_watercardRecordsListCreateTime];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_watercardRecordsListId];
    [aCoder encodeDouble:_updater forKey:kJCModel_watercardRecordsListUpdater];
    [aCoder encodeObject:_username forKey:kJCModel_watercardRecordsListUsername];
    [aCoder encodeDouble:_type forKey:kJCModel_watercardRecordsListType];
    [aCoder encodeDouble:_num forKey:kJCModel_watercardRecordsListNum];
    [aCoder encodeDouble:_item forKey:kJCModel_watercardRecordsListItem];
    [aCoder encodeObject:_name forKey:kJCModel_watercardRecordsListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_watercardRecordsList *copy = [[JCModel_watercardRecordsList alloc] init];
    
    
    
    if (copy) {

        copy.reason = [self.reason copyWithZone:zone];
        copy.reid = [self.reid copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.updater = self.updater;
        copy.username = [self.username copyWithZone:zone];
        copy.type = self.type;
        copy.num = self.num;
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
