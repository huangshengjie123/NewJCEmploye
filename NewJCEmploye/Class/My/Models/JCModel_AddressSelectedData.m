//
//  JCModel_AddressSelectedData.m
//
//  Created by   on 2018/6/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AddressSelectedData.h"


NSString *const kJCModel_AddressSelectedDataDescription = @"description";
NSString *const kJCModel_AddressSelectedDataAreaName = @"areaName";
NSString *const kJCModel_AddressSelectedDataLevel = @"level";
NSString *const kJCModel_AddressSelectedDataXpath = @"xpath";
NSString *const kJCModel_AddressSelectedDataAreaId = @"areaId";
NSString *const kJCModel_AddressSelectedDataParentId = @"parentId";


@interface JCModel_AddressSelectedData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AddressSelectedData

@synthesize dataDescription = _dataDescription;
@synthesize areaName = _areaName;
@synthesize level = _level;
@synthesize xpath = _xpath;
@synthesize areaId = _areaId;
@synthesize parentId = _parentId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataDescription = [self objectOrNilForKey:kJCModel_AddressSelectedDataDescription fromDictionary:dict];
            self.areaName = [self objectOrNilForKey:kJCModel_AddressSelectedDataAreaName fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kJCModel_AddressSelectedDataLevel fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_AddressSelectedDataXpath fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_AddressSelectedDataAreaId fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kJCModel_AddressSelectedDataParentId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_AddressSelectedDataDescription];
    [mutableDict setValue:self.areaName forKey:kJCModel_AddressSelectedDataAreaName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_AddressSelectedDataLevel];
    [mutableDict setValue:self.xpath forKey:kJCModel_AddressSelectedDataXpath];
    [mutableDict setValue:self.areaId forKey:kJCModel_AddressSelectedDataAreaId];
    [mutableDict setValue:self.parentId forKey:kJCModel_AddressSelectedDataParentId];

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

    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedDataDescription];
    self.areaName = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedDataAreaName];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_AddressSelectedDataLevel];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedDataXpath];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedDataAreaId];
    self.parentId = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedDataParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataDescription forKey:kJCModel_AddressSelectedDataDescription];
    [aCoder encodeObject:_areaName forKey:kJCModel_AddressSelectedDataAreaName];
    [aCoder encodeDouble:_level forKey:kJCModel_AddressSelectedDataLevel];
    [aCoder encodeObject:_xpath forKey:kJCModel_AddressSelectedDataXpath];
    [aCoder encodeObject:_areaId forKey:kJCModel_AddressSelectedDataAreaId];
    [aCoder encodeObject:_parentId forKey:kJCModel_AddressSelectedDataParentId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AddressSelectedData *copy = [[JCModel_AddressSelectedData alloc] init];
    
    
    
    if (copy) {

        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.areaName = [self.areaName copyWithZone:zone];
        copy.level = self.level;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
    }
    
    return copy;
}


@end
