//
//  JCModel_searchOrg2PurchaserStores.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchOrg2PurchaserStores.h"


NSString *const kJCModel_searchOrg2PurchaserStoresUnit = @"unit";
NSString *const kJCModel_searchOrg2PurchaserStoresWarnpoint = @"warnpoint";
NSString *const kJCModel_searchOrg2PurchaserStoresId = @"id";
NSString *const kJCModel_searchOrg2PurchaserStoresRnum = @"rnum";
NSString *const kJCModel_searchOrg2PurchaserStoresNum = @"num";
NSString *const kJCModel_searchOrg2PurchaserStoresName = @"name";
NSString *const kJCModel_searchOrg2PurchaserStoresItem = @"item";


@interface JCModel_searchOrg2PurchaserStores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchOrg2PurchaserStores

@synthesize unit = _unit;
@synthesize warnpoint = _warnpoint;
@synthesize purchaserStoresIdentifier = _purchaserStoresIdentifier;
@synthesize rnum = _rnum;
@synthesize num = _num;
@synthesize name = _name;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.unit = [[self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresUnit fromDictionary:dict] doubleValue];
            self.warnpoint = [[self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresWarnpoint fromDictionary:dict] doubleValue];
            self.purchaserStoresIdentifier = [self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresId fromDictionary:dict];
            self.rnum = [[self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresRnum fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresNum fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_searchOrg2PurchaserStoresItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_searchOrg2PurchaserStoresUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.warnpoint] forKey:kJCModel_searchOrg2PurchaserStoresWarnpoint];
    [mutableDict setValue:self.purchaserStoresIdentifier forKey:kJCModel_searchOrg2PurchaserStoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rnum] forKey:kJCModel_searchOrg2PurchaserStoresRnum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_searchOrg2PurchaserStoresNum];
    [mutableDict setValue:self.name forKey:kJCModel_searchOrg2PurchaserStoresName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_searchOrg2PurchaserStoresItem];

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

    self.unit = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2PurchaserStoresUnit];
    self.warnpoint = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2PurchaserStoresWarnpoint];
    self.purchaserStoresIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchOrg2PurchaserStoresId];
    self.rnum = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2PurchaserStoresRnum];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2PurchaserStoresNum];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchOrg2PurchaserStoresName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2PurchaserStoresItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unit forKey:kJCModel_searchOrg2PurchaserStoresUnit];
    [aCoder encodeDouble:_warnpoint forKey:kJCModel_searchOrg2PurchaserStoresWarnpoint];
    [aCoder encodeObject:_purchaserStoresIdentifier forKey:kJCModel_searchOrg2PurchaserStoresId];
    [aCoder encodeDouble:_rnum forKey:kJCModel_searchOrg2PurchaserStoresRnum];
    [aCoder encodeDouble:_num forKey:kJCModel_searchOrg2PurchaserStoresNum];
    [aCoder encodeObject:_name forKey:kJCModel_searchOrg2PurchaserStoresName];
    [aCoder encodeDouble:_item forKey:kJCModel_searchOrg2PurchaserStoresItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchOrg2PurchaserStores *copy = [[JCModel_searchOrg2PurchaserStores alloc] init];
    
    
    
    if (copy) {

        copy.unit = self.unit;
        copy.warnpoint = self.warnpoint;
        copy.purchaserStoresIdentifier = [self.purchaserStoresIdentifier copyWithZone:zone];
        copy.rnum = self.rnum;
        copy.num = self.num;
        copy.name = [self.name copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
