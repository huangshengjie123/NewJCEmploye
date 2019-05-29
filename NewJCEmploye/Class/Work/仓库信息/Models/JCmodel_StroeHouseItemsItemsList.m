//
//  JCmodel_StroeHouseItemsItemsList.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsItemsList.h"


NSString *const kJCmodel_StroeHouseItemsItemsListOwner = @"owner";
NSString *const kJCmodel_StroeHouseItemsItemsListStorer = @"storer";
NSString *const kJCmodel_StroeHouseItemsItemsListProbater = @"probater";
NSString *const kJCmodel_StroeHouseItemsItemsListCus = @"cus";
NSString *const kJCmodel_StroeHouseItemsItemsListItemSerial = @"itemSerial";
NSString *const kJCmodel_StroeHouseItemsItemsListMeta = @"meta";
NSString *const kJCmodel_StroeHouseItemsItemsListState = @"state";


@interface JCmodel_StroeHouseItemsItemsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsItemsList

@synthesize owner = _owner;
@synthesize storer = _storer;
@synthesize probater = _probater;
@synthesize cus = _cus;
@synthesize itemSerial = _itemSerial;
@synthesize meta = _meta;
@synthesize state = _state;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.owner = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListOwner fromDictionary:dict] doubleValue];
            self.storer = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListStorer fromDictionary:dict];
            self.probater = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListProbater fromDictionary:dict];
            self.cus = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListCus fromDictionary:dict];
            self.itemSerial = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListItemSerial fromDictionary:dict] doubleValue];
            self.meta = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListMeta fromDictionary:dict] doubleValue];
            self.state = [self objectOrNilForKey:kJCmodel_StroeHouseItemsItemsListState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCmodel_StroeHouseItemsItemsListOwner];
    [mutableDict setValue:self.storer forKey:kJCmodel_StroeHouseItemsItemsListStorer];
    [mutableDict setValue:self.probater forKey:kJCmodel_StroeHouseItemsItemsListProbater];
    [mutableDict setValue:self.cus forKey:kJCmodel_StroeHouseItemsItemsListCus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemSerial] forKey:kJCmodel_StroeHouseItemsItemsListItemSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.meta] forKey:kJCmodel_StroeHouseItemsItemsListMeta];
    [mutableDict setValue:self.state forKey:kJCmodel_StroeHouseItemsItemsListState];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemsListOwner];
    self.storer = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemsListStorer];
    self.probater = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemsListProbater];
    self.cus = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemsListCus];
    self.itemSerial = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemsListItemSerial];
    self.meta = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsItemsListMeta];
    self.state = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsItemsListState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCmodel_StroeHouseItemsItemsListOwner];
    [aCoder encodeObject:_storer forKey:kJCmodel_StroeHouseItemsItemsListStorer];
    [aCoder encodeObject:_probater forKey:kJCmodel_StroeHouseItemsItemsListProbater];
    [aCoder encodeObject:_cus forKey:kJCmodel_StroeHouseItemsItemsListCus];
    [aCoder encodeDouble:_itemSerial forKey:kJCmodel_StroeHouseItemsItemsListItemSerial];
    [aCoder encodeDouble:_meta forKey:kJCmodel_StroeHouseItemsItemsListMeta];
    [aCoder encodeObject:_state forKey:kJCmodel_StroeHouseItemsItemsListState];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsItemsList *copy = [[JCmodel_StroeHouseItemsItemsList alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.storer = [self.storer copyWithZone:zone];
        copy.probater = [self.probater copyWithZone:zone];
        copy.cus = [self.cus copyWithZone:zone];
        copy.itemSerial = self.itemSerial;
        copy.meta = self.meta;
        copy.state = [self.state copyWithZone:zone];
    }
    
    return copy;
}


@end
