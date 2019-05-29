//
//  JCModel_WaterCardData.m
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardData.h"
#import "JCModel_WaterCardWaterCardItems.h"
#import "JCModel_WaterCardWaterCardRecords.h"


NSString *const kJCModel_WaterCardDataOwner = @"owner";
NSString *const kJCModel_WaterCardDataUowner = @"uowner";
NSString *const kJCModel_WaterCardDataWaterCardItems = @"waterCardItems";
NSString *const kJCModel_WaterCardDataId = @"id";
NSString *const kJCModel_WaterCardDataLevel = @"level";
NSString *const kJCModel_WaterCardDataCreater = @"creater";
NSString *const kJCModel_WaterCardDataWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_WaterCardDataType = @"type";


@interface JCModel_WaterCardData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardData

@synthesize owner = _owner;
@synthesize uowner = _uowner;
@synthesize waterCardItems = _waterCardItems;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize level = _level;
@synthesize creater = _creater;
@synthesize waterCardRecords = _waterCardRecords;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [[self objectOrNilForKey:kJCModel_WaterCardDataOwner fromDictionary:dict] doubleValue];
            self.uowner = [self objectOrNilForKey:kJCModel_WaterCardDataUowner fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardWaterCardItems = [dict objectForKey:kJCModel_WaterCardDataWaterCardItems];
    NSMutableArray *parsedJCModel_WaterCardWaterCardItems = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardWaterCardItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardWaterCardItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardWaterCardItems addObject:[JCModel_WaterCardWaterCardItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardWaterCardItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardWaterCardItems addObject:[JCModel_WaterCardWaterCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardWaterCardItems]];
    }

    self.waterCardItems = [NSArray arrayWithArray:parsedJCModel_WaterCardWaterCardItems];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_WaterCardDataId fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kJCModel_WaterCardDataLevel fromDictionary:dict] doubleValue];
            self.creater = [self objectOrNilForKey:kJCModel_WaterCardDataCreater fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardWaterCardRecords = [dict objectForKey:kJCModel_WaterCardDataWaterCardRecords];
    NSMutableArray *parsedJCModel_WaterCardWaterCardRecords = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardWaterCardRecords isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardWaterCardRecords) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardWaterCardRecords addObject:[JCModel_WaterCardWaterCardRecords modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardWaterCardRecords isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardWaterCardRecords addObject:[JCModel_WaterCardWaterCardRecords modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardWaterCardRecords]];
    }

    self.waterCardRecords = [NSArray arrayWithArray:parsedJCModel_WaterCardWaterCardRecords];
            self.type = [[self objectOrNilForKey:kJCModel_WaterCardDataType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_WaterCardDataOwner];
    [mutableDict setValue:self.uowner forKey:kJCModel_WaterCardDataUowner];
    NSMutableArray *tempArrayForWaterCardItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.waterCardItems) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWaterCardItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWaterCardItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardItems] forKey:kJCModel_WaterCardDataWaterCardItems];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_WaterCardDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_WaterCardDataLevel];
    [mutableDict setValue:self.creater forKey:kJCModel_WaterCardDataCreater];
    NSMutableArray *tempArrayForWaterCardRecords = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.waterCardRecords) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWaterCardRecords addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWaterCardRecords addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardRecords] forKey:kJCModel_WaterCardDataWaterCardRecords];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_WaterCardDataType];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDataOwner];
    self.uowner = [aDecoder decodeObjectForKey:kJCModel_WaterCardDataUowner];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_WaterCardDataWaterCardItems];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_WaterCardDataId];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDataLevel];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_WaterCardDataCreater];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_WaterCardDataWaterCardRecords];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_WaterCardDataOwner];
    [aCoder encodeObject:_uowner forKey:kJCModel_WaterCardDataUowner];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_WaterCardDataWaterCardItems];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_WaterCardDataId];
    [aCoder encodeDouble:_level forKey:kJCModel_WaterCardDataLevel];
    [aCoder encodeObject:_creater forKey:kJCModel_WaterCardDataCreater];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_WaterCardDataWaterCardRecords];
    [aCoder encodeDouble:_type forKey:kJCModel_WaterCardDataType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardData *copy = [[JCModel_WaterCardData alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.uowner = [self.uowner copyWithZone:zone];
        copy.waterCardItems = [self.waterCardItems copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.level = self.level;
        copy.creater = [self.creater copyWithZone:zone];
        copy.waterCardRecords = [self.waterCardRecords copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
