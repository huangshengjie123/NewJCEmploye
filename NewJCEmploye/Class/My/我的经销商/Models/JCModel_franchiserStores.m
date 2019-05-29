//
//  JCModel_franchiserStores.m
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserStores.h"


NSString *const kJCModel_franchiserStoresNum = @"num";
NSString *const kJCModel_franchiserStoresId = @"id";
NSString *const kJCModel_franchiserStoresItem = @"item";
NSString *const kJCModel_franchiserStoresName = @"name";
NSString *const kJCModel_franchiserStoresType = @"type";


@interface JCModel_franchiserStores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserStores

@synthesize num = _num;
@synthesize storesIdentifier = _storesIdentifier;
@synthesize item = _item;
@synthesize name = _name;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_franchiserStoresNum fromDictionary:dict] doubleValue];
            self.storesIdentifier = [self objectOrNilForKey:kJCModel_franchiserStoresId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_franchiserStoresItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_franchiserStoresName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_franchiserStoresType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_franchiserStoresNum];
    [mutableDict setValue:self.storesIdentifier forKey:kJCModel_franchiserStoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_franchiserStoresItem];
    [mutableDict setValue:self.name forKey:kJCModel_franchiserStoresName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_franchiserStoresType];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_franchiserStoresNum];
    self.storesIdentifier = [aDecoder decodeObjectForKey:kJCModel_franchiserStoresId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_franchiserStoresItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_franchiserStoresName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_franchiserStoresType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_franchiserStoresNum];
    [aCoder encodeObject:_storesIdentifier forKey:kJCModel_franchiserStoresId];
    [aCoder encodeDouble:_item forKey:kJCModel_franchiserStoresItem];
    [aCoder encodeObject:_name forKey:kJCModel_franchiserStoresName];
    [aCoder encodeDouble:_type forKey:kJCModel_franchiserStoresType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserStores *copy = [[JCModel_franchiserStores alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.storesIdentifier = [self.storesIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
