//
//  JCModel_inventoryWarningPurchaserStores.m
//
//  Created by   on 2018/10/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inventoryWarningPurchaserStores.h"


NSString *const kJCModel_inventoryWarningPurchaserStoresName = @"name";
NSString *const kJCModel_inventoryWarningPurchaserStoresNum = @"num";
NSString *const kJCModel_inventoryWarningPurchaserStoresId = @"id";
NSString *const kJCModel_inventoryWarningPurchaserStoresItem = @"item";
NSString *const kJCModel_inventoryWarningPurchaserStoresRnum = @"rnum";
NSString *const kJCModel_inventoryWarningPurchaserStoresWarnpoint = @"warnpoint";


@interface JCModel_inventoryWarningPurchaserStores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inventoryWarningPurchaserStores

@synthesize name = _name;
@synthesize num = _num;
@synthesize purchaserStoresIdentifier = _purchaserStoresIdentifier;
@synthesize item = _item;
@synthesize rnum = _rnum;
@synthesize warnpoint = _warnpoint;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresName fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresNum fromDictionary:dict] doubleValue];
            self.purchaserStoresIdentifier = [self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresItem fromDictionary:dict] doubleValue];
            self.rnum = [[self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresRnum fromDictionary:dict] doubleValue];
            self.warnpoint = [[self objectOrNilForKey:kJCModel_inventoryWarningPurchaserStoresWarnpoint fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kJCModel_inventoryWarningPurchaserStoresName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_inventoryWarningPurchaserStoresNum];
    [mutableDict setValue:self.purchaserStoresIdentifier forKey:kJCModel_inventoryWarningPurchaserStoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_inventoryWarningPurchaserStoresItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rnum] forKey:kJCModel_inventoryWarningPurchaserStoresRnum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.warnpoint] forKey:kJCModel_inventoryWarningPurchaserStoresWarnpoint];

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

    self.name = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningPurchaserStoresName];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningPurchaserStoresNum];
    self.purchaserStoresIdentifier = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningPurchaserStoresId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningPurchaserStoresItem];
    self.rnum = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningPurchaserStoresRnum];
    self.warnpoint = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningPurchaserStoresWarnpoint];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kJCModel_inventoryWarningPurchaserStoresName];
    [aCoder encodeDouble:_num forKey:kJCModel_inventoryWarningPurchaserStoresNum];
    [aCoder encodeObject:_purchaserStoresIdentifier forKey:kJCModel_inventoryWarningPurchaserStoresId];
    [aCoder encodeDouble:_item forKey:kJCModel_inventoryWarningPurchaserStoresItem];
    [aCoder encodeDouble:_rnum forKey:kJCModel_inventoryWarningPurchaserStoresRnum];
    [aCoder encodeDouble:_warnpoint forKey:kJCModel_inventoryWarningPurchaserStoresWarnpoint];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inventoryWarningPurchaserStores *copy = [[JCModel_inventoryWarningPurchaserStores alloc] init];
    
    
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.num = self.num;
        copy.purchaserStoresIdentifier = [self.purchaserStoresIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.rnum = self.rnum;
        copy.warnpoint = self.warnpoint;
    }
    
    return copy;
}


@end
