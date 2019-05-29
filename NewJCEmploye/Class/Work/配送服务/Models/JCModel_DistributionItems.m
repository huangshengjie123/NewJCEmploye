//
//  JCModel_DistributionItems.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionItems.h"


NSString *const kJCModel_DistributionItemsNum = @"num";
NSString *const kJCModel_DistributionItemsId = @"id";
NSString *const kJCModel_DistributionItemsItemName = @"itemName";
NSString *const kJCModel_DistributionItemsItem = @"item";


@interface JCModel_DistributionItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionItems

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
            self.num = [[self objectOrNilForKey:kJCModel_DistributionItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_DistributionItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_DistributionItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_DistributionItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_DistributionItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_DistributionItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_DistributionItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_DistributionItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_DistributionItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_DistributionItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_DistributionItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_DistributionItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_DistributionItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_DistributionItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_DistributionItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_DistributionItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionItems *copy = [[JCModel_DistributionItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
