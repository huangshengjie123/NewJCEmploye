//
//  JCModel_searchDetailsOutputFItems.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFItems.h"


NSString *const kJCModel_searchDetailsOutputFItemsNum = @"num";
NSString *const kJCModel_searchDetailsOutputFItemsId = @"id";
NSString *const kJCModel_searchDetailsOutputFItemsItem = @"item";
NSString *const kJCModel_searchDetailsOutputFItemsName = @"name";
NSString *const kJCModel_searchDetailsOutputFItemsUnit = @"unit";


@interface JCModel_searchDetailsOutputFItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFItems

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
            self.num = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_searchDetailsOutputFItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_searchDetailsOutputFItemsName fromDictionary:dict];
            self.unit = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFItemsUnit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_searchDetailsOutputFItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_searchDetailsOutputFItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_searchDetailsOutputFItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_searchDetailsOutputFItemsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_searchDetailsOutputFItemsUnit];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFItemsName];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFItemsUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_searchDetailsOutputFItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_searchDetailsOutputFItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_searchDetailsOutputFItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_searchDetailsOutputFItemsName];
    [aCoder encodeDouble:_unit forKey:kJCModel_searchDetailsOutputFItemsUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFItems *copy = [[JCModel_searchDetailsOutputFItems alloc] init];
    
    
    
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
