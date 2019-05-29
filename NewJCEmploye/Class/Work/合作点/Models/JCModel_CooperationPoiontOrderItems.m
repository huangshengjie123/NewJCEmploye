//
//  JCModel_CooperationPoiontOrderItems.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderItems.h"


NSString *const kJCModel_CooperationPoiontOrderItemsNum = @"num";
NSString *const kJCModel_CooperationPoiontOrderItemsId = @"id";
NSString *const kJCModel_CooperationPoiontOrderItemsItem = @"item";
NSString *const kJCModel_CooperationPoiontOrderItemsUnit = @"unit";
NSString *const kJCModel_CooperationPoiontOrderItemsName = @"name";


@interface JCModel_CooperationPoiontOrderItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderItems

@synthesize num = _num;
@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize item = _item;
@synthesize unit = _unit;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderItemsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderItemsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderItemsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_CooperationPoiontOrderItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_CooperationPoiontOrderItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_CooperationPoiontOrderItemsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_CooperationPoiontOrderItemsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_CooperationPoiontOrderItemsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderItemsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderItemsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderItemsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_CooperationPoiontOrderItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_CooperationPoiontOrderItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_CooperationPoiontOrderItemsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_CooperationPoiontOrderItemsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_CooperationPoiontOrderItemsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderItems *copy = [[JCModel_CooperationPoiontOrderItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
