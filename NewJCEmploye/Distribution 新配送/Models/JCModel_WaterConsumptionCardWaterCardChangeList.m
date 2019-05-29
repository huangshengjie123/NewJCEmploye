//
//  JCModel_WaterConsumptionCardWaterCardChangeList.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardWaterCardChangeList.h"


NSString *const kJCModel_WaterConsumptionCardWaterCardChangeListStaffCardId = @"staffCardId";
NSString *const kJCModel_WaterConsumptionCardWaterCardChangeListNum = @"num";
NSString *const kJCModel_WaterConsumptionCardWaterCardChangeListItem = @"item";
NSString *const kJCModel_WaterConsumptionCardWaterCardChangeListCusCardId = @"cusCardId";


@interface JCModel_WaterConsumptionCardWaterCardChangeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardWaterCardChangeList

@synthesize staffCardId = _staffCardId;
@synthesize num = _num;
@synthesize item = _item;
@synthesize cusCardId = _cusCardId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.staffCardId = [self objectOrNilForKey:kJCModel_WaterConsumptionCardWaterCardChangeListStaffCardId fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardWaterCardChangeListNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardWaterCardChangeListItem fromDictionary:dict] doubleValue];
            self.cusCardId = [self objectOrNilForKey:kJCModel_WaterConsumptionCardWaterCardChangeListCusCardId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.staffCardId forKey:kJCModel_WaterConsumptionCardWaterCardChangeListStaffCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_WaterConsumptionCardWaterCardChangeListNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_WaterConsumptionCardWaterCardChangeListItem];
    [mutableDict setValue:self.cusCardId forKey:kJCModel_WaterConsumptionCardWaterCardChangeListCusCardId];

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

    self.staffCardId = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardWaterCardChangeListStaffCardId];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardWaterCardChangeListNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardWaterCardChangeListItem];
    self.cusCardId = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardWaterCardChangeListCusCardId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_staffCardId forKey:kJCModel_WaterConsumptionCardWaterCardChangeListStaffCardId];
    [aCoder encodeDouble:_num forKey:kJCModel_WaterConsumptionCardWaterCardChangeListNum];
    [aCoder encodeDouble:_item forKey:kJCModel_WaterConsumptionCardWaterCardChangeListItem];
    [aCoder encodeObject:_cusCardId forKey:kJCModel_WaterConsumptionCardWaterCardChangeListCusCardId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardWaterCardChangeList *copy = [[JCModel_WaterConsumptionCardWaterCardChangeList alloc] init];
    
    
    
    if (copy) {

        copy.staffCardId = [self.staffCardId copyWithZone:zone];
        copy.num = self.num;
        copy.item = self.item;
        copy.cusCardId = [self.cusCardId copyWithZone:zone];
    }
    
    return copy;
}


@end
