//
//  JCModel_NewSellOrderUpModelBase.m
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellOrderUpModelBase.h"
#import "JCModel_NewSellOrderUpModelOrder.h"


NSString *const kJCModel_NewSellOrderUpModelBaseIsPre = @"isPre";
NSString *const kJCModel_NewSellOrderUpModelBaseCurrent = @"current";
NSString *const kJCModel_NewSellOrderUpModelBaseIsOutStore = @"isOutStore";
NSString *const kJCModel_NewSellOrderUpModelBaseOrder = @"order";
NSString *const kJCModel_NewSellOrderUpModelBasePreId = @"preId";
NSString *const kJCModel_NewSellOrderUpModelBaseSellGroupId = @"sellGroupId";
NSString *const kJCModel_NewSellOrderUpModelBaseCommand = @"command";
NSString *const kJCModel_NewSellOrderUpModelBaseStoreHourse = @"storeHourse";


@interface JCModel_NewSellOrderUpModelBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellOrderUpModelBase

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
            self.isPre = [[self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseIsPre fromDictionary:dict] boolValue];
            self.current = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseCurrent fromDictionary:dict];
            self.isOutStore = [[self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseIsOutStore fromDictionary:dict] boolValue];
            self.order = [JCModel_NewSellOrderUpModelOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_NewSellOrderUpModelBaseOrder]];
            self.preId = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelBasePreId fromDictionary:dict];
            self.sellGroupId = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseSellGroupId fromDictionary:dict];
            self.command = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseCommand fromDictionary:dict];
            self.storeHourse = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelBaseStoreHourse fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_NewSellOrderUpModelBaseIsPre];
    [mutableDict setValue:self.current forKey:kJCModel_NewSellOrderUpModelBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOutStore] forKey:kJCModel_NewSellOrderUpModelBaseIsOutStore];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_NewSellOrderUpModelBaseOrder];
    [mutableDict setValue:self.preId forKey:kJCModel_NewSellOrderUpModelBasePreId];
    [mutableDict setValue:self.sellGroupId forKey:kJCModel_NewSellOrderUpModelBaseSellGroupId];
    [mutableDict setValue:self.command forKey:kJCModel_NewSellOrderUpModelBaseCommand];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_NewSellOrderUpModelBaseStoreHourse];

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

    self.isPre = [aDecoder decodeBoolForKey:kJCModel_NewSellOrderUpModelBaseIsPre];
    self.current = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBaseCurrent];
    self.isOutStore = [aDecoder decodeBoolForKey:kJCModel_NewSellOrderUpModelBaseIsOutStore];
    self.order = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBaseOrder];
    self.preId = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBasePreId];
    self.sellGroupId = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBaseSellGroupId];
    self.command = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBaseCommand];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelBaseStoreHourse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isPre forKey:kJCModel_NewSellOrderUpModelBaseIsPre];
    [aCoder encodeObject:_current forKey:kJCModel_NewSellOrderUpModelBaseCurrent];
    [aCoder encodeBool:_isOutStore forKey:kJCModel_NewSellOrderUpModelBaseIsOutStore];
    [aCoder encodeObject:_order forKey:kJCModel_NewSellOrderUpModelBaseOrder];
    [aCoder encodeObject:_preId forKey:kJCModel_NewSellOrderUpModelBasePreId];
    [aCoder encodeObject:_sellGroupId forKey:kJCModel_NewSellOrderUpModelBaseSellGroupId];
    [aCoder encodeObject:_command forKey:kJCModel_NewSellOrderUpModelBaseCommand];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_NewSellOrderUpModelBaseStoreHourse];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellOrderUpModelBase *copy = [[JCModel_NewSellOrderUpModelBase alloc] init];
    
    
    
    if (copy) {

        copy.isPre = self.isPre;
        copy.current = [self.current copyWithZone:zone];
        copy.isOutStore = self.isOutStore;
        copy.order = [self.order copyWithZone:zone];
        copy.preId = [self.preId copyWithZone:zone];
        copy.sellGroupId = [self.sellGroupId copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
    }
    
    return copy;
}


@end
