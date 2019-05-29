//
//  JCModel_ItemsClassifyData.m
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsClassifyData.h"


NSString *const kJCModel_ItemsClassifyDataUnit = @"unit";
NSString *const kJCModel_ItemsClassifyDataId = @"id";
NSString *const kJCModel_ItemsClassifyDataPrice = @"price";
NSString *const kJCModel_ItemsClassifyDataItemsList = @"itemsList";
NSString *const kJCModel_ItemsClassifyDataDescription = @"description";
NSString *const kJCModel_ItemsClassifyDataType = @"type";
NSString *const kJCModel_ItemsClassifyDataName = @"name";


@interface JCModel_ItemsClassifyData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsClassifyData

@synthesize unit = _unit;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize price = _price;
@synthesize itemsList = _itemsList;
@synthesize dataDescription = _dataDescription;
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
            self.unit = [[self objectOrNilForKey:kJCModel_ItemsClassifyDataUnit fromDictionary:dict] doubleValue];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_ItemsClassifyDataId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kJCModel_ItemsClassifyDataPrice fromDictionary:dict] doubleValue];
            self.itemsList = [self objectOrNilForKey:kJCModel_ItemsClassifyDataItemsList fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kJCModel_ItemsClassifyDataDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_ItemsClassifyDataType fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ItemsClassifyDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_ItemsClassifyDataUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_ItemsClassifyDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCModel_ItemsClassifyDataPrice];
    [mutableDict setValue:self.itemsList forKey:kJCModel_ItemsClassifyDataItemsList];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_ItemsClassifyDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_ItemsClassifyDataType];
    [mutableDict setValue:self.name forKey:kJCModel_ItemsClassifyDataName];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCModel_ItemsClassifyDataUnit];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ItemsClassifyDataId];
    self.price = [aDecoder decodeDoubleForKey:kJCModel_ItemsClassifyDataPrice];
    self.itemsList = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyDataItemsList];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyDataDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_ItemsClassifyDataType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCModel_ItemsClassifyDataUnit];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_ItemsClassifyDataId];
    [aCoder encodeDouble:_price forKey:kJCModel_ItemsClassifyDataPrice];
    [aCoder encodeObject:_itemsList forKey:kJCModel_ItemsClassifyDataItemsList];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_ItemsClassifyDataDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_ItemsClassifyDataType];
    [aCoder encodeObject:_name forKey:kJCModel_ItemsClassifyDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsClassifyData *copy = [[JCModel_ItemsClassifyData alloc] init];
    
    
    
    if (copy) {

        copy.unit = self.unit;
        copy.dataIdentifier = self.dataIdentifier;
        copy.price = self.price;
        copy.itemsList = [self.itemsList copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.type = self.type;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
