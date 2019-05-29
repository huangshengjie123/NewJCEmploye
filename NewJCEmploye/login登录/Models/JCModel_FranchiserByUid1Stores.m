//
//  JCModel_FranchiserByUid1Stores.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FranchiserByUid1Stores.h"


NSString *const kJCModel_FranchiserByUid1StoresNum = @"num";
NSString *const kJCModel_FranchiserByUid1StoresId = @"id";
NSString *const kJCModel_FranchiserByUid1StoresItem = @"item";
NSString *const kJCModel_FranchiserByUid1StoresName = @"name";


@interface JCModel_FranchiserByUid1Stores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FranchiserByUid1Stores

@synthesize num = _num;
@synthesize storesIdentifier = _storesIdentifier;
@synthesize item = _item;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_FranchiserByUid1StoresNum fromDictionary:dict] doubleValue];
            self.storesIdentifier = [self objectOrNilForKey:kJCModel_FranchiserByUid1StoresId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_FranchiserByUid1StoresItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_FranchiserByUid1StoresName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_FranchiserByUid1StoresNum];
    [mutableDict setValue:self.storesIdentifier forKey:kJCModel_FranchiserByUid1StoresId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_FranchiserByUid1StoresItem];
    [mutableDict setValue:self.name forKey:kJCModel_FranchiserByUid1StoresName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_FranchiserByUid1StoresNum];
    self.storesIdentifier = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1StoresId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_FranchiserByUid1StoresItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1StoresName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_FranchiserByUid1StoresNum];
    [aCoder encodeObject:_storesIdentifier forKey:kJCModel_FranchiserByUid1StoresId];
    [aCoder encodeDouble:_item forKey:kJCModel_FranchiserByUid1StoresItem];
    [aCoder encodeObject:_name forKey:kJCModel_FranchiserByUid1StoresName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FranchiserByUid1Stores *copy = [[JCModel_FranchiserByUid1Stores alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.storesIdentifier = [self.storesIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
