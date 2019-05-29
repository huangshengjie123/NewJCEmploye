//
//  JCModel_recyclingData.m
//
//  Created by   on 2019/1/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_recyclingData.h"


NSString *const kJCModel_recyclingDataNum = @"num";
NSString *const kJCModel_recyclingDataId = @"id";
NSString *const kJCModel_recyclingDataItemName = @"itemName";
NSString *const kJCModel_recyclingDataItem = @"item";
NSString *const kJCModel_recyclingDataUnit = @"unit";
NSString *const kJCModel_recyclingDataState = @"state";


@interface JCModel_recyclingData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_recyclingData

@synthesize num = _num;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize itemName = _itemName;
@synthesize item = _item;
@synthesize unit = _unit;
@synthesize state = _state;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_recyclingDataNum fromDictionary:dict] doubleValue];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_recyclingDataId fromDictionary:dict] doubleValue];
            self.itemName = [self objectOrNilForKey:kJCModel_recyclingDataItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_recyclingDataItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_recyclingDataUnit fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kJCModel_recyclingDataState fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_recyclingDataNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_recyclingDataId];
    [mutableDict setValue:self.itemName forKey:kJCModel_recyclingDataItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_recyclingDataItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_recyclingDataUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kJCModel_recyclingDataState];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_recyclingDataNum];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_recyclingDataId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_recyclingDataItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_recyclingDataItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_recyclingDataUnit];
    self.state = [aDecoder decodeDoubleForKey:kJCModel_recyclingDataState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_recyclingDataNum];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_recyclingDataId];
    [aCoder encodeObject:_itemName forKey:kJCModel_recyclingDataItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_recyclingDataItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_recyclingDataUnit];
    [aCoder encodeDouble:_state forKey:kJCModel_recyclingDataState];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_recyclingData *copy = [[JCModel_recyclingData alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.dataIdentifier = self.dataIdentifier;
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
        copy.state = self.state;
    }
    
    return copy;
}


@end
