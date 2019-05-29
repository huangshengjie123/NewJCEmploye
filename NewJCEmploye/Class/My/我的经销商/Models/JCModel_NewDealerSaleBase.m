//
//  JCModel_NewDealerSaleBase.m
//
//  Created by   on 2018/9/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDealerSaleBase.h"
#import "JCModel_NewDealerSaleFranchiserOrder.h"


NSString *const kJCModel_NewDealerSaleBaseSellGroupId = @"sellGroupId";
NSString *const kJCModel_NewDealerSaleBaseCurrent = @"current";
NSString *const kJCModel_NewDealerSaleBaseNeedOutStore = @"needOutStore";
NSString *const kJCModel_NewDealerSaleBaseStoreHourse = @"storeHourse";
NSString *const kJCModel_NewDealerSaleBaseCommand = @"command";
NSString *const kJCModel_NewDealerSaleBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_NewDealerSaleBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDealerSaleBase

@synthesize sellGroupId = _sellGroupId;
@synthesize current = _current;
@synthesize needOutStore = _needOutStore;
@synthesize storeHourse = _storeHourse;
@synthesize command = _command;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.sellGroupId = [self objectOrNilForKey:kJCModel_NewDealerSaleBaseSellGroupId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_NewDealerSaleBaseCurrent fromDictionary:dict];
            self.needOutStore = [self objectOrNilForKey:kJCModel_NewDealerSaleBaseNeedOutStore fromDictionary:dict];
            self.storeHourse = [self objectOrNilForKey:kJCModel_NewDealerSaleBaseStoreHourse fromDictionary:dict];
            self.command = [self objectOrNilForKey:kJCModel_NewDealerSaleBaseCommand fromDictionary:dict];
            self.franchiserOrder = [JCModel_NewDealerSaleFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDealerSaleBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sellGroupId forKey:kJCModel_NewDealerSaleBaseSellGroupId];
    [mutableDict setValue:self.current forKey:kJCModel_NewDealerSaleBaseCurrent];
    [mutableDict setValue:self.needOutStore forKey:kJCModel_NewDealerSaleBaseNeedOutStore];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_NewDealerSaleBaseStoreHourse];
    [mutableDict setValue:self.command forKey:kJCModel_NewDealerSaleBaseCommand];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_NewDealerSaleBaseFranchiserOrder];

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

    self.sellGroupId = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseSellGroupId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseCurrent];
    self.needOutStore = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseNeedOutStore];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseStoreHourse];
    self.command = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseCommand];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_NewDealerSaleBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sellGroupId forKey:kJCModel_NewDealerSaleBaseSellGroupId];
    [aCoder encodeObject:_current forKey:kJCModel_NewDealerSaleBaseCurrent];
    [aCoder encodeObject:_needOutStore forKey:kJCModel_NewDealerSaleBaseNeedOutStore];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_NewDealerSaleBaseStoreHourse];
    [aCoder encodeObject:_command forKey:kJCModel_NewDealerSaleBaseCommand];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_NewDealerSaleBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDealerSaleBase *copy = [[JCModel_NewDealerSaleBase alloc] init];
    
    
    
    if (copy) {

        copy.sellGroupId = [self.sellGroupId copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.needOutStore = [self.needOutStore copyWithZone:zone];
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
