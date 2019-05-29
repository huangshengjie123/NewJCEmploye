//
//  JCModel_dealFranchiserOrder3Base.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder3Base.h"
#import "JCModel_dealFranchiserOrder3FranchiserOrder.h"


NSString *const kJCModel_dealFranchiserOrder3BaseSellGroupId = @"sellGroupId";
NSString *const kJCModel_dealFranchiserOrder3BaseCurrent = @"current";
NSString *const kJCModel_dealFranchiserOrder3BaseNeedOutStore = @"needOutStore";
NSString *const kJCModel_dealFranchiserOrder3BaseStoreHourse = @"storeHourse";
NSString *const kJCModel_dealFranchiserOrder3BaseCommand = @"command";
NSString *const kJCModel_dealFranchiserOrder3BaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_dealFranchiserOrder3Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder3Base

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
            self.sellGroupId = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3BaseSellGroupId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3BaseCurrent fromDictionary:dict];
            self.needOutStore = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3BaseNeedOutStore fromDictionary:dict];
            self.storeHourse = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3BaseStoreHourse fromDictionary:dict];
            self.command = [self objectOrNilForKey:kJCModel_dealFranchiserOrder3BaseCommand fromDictionary:dict];
            self.franchiserOrder = [JCModel_dealFranchiserOrder3FranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_dealFranchiserOrder3BaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sellGroupId forKey:kJCModel_dealFranchiserOrder3BaseSellGroupId];
    [mutableDict setValue:self.current forKey:kJCModel_dealFranchiserOrder3BaseCurrent];
    [mutableDict setValue:self.needOutStore forKey:kJCModel_dealFranchiserOrder3BaseNeedOutStore];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_dealFranchiserOrder3BaseStoreHourse];
    [mutableDict setValue:self.command forKey:kJCModel_dealFranchiserOrder3BaseCommand];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_dealFranchiserOrder3BaseFranchiserOrder];

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

    self.sellGroupId = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseSellGroupId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseCurrent];
    self.needOutStore = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseNeedOutStore];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseStoreHourse];
    self.command = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseCommand];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder3BaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sellGroupId forKey:kJCModel_dealFranchiserOrder3BaseSellGroupId];
    [aCoder encodeObject:_current forKey:kJCModel_dealFranchiserOrder3BaseCurrent];
    [aCoder encodeObject:_needOutStore forKey:kJCModel_dealFranchiserOrder3BaseNeedOutStore];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_dealFranchiserOrder3BaseStoreHourse];
    [aCoder encodeObject:_command forKey:kJCModel_dealFranchiserOrder3BaseCommand];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_dealFranchiserOrder3BaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder3Base *copy = [[JCModel_dealFranchiserOrder3Base alloc] init];
    
    
    
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
