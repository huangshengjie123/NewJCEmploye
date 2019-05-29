//
//  JCModel_WaterCardDetailsWaterCardItems.m
//
//  Created by   on 2018/7/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardDetailsWaterCardItems.h"


NSString *const kJCModel_WaterCardDetailsWaterCardItemsNum = @"num";
NSString *const kJCModel_WaterCardDetailsWaterCardItemsId = @"id";
NSString *const kJCModel_WaterCardDetailsWaterCardItemsItemName = @"itemName";
NSString *const kJCModel_WaterCardDetailsWaterCardItemsItem = @"item";


@interface JCModel_WaterCardDetailsWaterCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardDetailsWaterCardItems

@synthesize num = _num;
@synthesize waterCardItemsIdentifier = _waterCardItemsIdentifier;
@synthesize itemName = _itemName;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_WaterCardDetailsWaterCardItemsNum fromDictionary:dict] doubleValue];
            self.waterCardItemsIdentifier = [self objectOrNilForKey:kJCModel_WaterCardDetailsWaterCardItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_WaterCardDetailsWaterCardItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_WaterCardDetailsWaterCardItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_WaterCardDetailsWaterCardItemsNum];
    [mutableDict setValue:self.waterCardItemsIdentifier forKey:kJCModel_WaterCardDetailsWaterCardItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_WaterCardDetailsWaterCardItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_WaterCardDetailsWaterCardItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsWaterCardItemsNum];
    self.waterCardItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsWaterCardItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsWaterCardItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsWaterCardItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_WaterCardDetailsWaterCardItemsNum];
    [aCoder encodeObject:_waterCardItemsIdentifier forKey:kJCModel_WaterCardDetailsWaterCardItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_WaterCardDetailsWaterCardItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_WaterCardDetailsWaterCardItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardDetailsWaterCardItems *copy = [[JCModel_WaterCardDetailsWaterCardItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.waterCardItemsIdentifier = [self.waterCardItemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
