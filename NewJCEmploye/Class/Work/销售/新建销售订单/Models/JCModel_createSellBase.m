//
//  JCModel_createSellBase.m
//
//  Created by   on 2018/6/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createSellBase.h"
#import "JCModel_createSellOrder.h"


NSString *const kJCModel_createSellBaseIsPre = @"isPre";
NSString *const kJCModel_createSellBaseCurrent = @"current";
NSString *const kJCModel_createSellBaseIsOutStore = @"isOutStore";
NSString *const kJCModel_createSellBaseOrder = @"order";
NSString *const kJCModel_createSellBasePreId = @"preId";
NSString *const kJCModel_createSellBaseSellGroupId = @"sellGroupId";
NSString *const kJCModel_createSellBaseCommand = @"command";
NSString *const kJCModel_createSellBaseStoreHourse = @"storeHourse";


@interface JCModel_createSellBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createSellBase

@synthesize isPre = _isPre;
@synthesize current = _current;
@synthesize isOutStore = _isOutStore;
@synthesize order = _order;
@synthesize preId = _preId;
@synthesize sellGroupId = _sellGroupId;
@synthesize command = _command;
@synthesize storeHourse = _storeHourse;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isPre = [[self objectOrNilForKey:kJCModel_createSellBaseIsPre fromDictionary:dict] boolValue];
            self.current = [self objectOrNilForKey:kJCModel_createSellBaseCurrent fromDictionary:dict];
            self.isOutStore = [[self objectOrNilForKey:kJCModel_createSellBaseIsOutStore fromDictionary:dict] boolValue];
            self.order = [JCModel_createSellOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_createSellBaseOrder]];
            self.preId = [self objectOrNilForKey:kJCModel_createSellBasePreId fromDictionary:dict];
            self.sellGroupId = [self objectOrNilForKey:kJCModel_createSellBaseSellGroupId fromDictionary:dict] ;
            self.command = [self objectOrNilForKey:kJCModel_createSellBaseCommand fromDictionary:dict];
            self.storeHourse = [self objectOrNilForKey:kJCModel_createSellBaseStoreHourse fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_createSellBaseIsPre];
    [mutableDict setValue:self.current forKey:kJCModel_createSellBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOutStore] forKey:kJCModel_createSellBaseIsOutStore];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_createSellBaseOrder];
    [mutableDict setValue:self.preId forKey:kJCModel_createSellBasePreId];
    [mutableDict setValue:self.sellGroupId forKey:kJCModel_createSellBaseSellGroupId];
    [mutableDict setValue:self.command forKey:kJCModel_createSellBaseCommand];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_createSellBaseStoreHourse];

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

    self.isPre = [aDecoder decodeBoolForKey:kJCModel_createSellBaseIsPre];
    self.current = [aDecoder decodeObjectForKey:kJCModel_createSellBaseCurrent];
    self.isOutStore = [aDecoder decodeBoolForKey:kJCModel_createSellBaseIsOutStore];
    self.order = [aDecoder decodeObjectForKey:kJCModel_createSellBaseOrder];
    self.preId = [aDecoder decodeObjectForKey:kJCModel_createSellBasePreId];
    self.sellGroupId = [aDecoder decodeObjectForKey:kJCModel_createSellBaseSellGroupId];
    self.command = [aDecoder decodeObjectForKey:kJCModel_createSellBaseCommand];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_createSellBaseStoreHourse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isPre forKey:kJCModel_createSellBaseIsPre];
    [aCoder encodeObject:_current forKey:kJCModel_createSellBaseCurrent];
    [aCoder encodeBool:_isOutStore forKey:kJCModel_createSellBaseIsOutStore];
    [aCoder encodeObject:_order forKey:kJCModel_createSellBaseOrder];
    [aCoder encodeObject:_preId forKey:kJCModel_createSellBasePreId];
    [aCoder encodeObject:_sellGroupId forKey:kJCModel_createSellBaseSellGroupId];
    [aCoder encodeObject:_command forKey:kJCModel_createSellBaseCommand];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_createSellBaseStoreHourse];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createSellBase *copy = [[JCModel_createSellBase alloc] init];
    
    
    
    if (copy) {

        copy.isPre = self.isPre;
        copy.current = [self.current copyWithZone:zone];
        copy.isOutStore = self.isOutStore;
        copy.order = [self.order copyWithZone:zone];
        copy.preId = self.preId;
        copy.sellGroupId = self.sellGroupId;
        copy.command = [self.command copyWithZone:zone];
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
    }
    
    return copy;
}


@end
