//
//  JCModel_GetItemPriceItemsList.m
//
//  Created by   on 2018/11/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetItemPriceItemsList.h"


NSString *const kJCModel_GetItemPriceItemsListOwner = @"owner";
NSString *const kJCModel_GetItemPriceItemsListStorer = @"storer";
NSString *const kJCModel_GetItemPriceItemsListProbater = @"probater";
NSString *const kJCModel_GetItemPriceItemsListCus = @"cus";
NSString *const kJCModel_GetItemPriceItemsListItemSerial = @"itemSerial";
NSString *const kJCModel_GetItemPriceItemsListMeta = @"meta";
NSString *const kJCModel_GetItemPriceItemsListState = @"state";


@interface JCModel_GetItemPriceItemsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetItemPriceItemsList

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
            self.owner = [[self objectOrNilForKey:kJCModel_GetItemPriceItemsListOwner fromDictionary:dict] doubleValue];
            self.storer = [[self objectOrNilForKey:kJCModel_GetItemPriceItemsListStorer fromDictionary:dict] doubleValue];
            self.probater = [self objectOrNilForKey:kJCModel_GetItemPriceItemsListProbater fromDictionary:dict];
            self.cus = [self objectOrNilForKey:kJCModel_GetItemPriceItemsListCus fromDictionary:dict];
            self.itemSerial = [[self objectOrNilForKey:kJCModel_GetItemPriceItemsListItemSerial fromDictionary:dict] doubleValue];
            self.meta = [[self objectOrNilForKey:kJCModel_GetItemPriceItemsListMeta fromDictionary:dict] doubleValue];
            self.state = [self objectOrNilForKey:kJCModel_GetItemPriceItemsListState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_GetItemPriceItemsListOwner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storer] forKey:kJCModel_GetItemPriceItemsListStorer];
    [mutableDict setValue:self.probater forKey:kJCModel_GetItemPriceItemsListProbater];
    [mutableDict setValue:self.cus forKey:kJCModel_GetItemPriceItemsListCus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemSerial] forKey:kJCModel_GetItemPriceItemsListItemSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.meta] forKey:kJCModel_GetItemPriceItemsListMeta];
    [mutableDict setValue:self.state forKey:kJCModel_GetItemPriceItemsListState];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceItemsListOwner];
    self.storer = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceItemsListStorer];
    self.probater = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceItemsListProbater];
    self.cus = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceItemsListCus];
    self.itemSerial = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceItemsListItemSerial];
    self.meta = [aDecoder decodeDoubleForKey:kJCModel_GetItemPriceItemsListMeta];
    self.state = [aDecoder decodeObjectForKey:kJCModel_GetItemPriceItemsListState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_GetItemPriceItemsListOwner];
    [aCoder encodeDouble:_storer forKey:kJCModel_GetItemPriceItemsListStorer];
    [aCoder encodeObject:_probater forKey:kJCModel_GetItemPriceItemsListProbater];
    [aCoder encodeObject:_cus forKey:kJCModel_GetItemPriceItemsListCus];
    [aCoder encodeDouble:_itemSerial forKey:kJCModel_GetItemPriceItemsListItemSerial];
    [aCoder encodeDouble:_meta forKey:kJCModel_GetItemPriceItemsListMeta];
    [aCoder encodeObject:_state forKey:kJCModel_GetItemPriceItemsListState];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetItemPriceItemsList *copy = [[JCModel_GetItemPriceItemsList alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.storer = self.storer;
        copy.probater = [self.probater copyWithZone:zone];
        copy.cus = [self.cus copyWithZone:zone];
        copy.itemSerial = self.itemSerial;
        copy.meta = self.meta;
        copy.state = [self.state copyWithZone:zone];
    }
    
    return copy;
}


@end
