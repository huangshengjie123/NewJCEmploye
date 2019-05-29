//
//  JCModel_MyWaterCardInformationWaterCardItems.m
//
//  Created by   on 2018/7/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyWaterCardInformationWaterCardItems.h"


NSString *const kJCModel_MyWaterCardInformationWaterCardItemsNum = @"num";
NSString *const kJCModel_MyWaterCardInformationWaterCardItemsId = @"id";
NSString *const kJCModel_MyWaterCardInformationWaterCardItemsItemName = @"itemName";
NSString *const kJCModel_MyWaterCardInformationWaterCardItemsItem = @"item";


@interface JCModel_MyWaterCardInformationWaterCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyWaterCardInformationWaterCardItems

@synthesize num = _num;
@synthesize waterCardItemsIdentifier = _waterCardItemsIdentifier;
@synthesize itemName = _itemName;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.num = [[self objectOrNilForKey:kJCModel_MyWaterCardInformationWaterCardItemsNum fromDictionary:dict] doubleValue];
        self.waterCardItemsIdentifier = [self objectOrNilForKey:kJCModel_MyWaterCardInformationWaterCardItemsId fromDictionary:dict];
        self.itemName = [self objectOrNilForKey:kJCModel_MyWaterCardInformationWaterCardItemsItemName fromDictionary:dict];
        self.item = [[self objectOrNilForKey:kJCModel_MyWaterCardInformationWaterCardItemsItem fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_MyWaterCardInformationWaterCardItemsNum];
    [mutableDict setValue:self.waterCardItemsIdentifier forKey:kJCModel_MyWaterCardInformationWaterCardItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_MyWaterCardInformationWaterCardItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_MyWaterCardInformationWaterCardItemsItem];

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
    self.num = [aDecoder decodeDoubleForKey:kJCModel_MyWaterCardInformationWaterCardItemsNum];
    self.waterCardItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationWaterCardItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationWaterCardItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_MyWaterCardInformationWaterCardItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_MyWaterCardInformationWaterCardItemsNum];
    [aCoder encodeObject:_waterCardItemsIdentifier forKey:kJCModel_MyWaterCardInformationWaterCardItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_MyWaterCardInformationWaterCardItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_MyWaterCardInformationWaterCardItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_MyWaterCardInformationWaterCardItems *copy = [[JCModel_MyWaterCardInformationWaterCardItems alloc] init];
    if (copy)
    {
        copy.num = self.num;
        copy.waterCardItemsIdentifier = [self.waterCardItemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
