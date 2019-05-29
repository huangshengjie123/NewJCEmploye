//
//  JCModel_StoreHouseInfoData.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_StoreHouseInfoData.h"
#import "JCModel_StoreHouseInfoUserExtInfoStaffVOList.h"


NSString *const kJCModel_StoreHouseInfoDataId = @"id";
NSString *const kJCModel_StoreHouseInfoDataOrg = @"org";
NSString *const kJCModel_StoreHouseInfoDataUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_StoreHouseInfoDataName = @"name";
NSString *const kJCModel_StoreHouseInfoDataDescription = @"description";
NSString *const kJCModel_StoreHouseInfoDataType = @"type";


@interface JCModel_StoreHouseInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_StoreHouseInfoData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize dataDescription = _dataDescription;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_StoreHouseInfoDataId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_StoreHouseInfoDataOrg fromDictionary:dict];
    NSObject *receivedJCModel_StoreHouseInfoUserExtInfoStaffVOList = [dict objectForKey:kJCModel_StoreHouseInfoDataUserExtInfoStaffVOList];
    NSMutableArray *parsedJCModel_StoreHouseInfoUserExtInfoStaffVOList = [NSMutableArray array];
    
    if ([receivedJCModel_StoreHouseInfoUserExtInfoStaffVOList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_StoreHouseInfoUserExtInfoStaffVOList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_StoreHouseInfoUserExtInfoStaffVOList addObject:[JCModel_StoreHouseInfoUserExtInfoStaffVOList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_StoreHouseInfoUserExtInfoStaffVOList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_StoreHouseInfoUserExtInfoStaffVOList addObject:[JCModel_StoreHouseInfoUserExtInfoStaffVOList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_StoreHouseInfoUserExtInfoStaffVOList]];
    }

    self.userExtInfoStaffVOList = [NSArray arrayWithArray:parsedJCModel_StoreHouseInfoUserExtInfoStaffVOList];
            self.name = [self objectOrNilForKey:kJCModel_StoreHouseInfoDataName fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_StoreHouseInfoDataDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_StoreHouseInfoDataType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_StoreHouseInfoDataId];
    [mutableDict setValue:self.org forKey:kJCModel_StoreHouseInfoDataOrg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserExtInfoStaffVOList] forKey:kJCModel_StoreHouseInfoDataUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_StoreHouseInfoDataName];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_StoreHouseInfoDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_StoreHouseInfoDataType];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_StoreHouseInfoDataId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoDataOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoDataUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoDataName];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_StoreHouseInfoDataDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_StoreHouseInfoDataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_StoreHouseInfoDataId];
    [aCoder encodeObject:_org forKey:kJCModel_StoreHouseInfoDataOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_StoreHouseInfoDataUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_StoreHouseInfoDataName];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_StoreHouseInfoDataDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_StoreHouseInfoDataType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_StoreHouseInfoData *copy = [[JCModel_StoreHouseInfoData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = [self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
