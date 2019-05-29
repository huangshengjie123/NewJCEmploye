//
//  JCModel_NewDistributionCarDetailsItems.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsItems.h"


NSString *const kJCModel_NewDistributionCarDetailsItemsNum = @"num";
NSString *const kJCModel_NewDistributionCarDetailsItemsId = @"id";
NSString *const kJCModel_NewDistributionCarDetailsItemsItemName = @"itemName";
NSString *const kJCModel_NewDistributionCarDetailsItemsItem = @"item";


@interface JCModel_NewDistributionCarDetailsItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsItems

@synthesize num = _num;
@synthesize itemsIdentifier = _itemsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_NewDistributionCarDetailsItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_NewDistributionCarDetailsItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_NewDistributionCarDetailsItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_NewDistributionCarDetailsItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_NewDistributionCarDetailsItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_NewDistributionCarDetailsItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_NewDistributionCarDetailsItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_NewDistributionCarDetailsItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsItems *copy = [[JCModel_NewDistributionCarDetailsItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
