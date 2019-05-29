//
//  JCModel_MenuData.m
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MenuData.h"


NSString *const kJCModel_MenuDataCode = @"code";
NSString *const kJCModel_MenuDataCataId = @"cataId";
NSString *const kJCModel_MenuDataAuthId = @"authId";
NSString *const kJCModel_MenuDataType = @"type";
NSString *const kJCModel_MenuDataDescription = @"description";
NSString *const kJCModel_MenuDataName = @"name";


@interface JCModel_MenuData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MenuData

@synthesize code = _code;
@synthesize cataId = _cataId;
@synthesize authId = _authId;
@synthesize type = _type;
@synthesize dataDescription = _dataDescription;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kJCModel_MenuDataCode fromDictionary:dict];
            self.cataId = [[self objectOrNilForKey:kJCModel_MenuDataCataId fromDictionary:dict] doubleValue];
            self.authId = [self objectOrNilForKey:kJCModel_MenuDataAuthId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_MenuDataType fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_MenuDataDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_MenuDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kJCModel_MenuDataCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cataId] forKey:kJCModel_MenuDataCataId];
    [mutableDict setValue:self.authId forKey:kJCModel_MenuDataAuthId];
    [mutableDict setValue:self.type forKey:kJCModel_MenuDataType];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_MenuDataDescription];
    [mutableDict setValue:self.name forKey:kJCModel_MenuDataName];

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

    self.code = [aDecoder decodeObjectForKey:kJCModel_MenuDataCode];
    self.cataId = [aDecoder decodeDoubleForKey:kJCModel_MenuDataCataId];
    self.authId = [aDecoder decodeObjectForKey:kJCModel_MenuDataAuthId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_MenuDataType];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_MenuDataDescription];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MenuDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kJCModel_MenuDataCode];
    [aCoder encodeDouble:_cataId forKey:kJCModel_MenuDataCataId];
    [aCoder encodeObject:_authId forKey:kJCModel_MenuDataAuthId];
    [aCoder encodeObject:_type forKey:kJCModel_MenuDataType];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_MenuDataDescription];
    [aCoder encodeObject:_name forKey:kJCModel_MenuDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MenuData *copy = [[JCModel_MenuData alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.cataId = self.cataId;
        copy.authId = [self.authId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
