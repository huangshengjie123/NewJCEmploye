//
//  JCModel_PackageData.m
//
//  Created by   on 2018/6/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PackageData.h"
#import "JCModel_PackageItems.h"


NSString *const kJCModel_PackageDataId = @"id";
NSString *const kJCModel_PackageDataContent = @"content";
NSString *const kJCModel_PackageDataItems = @"items";
NSString *const kJCModel_PackageDataName = @"name";
NSString *const kJCModel_PackageDataPrice = @"price";
NSString *const kJCModel_PackageDataType = @"type";


@interface JCModel_PackageData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PackageData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize content = _content;
@synthesize items = _items;
@synthesize name = _name;
@synthesize price = _price;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_PackageDataId fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kJCModel_PackageDataContent fromDictionary:dict];
    NSObject *receivedJCModel_PackageItems = [dict objectForKey:kJCModel_PackageDataItems];
    NSMutableArray *parsedJCModel_PackageItems = [NSMutableArray array];
    
    if ([receivedJCModel_PackageItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_PackageItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_PackageItems addObject:[JCModel_PackageItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_PackageItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_PackageItems addObject:[JCModel_PackageItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_PackageItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_PackageItems];
            self.name = [self objectOrNilForKey:kJCModel_PackageDataName fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kJCModel_PackageDataPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_PackageDataId];
    [mutableDict setValue:self.content forKey:kJCModel_PackageDataContent];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_PackageDataItems];
    [mutableDict setValue:self.name forKey:kJCModel_PackageDataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCModel_PackageDataPrice];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_PackageDataId];
    self.content = [aDecoder decodeObjectForKey:kJCModel_PackageDataContent];
    self.items = [aDecoder decodeObjectForKey:kJCModel_PackageDataItems];
    self.name = [aDecoder decodeObjectForKey:kJCModel_PackageDataName];
    self.price = [aDecoder decodeDoubleForKey:kJCModel_PackageDataPrice];
    self.type = [aDecoder decodeIntegerForKey:kJCModel_PackageDataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_PackageDataId];
    [aCoder encodeObject:_content forKey:kJCModel_PackageDataContent];
    [aCoder encodeObject:_items forKey:kJCModel_PackageDataItems];
    [aCoder encodeObject:_name forKey:kJCModel_PackageDataName];
    [aCoder encodeDouble:_price forKey:kJCModel_PackageDataPrice];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PackageData *copy = [[JCModel_PackageData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.content = [self.content copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = self.price;
        copy.type = self.type;
    }
    
    return copy;
}


@end
