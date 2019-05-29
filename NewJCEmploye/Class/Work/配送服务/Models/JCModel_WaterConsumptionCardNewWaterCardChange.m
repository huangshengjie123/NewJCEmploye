//
//  JCModel_WaterConsumptionCardNewWaterCardChange.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardNewWaterCardChange.h"


NSString *const kJCModel_WaterConsumptionCardNewWaterCardChangeStaffCardId = @"staffCardId";
NSString *const kJCModel_WaterConsumptionCardNewWaterCardChangeNum = @"num";
NSString *const kJCModel_WaterConsumptionCardNewWaterCardChangeCusCardId = @"cusCardId";
NSString *const kJCModel_WaterConsumptionCardNewWaterCardChangeItem = @"item";


@interface JCModel_WaterConsumptionCardNewWaterCardChange ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardNewWaterCardChange

@synthesize staffCardId = _staffCardId;
@synthesize num = _num;
@synthesize cusCardId = _cusCardId;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.staffCardId = [self objectOrNilForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeStaffCardId fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeNum fromDictionary:dict] doubleValue];
            self.cusCardId = [self objectOrNilForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeCusCardId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.staffCardId forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeStaffCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeNum];
    [mutableDict setValue:self.cusCardId forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeCusCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeItem];

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

    self.staffCardId = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeStaffCardId];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeNum];
    self.cusCardId = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeCusCardId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardNewWaterCardChangeItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_staffCardId forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeStaffCardId];
    [aCoder encodeDouble:_num forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeNum];
    [aCoder encodeObject:_cusCardId forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeCusCardId];
    [aCoder encodeDouble:_item forKey:kJCModel_WaterConsumptionCardNewWaterCardChangeItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardNewWaterCardChange *copy = [[JCModel_WaterConsumptionCardNewWaterCardChange alloc] init];
    
    
    
    if (copy) {

        copy.staffCardId = [self.staffCardId copyWithZone:zone];
        copy.num = self.num;
        copy.cusCardId = [self.cusCardId copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
