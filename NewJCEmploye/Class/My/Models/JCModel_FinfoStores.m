//
//  JCModel_FinfoStores.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinfoStores.h"


NSString *const kJCModel_FinfoStoresNum = @"num";
NSString *const kJCModel_FinfoStoresId = @"id";
NSString *const kJCModel_FinfoStoresItem = @"item";
NSString *const kJCModel_FinfoStoresName = @"name";
NSString *const kJCModel_FinfoStoresType = @"type";


@interface JCModel_FinfoStores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinfoStores

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
            self.num = [[self objectOrNilForKey:kJCModel_FinfoStoresNum fromDictionary:dict] doubleValue];
            self.storesIdentifier = [self objectOrNilForKey:kJCModel_FinfoStoresId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_FinfoStoresItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_FinfoStoresName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_FinfoStoresType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_FinfoStoresNum];
    [mutableDict setValue:self.storesIdentifier forKey:kJCModel_FinfoStoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_FinfoStoresItem];
    [mutableDict setValue:self.name forKey:kJCModel_FinfoStoresName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_FinfoStoresType];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_FinfoStoresNum];
    self.storesIdentifier = [aDecoder decodeObjectForKey:kJCModel_FinfoStoresId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_FinfoStoresItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_FinfoStoresName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_FinfoStoresType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_FinfoStoresNum];
    [aCoder encodeObject:_storesIdentifier forKey:kJCModel_FinfoStoresId];
    [aCoder encodeDouble:_item forKey:kJCModel_FinfoStoresItem];
    [aCoder encodeObject:_name forKey:kJCModel_FinfoStoresName];
    [aCoder encodeDouble:_type forKey:kJCModel_FinfoStoresType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinfoStores *copy = [[JCModel_FinfoStores alloc] init];
    
    
    
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
