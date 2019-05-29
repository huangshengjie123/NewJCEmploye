//
//  JCModel_WaterCardWaterCardItems.m
//
//  Created by   on 2018/6/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardWaterCardItems.h"


NSString *const kJCModel_WaterCardWaterCardItemsId = @"id";
NSString *const kJCModel_WaterCardWaterCardItemsNum = @"num";
NSString *const kJCModel_WaterCardWaterCardItemsItemName = @"itemName";
NSString *const kJCModel_WaterCardWaterCardItemsItem = @"item";


@interface JCModel_WaterCardWaterCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardWaterCardItems

@synthesize waterCardItemsIdentifier = _waterCardItemsIdentifier;
@synthesize num = _num;
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
            self.waterCardItemsIdentifier = [self objectOrNilForKey:kJCModel_WaterCardWaterCardItemsId fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WaterCardWaterCardItemsNum fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_WaterCardWaterCardItemsItemName fromDictionary:dict];
            self.item = [self objectOrNilForKey:kJCModel_WaterCardWaterCardItemsItem fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardItemsIdentifier forKey:kJCModel_WaterCardWaterCardItemsId];
    [mutableDict setValue:self.num forKey:kJCModel_WaterCardWaterCardItemsNum];
    [mutableDict setValue:self.itemName forKey:kJCModel_WaterCardWaterCardItemsItemName];
    [mutableDict setValue:self.item forKey:kJCModel_WaterCardWaterCardItemsItem];

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

    self.waterCardItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardItemsId];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardItemsNum];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardItemsItemName];
    self.item = [aDecoder decodeObjectForKey:kJCModel_WaterCardWaterCardItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardItemsIdentifier forKey:kJCModel_WaterCardWaterCardItemsId];
    [aCoder encodeObject:_num forKey:kJCModel_WaterCardWaterCardItemsNum];
    [aCoder encodeObject:_itemName forKey:kJCModel_WaterCardWaterCardItemsItemName];
    [aCoder encodeObject:_item forKey:kJCModel_WaterCardWaterCardItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardWaterCardItems *copy = [[JCModel_WaterCardWaterCardItems alloc] init];
    
    
    
    if (copy) {

        copy.waterCardItemsIdentifier = [self.waterCardItemsIdentifier copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = [self.item copyWithZone:zone];
    }
    
    return copy;
}


@end
