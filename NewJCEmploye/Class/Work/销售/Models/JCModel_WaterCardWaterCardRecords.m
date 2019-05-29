//
//  JCModel_WaterCardWaterCardRecords.m
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardWaterCardRecords.h"


NSString *const kJCModel_WaterCardWaterCardRecordsId = @"id";
NSString *const kJCModel_WaterCardWaterCardRecordsNum = @"num";
NSString *const kJCModel_WaterCardWaterCardRecordsCreateTime = @"createTime";
NSString *const kJCModel_WaterCardWaterCardRecordsType = @"type";
NSString *const kJCModel_WaterCardWaterCardRecordsItem = @"item";
NSString *const kJCModel_WaterCardWaterCardRecordsName = @"name";


@interface JCModel_WaterCardWaterCardRecords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardWaterCardRecords

@synthesize waterCardRecordsIdentifier = _waterCardRecordsIdentifier;
@synthesize num = _num;
@synthesize createTime = _createTime;
@synthesize type = _type;
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
            self.waterCardRecordsIdentifier = [self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsId fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsNum fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsCreateTime fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsType fromDictionary:dict] doubleValue];
            self.item = [self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsItem fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_WaterCardWaterCardRecordsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardRecordsIdentifier forKey:kJCModel_WaterCardWaterCardRecordsId];
    [mutableDict setValue:self.num forKey:kJCModel_WaterCardWaterCardRecordsNum];
    [mutableDict setValue:self.createTime forKey:kJCModel_WaterCardWaterCardRecordsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_WaterCardWaterCardRecordsType];
    [mutableDict setValue:self.item forKey:kJCModel_WaterCardWaterCardRecordsItem];
    [mutableDict setValue:self.name forKey:kJCModel_WaterCardWaterCardRecordsName];

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

    self.waterCardRecordsIdentifier = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardRecordsId];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardRecordsNum];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardRecordsCreateTime];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_WaterCardWaterCardRecordsType];
    self.item = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardRecordsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardRecordsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardRecordsIdentifier forKey:kJCModel_WaterCardWaterCardRecordsId];
    [aCoder encodeObject:_num forKey:kJCModel_WaterCardWaterCardRecordsNum];
    [aCoder encodeObject:_createTime forKey:kJCModel_WaterCardWaterCardRecordsCreateTime];
    [aCoder encodeDouble:_type forKey:kJCModel_WaterCardWaterCardRecordsType];
    [aCoder encodeObject:_item forKey:kJCModel_WaterCardWaterCardRecordsItem];
    [aCoder encodeObject:_name forKey:kJCModel_WaterCardWaterCardRecordsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardWaterCardRecords *copy = [[JCModel_WaterCardWaterCardRecords alloc] init];
    
    
    
    if (copy) {

        copy.waterCardRecordsIdentifier = [self.waterCardRecordsIdentifier copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.type = self.type;
        copy.item = [self.item copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
