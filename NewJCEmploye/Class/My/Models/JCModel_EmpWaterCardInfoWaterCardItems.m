//
//  JCModel_EmpWaterCardInfoWaterCardItems.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpWaterCardInfoWaterCardItems.h"


NSString *const kJCModel_EmpWaterCardInfoWaterCardItemsNum = @"num";
NSString *const kJCModel_EmpWaterCardInfoWaterCardItemsId = @"id";
NSString *const kJCModel_EmpWaterCardInfoWaterCardItemsItemName = @"itemName";
NSString *const kJCModel_EmpWaterCardInfoWaterCardItemsItem = @"item";
NSString *const kJCModel_EmpWaterCardInfoWaterCardItemsUnit = @"unit";


@interface JCModel_EmpWaterCardInfoWaterCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpWaterCardInfoWaterCardItems

@synthesize num = _num;
@synthesize waterCardItemsIdentifier = _waterCardItemsIdentifier;
@synthesize itemName = _itemName;
@synthesize item = _item;
@synthesize unit = _unit;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_EmpWaterCardInfoWaterCardItemsNum fromDictionary:dict] doubleValue];
            self.waterCardItemsIdentifier = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoWaterCardItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoWaterCardItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_EmpWaterCardInfoWaterCardItemsItem fromDictionary:dict] doubleValue];
            self.unit = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoWaterCardItemsUnit fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_EmpWaterCardInfoWaterCardItemsNum];
    [mutableDict setValue:self.waterCardItemsIdentifier forKey:kJCModel_EmpWaterCardInfoWaterCardItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_EmpWaterCardInfoWaterCardItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_EmpWaterCardInfoWaterCardItemsItem];
    [mutableDict setValue:self.unit forKey:kJCModel_EmpWaterCardInfoWaterCardItemsUnit];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_EmpWaterCardInfoWaterCardItemsNum];
    self.waterCardItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoWaterCardItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoWaterCardItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_EmpWaterCardInfoWaterCardItemsItem];
    self.unit = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoWaterCardItemsUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_EmpWaterCardInfoWaterCardItemsNum];
    [aCoder encodeObject:_waterCardItemsIdentifier forKey:kJCModel_EmpWaterCardInfoWaterCardItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_EmpWaterCardInfoWaterCardItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_EmpWaterCardInfoWaterCardItemsItem];
    [aCoder encodeObject:_unit forKey:kJCModel_EmpWaterCardInfoWaterCardItemsUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpWaterCardInfoWaterCardItems *copy = [[JCModel_EmpWaterCardInfoWaterCardItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.waterCardItemsIdentifier = [self.waterCardItemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
        copy.unit = [self.unit copyWithZone:zone];
    }
    
    return copy;
}


@end
