//
//  JCModel_ReturnVisitItems.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitItems.h"


NSString *const kJCModel_ReturnVisitItemsNum = @"num";
NSString *const kJCModel_ReturnVisitItemsId = @"id";
NSString *const kJCModel_ReturnVisitItemsItem = @"item";
NSString *const kJCModel_ReturnVisitItemsName = @"name";
NSString *const kJCModel_ReturnVisitItemsUnit = @"unit";


@interface JCModel_ReturnVisitItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitItems

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
            self.num = [[self objectOrNilForKey:kJCModel_ReturnVisitItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_ReturnVisitItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_ReturnVisitItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ReturnVisitItemsName fromDictionary:dict];
            self.unit = [[self objectOrNilForKey:kJCModel_ReturnVisitItemsUnit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_ReturnVisitItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_ReturnVisitItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_ReturnVisitItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_ReturnVisitItemsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_ReturnVisitItemsUnit];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitItemsName];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitItemsUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_ReturnVisitItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_ReturnVisitItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_ReturnVisitItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_ReturnVisitItemsName];
    [aCoder encodeDouble:_unit forKey:kJCModel_ReturnVisitItemsUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitItems *copy = [[JCModel_ReturnVisitItems alloc] init];
    
    
    
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
