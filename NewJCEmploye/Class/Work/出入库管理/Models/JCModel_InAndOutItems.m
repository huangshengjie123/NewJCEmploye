//
//  JCModel_InAndOutItems.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutItems.h"


NSString *const kJCModel_InAndOutItemsNum = @"num";
NSString *const kJCModel_InAndOutItemsId = @"id";
NSString *const kJCModel_InAndOutItemsItem = @"item";
NSString *const kJCModel_InAndOutItemsName = @"name";
NSString *const kJCModel_InAndOutItemsUnit = @"unit";


@interface JCModel_InAndOutItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutItems

@synthesize num = _num;
@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize item = _item;
@synthesize name = _name;
@synthesize unit = _unit;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_InAndOutItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_InAndOutItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_InAndOutItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_InAndOutItemsName fromDictionary:dict];
            self.unit = [[self objectOrNilForKey:kJCModel_InAndOutItemsUnit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_InAndOutItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_InAndOutItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_InAndOutItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_InAndOutItemsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_InAndOutItemsUnit];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_InAndOutItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_InAndOutItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_InAndOutItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_InAndOutItemsName];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_InAndOutItemsUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_InAndOutItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_InAndOutItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_InAndOutItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_InAndOutItemsName];
    [aCoder encodeDouble:_unit forKey:kJCModel_InAndOutItemsUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutItems *copy = [[JCModel_InAndOutItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
        copy.unit = self.unit;
    }
    
    return copy;
}


@end
