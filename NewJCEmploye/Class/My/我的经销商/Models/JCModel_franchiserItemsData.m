//
//  JCModel_franchiserItemsData.m
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserItemsData.h"


NSString *const kJCModel_franchiserItemsDataName = @"name";
NSString *const kJCModel_franchiserItemsDataNum = @"num";
NSString *const kJCModel_franchiserItemsDataId = @"id";
NSString *const kJCModel_franchiserItemsDataType = @"type";
NSString *const kJCModel_franchiserItemsDataPrice = @"price";
NSString *const kJCModel_franchiserItemsDataItem = @"item";


@interface JCModel_franchiserItemsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserItemsData

@synthesize name = _name;
@synthesize num = _num;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize type = _type;
@synthesize price = _price;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kJCModel_franchiserItemsDataName fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_franchiserItemsDataNum fromDictionary:dict] doubleValue];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_franchiserItemsDataId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_franchiserItemsDataType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kJCModel_franchiserItemsDataPrice fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_franchiserItemsDataItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kJCModel_franchiserItemsDataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_franchiserItemsDataNum];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_franchiserItemsDataId];
    [mutableDict setValue:self.type forKey:kJCModel_franchiserItemsDataType];
    [mutableDict setValue:self.price forKey:kJCModel_franchiserItemsDataPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_franchiserItemsDataItem];

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

    self.name = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsDataName];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_franchiserItemsDataNum];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsDataId];
    self.type = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsDataType];
    self.price = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsDataPrice];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_franchiserItemsDataItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kJCModel_franchiserItemsDataName];
    [aCoder encodeDouble:_num forKey:kJCModel_franchiserItemsDataNum];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_franchiserItemsDataId];
    [aCoder encodeObject:_type forKey:kJCModel_franchiserItemsDataType];
    [aCoder encodeObject:_price forKey:kJCModel_franchiserItemsDataPrice];
    [aCoder encodeDouble:_item forKey:kJCModel_franchiserItemsDataItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserItemsData *copy = [[JCModel_franchiserItemsData alloc] init];
    
    
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.num = self.num;
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
