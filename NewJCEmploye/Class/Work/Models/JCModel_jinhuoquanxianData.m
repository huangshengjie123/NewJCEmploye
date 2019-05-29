//
//  JCModel_jinhuoquanxianData.m
//
//  Created by   on 2018/10/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_jinhuoquanxianData.h"


NSString *const kJCModel_jinhuoquanxianDataCode = @"code";
NSString *const kJCModel_jinhuoquanxianDataCataId = @"cataId";
NSString *const kJCModel_jinhuoquanxianDataType = @"type";
NSString *const kJCModel_jinhuoquanxianDataDescription = @"description";
NSString *const kJCModel_jinhuoquanxianDataName = @"name";
NSString *const kJCModel_jinhuoquanxianDataAuthId = @"authId";


@interface JCModel_jinhuoquanxianData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_jinhuoquanxianData

@synthesize code = _code;
@synthesize cataId = _cataId;
@synthesize type = _type;
@synthesize dataDescription = _dataDescription;
@synthesize name = _name;
@synthesize authId = _authId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kJCModel_jinhuoquanxianDataCode fromDictionary:dict];
            self.cataId = [[self objectOrNilForKey:kJCModel_jinhuoquanxianDataCataId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_jinhuoquanxianDataType fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_jinhuoquanxianDataDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_jinhuoquanxianDataName fromDictionary:dict];
            self.authId = [self objectOrNilForKey:kJCModel_jinhuoquanxianDataAuthId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kJCModel_jinhuoquanxianDataCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cataId] forKey:kJCModel_jinhuoquanxianDataCataId];
    [mutableDict setValue:self.type forKey:kJCModel_jinhuoquanxianDataType];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_jinhuoquanxianDataDescription];
    [mutableDict setValue:self.name forKey:kJCModel_jinhuoquanxianDataName];
    [mutableDict setValue:self.authId forKey:kJCModel_jinhuoquanxianDataAuthId];

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

    self.code = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianDataCode];
    self.cataId = [aDecoder decodeDoubleForKey:kJCModel_jinhuoquanxianDataCataId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianDataType];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianDataDescription];
    self.name = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianDataName];
    self.authId = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianDataAuthId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kJCModel_jinhuoquanxianDataCode];
    [aCoder encodeDouble:_cataId forKey:kJCModel_jinhuoquanxianDataCataId];
    [aCoder encodeObject:_type forKey:kJCModel_jinhuoquanxianDataType];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_jinhuoquanxianDataDescription];
    [aCoder encodeObject:_name forKey:kJCModel_jinhuoquanxianDataName];
    [aCoder encodeObject:_authId forKey:kJCModel_jinhuoquanxianDataAuthId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_jinhuoquanxianData *copy = [[JCModel_jinhuoquanxianData alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.cataId = self.cataId;
        copy.type = [self.type copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.authId = [self.authId copyWithZone:zone];
    }
    
    return copy;
}


@end
