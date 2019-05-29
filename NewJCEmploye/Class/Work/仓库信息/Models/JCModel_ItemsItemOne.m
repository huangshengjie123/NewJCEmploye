//
//  JCModel_ItemsItemOne.m
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsItemOne.h"


NSString *const kJCModel_ItemsItemOneUnit = @"unit";
NSString *const kJCModel_ItemsItemOneId = @"id";
NSString *const kJCModel_ItemsItemOnePrice = @"price";
NSString *const kJCModel_ItemsItemOneItemsList = @"itemsList";
NSString *const kJCModel_ItemsItemOneDescription = @"description";
NSString *const kJCModel_ItemsItemOneType = @"type";
NSString *const kJCModel_ItemsItemOneName = @"name";


@interface JCModel_ItemsItemOne ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsItemOne

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
            self.unit = [[self objectOrNilForKey:kJCModel_ItemsItemOneUnit fromDictionary:dict] doubleValue];
            self.itemOneIdentifier = [[self objectOrNilForKey:kJCModel_ItemsItemOneId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kJCModel_ItemsItemOnePrice fromDictionary:dict] doubleValue];
            self.itemsList = [self objectOrNilForKey:kJCModel_ItemsItemOneItemsList fromDictionary:dict];
            self.itemOneDescription = [self objectOrNilForKey:kJCModel_ItemsItemOneDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_ItemsItemOneType fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ItemsItemOneName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_ItemsItemOneUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemOneIdentifier] forKey:kJCModel_ItemsItemOneId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCModel_ItemsItemOnePrice];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemsList] forKey:kJCModel_ItemsItemOneItemsList];
    [mutableDict setValue:self.itemOneDescription forKey:kJCModel_ItemsItemOneDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_ItemsItemOneType];
    [mutableDict setValue:self.name forKey:kJCModel_ItemsItemOneName];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemOneUnit];
    self.itemOneIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemOneId];
    self.price = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemOnePrice];
    self.itemsList = [aDecoder decodeObjectForKey:kJCModel_ItemsItemOneItemsList];
    self.itemOneDescription = [aDecoder decodeObjectForKey:kJCModel_ItemsItemOneDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemOneType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ItemsItemOneName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCModel_ItemsItemOneUnit];
    [aCoder encodeDouble:_itemOneIdentifier forKey:kJCModel_ItemsItemOneId];
    [aCoder encodeDouble:_price forKey:kJCModel_ItemsItemOnePrice];
    [aCoder encodeObject:_itemsList forKey:kJCModel_ItemsItemOneItemsList];
    [aCoder encodeObject:_itemOneDescription forKey:kJCModel_ItemsItemOneDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_ItemsItemOneType];
    [aCoder encodeObject:_name forKey:kJCModel_ItemsItemOneName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsItemOne *copy = [[JCModel_ItemsItemOne alloc] init];
    
    
    
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
