//
//  JCModel_NewDostribution1Items.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1Items.h"


NSString *const kJCModel_NewDostribution1ItemsNum = @"num";
NSString *const kJCModel_NewDostribution1ItemsId = @"id";
NSString *const kJCModel_NewDostribution1ItemsItemName = @"itemName";
NSString *const kJCModel_NewDostribution1ItemsItem = @"item";


@interface JCModel_NewDostribution1Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1Items

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
            self.num = [[self objectOrNilForKey:kJCModel_NewDostribution1ItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_NewDostribution1ItemsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_NewDostribution1ItemsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_NewDostribution1ItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_NewDostribution1ItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_NewDostribution1ItemsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_NewDostribution1ItemsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_NewDostribution1ItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ItemsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ItemsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_NewDostribution1ItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_NewDostribution1ItemsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_NewDostribution1ItemsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_NewDostribution1ItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1Items *copy = [[JCModel_NewDostribution1Items alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
