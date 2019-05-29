//
//  JCModel_GetItemPriceData.m
//
//  Created by   on 2018/11/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetItemPriceData.h"
#import "JCModel_GetItemPriceItemsList.h"


NSString *const kJCModel_GetItemPriceDataUnit = @"unit";
NSString *const kJCModel_GetItemPriceDataPriceFrK = @"priceFrK";
NSString *const kJCModel_GetItemPriceDataPriceFra = @"priceFra";
NSString *const kJCModel_GetItemPriceDataId = @"id";
NSString *const kJCModel_GetItemPriceDataPrice = @"price";
NSString *const kJCModel_GetItemPriceDataItemsList = @"itemsList";
NSString *const kJCModel_GetItemPriceDataDescription = @"description";
NSString *const kJCModel_GetItemPriceDataType = @"type";
NSString *const kJCModel_GetItemPriceDataName = @"name";
NSString *const kJCModel_GetItemPriceDataPriceCoo = @"priceCoo";


@interface JCModel_GetItemPriceData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetItemPriceData

@synthesize unit = _unit;
@synthesize priceFrK = _priceFrK;
@synthesize priceFra = _priceFra;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize price = _price;
@synthesize itemsList = _itemsList;
@synthesize dataDescription = _dataDescription;
@synthesize type = _type;
@synthesize name = _name;
@synthesize priceCoo = _priceCoo;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.unit = [[self objectOrNilForKey:kJCModel_GetItemPriceDataUnit fromDictionary:dict] doubleValue];
            self.priceFrK = [[self objectOrNilForKey:kJCModel_GetItemPriceDataPriceFrK fromDictionary:dict] doubleValue];
            self.priceFra = [[self objectOrNilForKey:kJCModel_GetItemPriceDataPriceFra fromDictionary:dict] doubleValue];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_GetItemPriceDataId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kJCModel_GetItemPriceDataPrice fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_GetItemPriceItemsList = [dict objectForKey:kJCModel_GetItemPriceDataItemsList];
    NSMutableArray *parsedJCModel_GetItemPriceItemsList = [NSMutableArray array];
    
    if ([receivedJCModel_GetItemPriceItemsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GetItemPriceItemsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GetItemPriceItemsList addObject:[JCModel_GetItemPriceItemsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GetItemPriceItemsList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GetItemPriceItemsList addObject:[JCModel_GetItemPriceItemsList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GetItemPriceItemsList]];
    }

    self.itemsList = [NSArray arrayWithArray:parsedJCModel_GetItemPriceItemsList];
            self.dataDescription = [self objectOrNilForKey:kJCModel_GetItemPriceDataDescription fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_GetItemPriceDataType fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_GetItemPriceDataName fromDictionary:dict];
            self.priceCoo = [[self objectOrNilForKey:kJCModel_GetItemPriceDataPriceCoo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_GetItemPriceDataUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceFrK] forKey:kJCModel_GetItemPriceDataPriceFrK];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceFra] forKey:kJCModel_GetItemPriceDataPriceFra];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_GetItemPriceDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCModel_GetItemPriceDataPrice];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemsList] forKey:kJCModel_GetItemPriceDataItemsList];
    [mutableDict setValue:self.dataDescription forKey:kJCModel_GetItemPriceDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_GetItemPriceDataType];
    [mutableDict setValue:self.name forKey:kJCModel_GetItemPriceDataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceCoo] forKey:kJCModel_GetItemPriceDataPriceCoo];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataUnit];
    self.priceFrK = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataPriceFrK];
    self.priceFra = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataPriceFra];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataId];
    self.price = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataPrice];
    self.itemsList = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceDataItemsList];
    self.dataDescription = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceDataDescription];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceDataName];
    self.priceCoo = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceDataPriceCoo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCModel_GetItemPriceDataUnit];
    [aCoder encodeDouble:_priceFrK forKey:kJCModel_GetItemPriceDataPriceFrK];
    [aCoder encodeDouble:_priceFra forKey:kJCModel_GetItemPriceDataPriceFra];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_GetItemPriceDataId];
    [aCoder encodeDouble:_price forKey:kJCModel_GetItemPriceDataPrice];
    [aCoder encodeObject:_itemsList forKey:kJCModel_GetItemPriceDataItemsList];
    [aCoder encodeObject:_dataDescription forKey:kJCModel_GetItemPriceDataDescription];
    [aCoder encodeDouble:_type forKey:kJCModel_GetItemPriceDataType];
    [aCoder encodeObject:_name forKey:kJCModel_GetItemPriceDataName];
    [aCoder encodeDouble:_priceCoo forKey:kJCModel_GetItemPriceDataPriceCoo];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetItemPriceData *copy = [[JCModel_GetItemPriceData alloc] init];
    
    
    
    if (copy) {

        copy.unit = self.unit;
        copy.priceFrK = self.priceFrK;
        copy.priceFra = self.priceFra;
        copy.dataIdentifier = self.dataIdentifier;
        copy.price = self.price;
        copy.itemsList = [self.itemsList copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.type = self.type;
        copy.name = [self.name copyWithZone:zone];
        copy.priceCoo = self.priceCoo;
    }
    
    return copy;
}


@end
