//
//  JCModel_PurchasersPurchaserStores.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PurchasersPurchaserStores.h"


NSString *const kJCModel_PurchasersPurchaserStoresNum = @"num";
NSString *const kJCModel_PurchasersPurchaserStoresId = @"id";
NSString *const kJCModel_PurchasersPurchaserStoresItem = @"item";
NSString *const kJCModel_PurchasersPurchaserStoresName = @"name";
NSString *const kJCModel_PurchasersPurchaserStoresRnum = @"rnum";


@interface JCModel_PurchasersPurchaserStores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PurchasersPurchaserStores

@synthesize num = _num;
@synthesize purchaserStoresIdentifier = _purchaserStoresIdentifier;
@synthesize item = _item;
@synthesize name = _name;
@synthesize rnum = _rnum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_PurchasersPurchaserStoresNum fromDictionary:dict] doubleValue];
            self.purchaserStoresIdentifier = [self objectOrNilForKey:kJCModel_PurchasersPurchaserStoresId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_PurchasersPurchaserStoresItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_PurchasersPurchaserStoresName fromDictionary:dict];
            self.rnum = [[self objectOrNilForKey:kJCModel_PurchasersPurchaserStoresRnum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_PurchasersPurchaserStoresNum];
    [mutableDict setValue:self.purchaserStoresIdentifier forKey:kJCModel_PurchasersPurchaserStoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_PurchasersPurchaserStoresItem];
    [mutableDict setValue:self.name forKey:kJCModel_PurchasersPurchaserStoresName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rnum] forKey:kJCModel_PurchasersPurchaserStoresRnum];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPurchaserStoresNum];
    self.purchaserStoresIdentifier = [aDecoder decodeObjectForKey:kJCModel_PurchasersPurchaserStoresId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPurchaserStoresItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_PurchasersPurchaserStoresName];
    self.rnum = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPurchaserStoresRnum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_PurchasersPurchaserStoresNum];
    [aCoder encodeObject:_purchaserStoresIdentifier forKey:kJCModel_PurchasersPurchaserStoresId];
    [aCoder encodeDouble:_item forKey:kJCModel_PurchasersPurchaserStoresItem];
    [aCoder encodeObject:_name forKey:kJCModel_PurchasersPurchaserStoresName];
    [aCoder encodeDouble:_rnum forKey:kJCModel_PurchasersPurchaserStoresRnum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PurchasersPurchaserStores *copy = [[JCModel_PurchasersPurchaserStores alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.purchaserStoresIdentifier = [self.purchaserStoresIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
        copy.rnum = self.rnum;
    }
    
    return copy;
}


@end
