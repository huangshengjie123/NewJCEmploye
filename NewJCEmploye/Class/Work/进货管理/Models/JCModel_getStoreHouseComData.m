//
//  JCModel_getStoreHouseComData.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseComData.h"
#import "JCModel_getStoreHouseComStoreHouseStaffList.h"


NSString *const kJCModel_getStoreHouseComDataDescription = @"description";
NSString *const kJCModel_getStoreHouseComDataId = @"id";
NSString *const kJCModel_getStoreHouseComDataOrg = @"org";
NSString *const kJCModel_getStoreHouseComDataType = @"type";
NSString *const kJCModel_getStoreHouseComDataName = @"name";
NSString *const kJCModel_getStoreHouseComDataStoreHouseStaffList = @"storeHouseStaffList";


@interface JCModel_getStoreHouseComData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseComData

@synthesize dataDescription = _dataDescription;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize org = _org;
@synthesize type = _type;
@synthesize name = _name;
@synthesize storeHouseStaffList = _storeHouseStaffList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataDescription = [self objectOrNilForKey:kJCModel_getStoreHouseComDataDescription fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_getStoreHouseComDataId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_getStoreHouseComDataOrg fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_getStoreHouseComDataType fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_getStoreHouseComDataName fromDictionary:dict];
    NSObject *receivedJCModel_getStoreHouseComStoreHouseStaffList = [dict objectForKey:kJCModel_getStoreHouseComDataStoreHouseStaffList];
    NSMutableArray *parsedJCModel_getStoreHouseComStoreHouseStaffList = [NSMutableArray array];
    
    if ([receivedJCModel_getStoreHouseComStoreHouseStaffList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_getStoreHouseComStoreHouseStaffList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_getStoreHouseComStoreHouseStaffList addObject:[JCModel_getStoreHouseComStoreHouseStaffList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_getStoreHouseComStoreHouseStaffList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_getStoreHouseComStoreHouseStaffList addObject:[JCModel_getStoreHouseComStoreHouseStaffList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_getStoreHouseComStoreHouseStaffList]];
    }

    self.storeHouseStaffList = [NSArray arrayWithArray:parsedJCModel_getStoreHouseComStoreHouseStaffList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_getStoreHouseComDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_getStoreHouseComDataId];
    [mutableDict setValue:self.org forKey:kJCModel_getStoreHouseComDataOrg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_getStoreHouseComDataType];
    [mutableDict setValue:self.name forKey:kJCModel_getStoreHouseComDataName];
    NSMutableArray *tempArrayForStoreHouseStaffList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.storeHouseStaffList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStoreHouseStaffList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStoreHouseStaffList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStoreHouseStaffList] forKey:kJCModel_getStoreHouseComDataStoreHouseStaffList];

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

    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComDataDescription];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseComDataId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComDataOrg];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseComDataType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComDataName];
    self.storeHouseStaffList = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseComDataStoreHouseStaffList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataDescription forKey:kJCModel_getStoreHouseComDataDescription];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_getStoreHouseComDataId];
    [aCoder encodeObject:_org forKey:kJCModel_getStoreHouseComDataOrg];
    [aCoder encodeDouble:_type forKey:kJCModel_getStoreHouseComDataType];
    [aCoder encodeObject:_name forKey:kJCModel_getStoreHouseComDataName];
    [aCoder encodeObject:_storeHouseStaffList forKey:kJCModel_getStoreHouseComDataStoreHouseStaffList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseComData *copy = [[JCModel_getStoreHouseComData alloc] init];
    
    
    
    if (copy) {

        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.dataIdentifier = self.dataIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.type = self.type;
        copy.name = [self.name copyWithZone:zone];
        copy.storeHouseStaffList = [self.storeHouseStaffList copyWithZone:zone];
    }
    
    return copy;
}


@end
