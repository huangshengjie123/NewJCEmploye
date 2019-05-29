//
//  JCModel_inAndOutTotalData.m
//
//  Created by   on 2018/11/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inAndOutTotalData.h"


NSString *const kJCModel_inAndOutTotalDataTotal = @"total";
NSString *const kJCModel_inAndOutTotalDataEndTime = @"endTime";
NSString *const kJCModel_inAndOutTotalDataStoreHouse = @"storeHouse";
NSString *const kJCModel_inAndOutTotalDataType = @"type";
NSString *const kJCModel_inAndOutTotalDataPtype = @"ptype";
NSString *const kJCModel_inAndOutTotalDataCreateTime = @"createTime";
NSString *const kJCModel_inAndOutTotalDataName = @"name";


@interface JCModel_inAndOutTotalData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inAndOutTotalData

@synthesize total = _total;
@synthesize endTime = _endTime;
@synthesize storeHouse = _storeHouse;
@synthesize type = _type;
@synthesize ptype = _ptype;
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
            self.total = [[self objectOrNilForKey:kJCModel_inAndOutTotalDataTotal fromDictionary:dict] doubleValue];
            self.endTime = [self objectOrNilForKey:kJCModel_inAndOutTotalDataEndTime fromDictionary:dict];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_inAndOutTotalDataStoreHouse fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kJCModel_inAndOutTotalDataType fromDictionary:dict] doubleValue];
            self.ptype = [[self objectOrNilForKey:kJCModel_inAndOutTotalDataPtype fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_inAndOutTotalDataCreateTime fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_inAndOutTotalDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kJCModel_inAndOutTotalDataTotal];
    [mutableDict setValue:self.endTime forKey:kJCModel_inAndOutTotalDataEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_inAndOutTotalDataStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_inAndOutTotalDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ptype] forKey:kJCModel_inAndOutTotalDataPtype];
    [mutableDict setValue:self.createTime forKey:kJCModel_inAndOutTotalDataCreateTime];
    [mutableDict setValue:self.name forKey:kJCModel_inAndOutTotalDataName];

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

    self.total = [aDecoder decodeDoubleForKey:kJCModel_inAndOutTotalDataTotal];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalDataEndTime];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_inAndOutTotalDataStoreHouse];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_inAndOutTotalDataType];
    self.ptype = [aDecoder decodeDoubleForKey:kJCModel_inAndOutTotalDataPtype];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalDataCreateTime];
    self.name = [aDecoder decodeObjectForKey:kJCModel_inAndOutTotalDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kJCModel_inAndOutTotalDataTotal];
    [aCoder encodeObject:_endTime forKey:kJCModel_inAndOutTotalDataEndTime];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_inAndOutTotalDataStoreHouse];
    [aCoder encodeDouble:_type forKey:kJCModel_inAndOutTotalDataType];
    [aCoder encodeDouble:_ptype forKey:kJCModel_inAndOutTotalDataPtype];
    [aCoder encodeObject:_createTime forKey:kJCModel_inAndOutTotalDataCreateTime];
    [aCoder encodeObject:_name forKey:kJCModel_inAndOutTotalDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inAndOutTotalData *copy = [[JCModel_inAndOutTotalData alloc] init];
    
    
    
    if (copy) {

        copy.total = self.total;
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.storeHouse = self.storeHouse;
        copy.type = self.type;
        copy.ptype = self.ptype;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
