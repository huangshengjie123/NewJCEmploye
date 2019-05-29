//
//  JCModel_MyWarehouseData.m
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyWarehouseData.h"


NSString *const kJCModel_MyWarehouseDataId = @"id";
NSString *const kJCModel_MyWarehouseDataOrg = @"org";
NSString *const kJCModel_MyWarehouseDataUserExtInfoStaffVOList = @"userExtInfoStaffVOList";
NSString *const kJCModel_MyWarehouseDataName = @"name";
NSString *const kJCModel_MyWarehouseDataDescription = @"description";
NSString *const kJCModel_MyWarehouseDataType = @"type";

NSString *const kJCModel_MyWarehouseDataPrice = @"price";


@interface JCModel_MyWarehouseData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyWarehouseData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize org = _org;
@synthesize userExtInfoStaffVOList = _userExtInfoStaffVOList;
@synthesize name = _name;
@synthesize dataDescription = _dataDescription;
@synthesize type = _type;
@synthesize price = _price;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_MyWarehouseDataId fromDictionary:dict] doubleValue];
            self.org = [self objectOrNilForKey:kJCModel_MyWarehouseDataOrg fromDictionary:dict];
            self.userExtInfoStaffVOList = [self objectOrNilForKey:kJCModel_MyWarehouseDataUserExtInfoStaffVOList fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_MyWarehouseDataName fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_MyWarehouseDataDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_MyWarehouseDataType fromDictionary:dict] doubleValue];
           self.price = [self objectOrNilForKey:kJCModel_MyWarehouseDataPrice fromDictionary:dict];
        

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_MyWarehouseDataId];
    [mutableDict setValue:self.org forKey:kJCModel_MyWarehouseDataOrg];
    [mutableDict setValue:self.userExtInfoStaffVOList forKey:kJCModel_MyWarehouseDataUserExtInfoStaffVOList];
    [mutableDict setValue:self.name forKey:kJCModel_MyWarehouseDataName];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_MyWarehouseDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_MyWarehouseDataType];
    [mutableDict setValue:self.price forKey:kJCModel_MyWarehouseDataPrice];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_MyWarehouseDataId];
    self.org = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseDataOrg];
    self.userExtInfoStaffVOList = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseDataUserExtInfoStaffVOList];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseDataName];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseDataDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_MyWarehouseDataType];
    self.price = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseDataPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_MyWarehouseDataId];
    [aCoder encodeObject:_org forKey:kJCModel_MyWarehouseDataOrg];
    [aCoder encodeObject:_userExtInfoStaffVOList forKey:kJCModel_MyWarehouseDataUserExtInfoStaffVOList];
    [aCoder encodeObject:_name forKey:kJCModel_MyWarehouseDataName];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_MyWarehouseDataDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_MyWarehouseDataType];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_MyWarehouseData *copy = [[JCModel_MyWarehouseData alloc] init];
    
    if (copy)
    {
        copy.dataIdentifier = self.dataIdentifier;
        copy.org = [self.org copyWithZone:zone];
        copy.userExtInfoStaffVOList = (id)[self.userExtInfoStaffVOList copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.type = self.type;
        copy.price = [self.price copyWithZone:zone];
    }
    
    return copy;
}


@end
