//
//  JCModel_CusWaterInfoWaterCardItems.m
//
//  Created by   on 2018/8/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CusWaterInfoWaterCardItems.h"


NSString *const kJCModel_CusWaterInfoWaterCardItemsNum = @"num";
NSString *const kJCModel_CusWaterInfoWaterCardItemsId = @"id";
NSString *const kJCModel_CusWaterInfoWaterCardItemsItemName = @"itemName";
NSString *const kJCModel_CusWaterInfoWaterCardItemsItem = @"item";


@interface JCModel_CusWaterInfoWaterCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CusWaterInfoWaterCardItems

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
            self.num = [[self objectOrNilForKey:kJCModel_CusWaterInfoWaterCardItemsNum fromDictionary:dict] doubleValue];
            self.waterCardItemsIdentifier = [self objectOrNilForKey:kJCModel_CusWaterInfoWaterCardItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_CusWaterInfoWaterCardItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_CusWaterInfoWaterCardItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_CusWaterInfoWaterCardItemsNum];
    [mutableDict setValue:self.waterCardItemsIdentifier forKey:kJCModel_CusWaterInfoWaterCardItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_CusWaterInfoWaterCardItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_CusWaterInfoWaterCardItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoWaterCardItemsNum];
    self.waterCardItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoWaterCardItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoWaterCardItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoWaterCardItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_CusWaterInfoWaterCardItemsNum];
    [aCoder encodeObject:_waterCardItemsIdentifier forKey:kJCModel_CusWaterInfoWaterCardItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_CusWaterInfoWaterCardItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_CusWaterInfoWaterCardItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CusWaterInfoWaterCardItems *copy = [[JCModel_CusWaterInfoWaterCardItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.waterCardItemsIdentifier = [self.waterCardItemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
