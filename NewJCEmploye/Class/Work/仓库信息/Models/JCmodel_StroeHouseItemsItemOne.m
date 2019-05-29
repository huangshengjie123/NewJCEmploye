//
//  JCmodel_StroeHouseItemsItemOne.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsItemOne.h"
#import "JCmodel_StroeHouseItemsItemsList.h"


NSString *const kJCmodel_StroeHouseItemsItemOneUnit = @"unit";
NSString *const kJCmodel_StroeHouseItemsItemOneId = @"id";
NSString *const kJCmodel_StroeHouseItemsItemOnePrice = @"price";
NSString *const kJCmodel_StroeHouseItemsItemOneItemsList = @"itemsList";
NSString *const kJCmodel_StroeHouseItemsItemOneDescription = @"description";
NSString *const kJCmodel_StroeHouseItemsItemOneType = @"type";
NSString *const kJCmodel_StroeHouseItemsItemOneName = @"name";


@interface JCmodel_StroeHouseItemsItemOne ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsItemOne

@synthesize unit = _unit;
@synthesize itemOneIdentifier = _itemOneIdentifier;
@synthesize price = _price;
@synthesize itemsList = _itemsList;
@synthesize itemOneDescription = _itemOneDescription;
@synthesize type = _type;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.unit = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOneUnit fromDictionary:dict] doubleValue];
            self.itemOneIdentifier = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOneId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOnePrice fromDictionary:dict] doubleValue];
    NSObject *receivedJCmodel_StroeHouseItemsItemsList = [dict objectForKey:kJCmodel_StroeHouseItemsItemOneItemsList];
    NSMutableArray *parsedJCmodel_StroeHouseItemsItemsList = [NSMutableArray array];
    
    if ([receivedJCmodel_StroeHouseItemsItemsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCmodel_StroeHouseItemsItemsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCmodel_StroeHouseItemsItemsList addObject:[JCmodel_StroeHouseItemsItemsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCmodel_StroeHouseItemsItemsList isKindOfClass:[NSDictionary class]]) {
       [parsedJCmodel_StroeHouseItemsItemsList addObject:[JCmodel_StroeHouseItemsItemsList modelObjectWithDictionary:(NSDictionary *)receivedJCmodel_StroeHouseItemsItemsList]];
    }

    self.itemsList = [NSArray arrayWithArray:parsedJCmodel_StroeHouseItemsItemsList];
            self.itemOneDescription = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOneDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOneType fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemOneName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCmodel_StroeHouseItemsItemOneUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemOneIdentifier] forKey:kJCmodel_StroeHouseItemsItemOneId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCmodel_StroeHouseItemsItemOnePrice];
    NSMutableArray *tempArrayForItemsList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.itemsList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemsList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemsList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemsList] forKey:kJCmodel_StroeHouseItemsItemOneItemsList];
    [mutableDict setValue:self.itemOneDescription forKey:kJCmodel_StroeHouseItemsItemOneDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCmodel_StroeHouseItemsItemOneType];
    [mutableDict setValue:self.name forKey:kJCmodel_StroeHouseItemsItemOneName];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemOneUnit];
    self.itemOneIdentifier = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemOneId];
    self.price = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemOnePrice];
    self.itemsList = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemOneItemsList];
    self.itemOneDescription = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemOneDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemOneType];
    self.name = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemOneName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCmodel_StroeHouseItemsItemOneUnit];
    [aCoder encodeDouble:_itemOneIdentifier forKey:kJCmodel_StroeHouseItemsItemOneId];
    [aCoder encodeDouble:_price forKey:kJCmodel_StroeHouseItemsItemOnePrice];
    [aCoder encodeObject:_itemsList forKey:kJCmodel_StroeHouseItemsItemOneItemsList];
    [aCoder encodeObject:_itemOneDescription forKey:kJCmodel_StroeHouseItemsItemOneDescription];
    [aCoder encodeDouble:_type forKey:kJCmodel_StroeHouseItemsItemOneType];
    [aCoder encodeObject:_name forKey:kJCmodel_StroeHouseItemsItemOneName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsItemOne *copy = [[JCmodel_StroeHouseItemsItemOne alloc] init];
    
    
    
    if (copy) {

        copy.unit = self.unit;
        copy.itemOneIdentifier = self.itemOneIdentifier;
        copy.price = self.price;
        copy.itemsList = [self.itemsList copyWithZone:zone];
        copy.itemOneDescription = [self.itemOneDescription copyWithZone:zone];
        copy.type = self.type;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
