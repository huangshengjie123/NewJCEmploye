//
//  JCModel_ItemsItemsList.m
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsItemsList.h"


NSString *const kJCModel_ItemsItemsListOwner = @"owner";
NSString *const kJCModel_ItemsItemsListStorer = @"storer";
NSString *const kJCModel_ItemsItemsListProbater = @"probater";
NSString *const kJCModel_ItemsItemsListCus = @"cus";
NSString *const kJCModel_ItemsItemsListItemSerial = @"itemSerial";
NSString *const kJCModel_ItemsItemsListMeta = @"meta";
NSString *const kJCModel_ItemsItemsListState = @"state";


@interface JCModel_ItemsItemsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsItemsList

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
            self.owner = [[self objectOrNilForKey:kJCModel_ItemsItemsListOwner fromDictionary:dict] doubleValue];
            self.storer = [self objectOrNilForKey:kJCModel_ItemsItemsListStorer fromDictionary:dict];
            self.probater = [self objectOrNilForKey:kJCModel_ItemsItemsListProbater fromDictionary:dict];
            self.cus = [self objectOrNilForKey:kJCModel_ItemsItemsListCus fromDictionary:dict];
            self.itemSerial = [[self objectOrNilForKey:kJCModel_ItemsItemsListItemSerial fromDictionary:dict] doubleValue];
            self.meta = [[self objectOrNilForKey:kJCModel_ItemsItemsListMeta fromDictionary:dict] doubleValue];
            self.state = [self objectOrNilForKey:kJCModel_ItemsItemsListState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_ItemsItemsListOwner];
    [mutableDict setValue:self.storer forKey:kJCModel_ItemsItemsListStorer];
    [mutableDict setValue:self.probater forKey:kJCModel_ItemsItemsListProbater];
    [mutableDict setValue:self.cus forKey:kJCModel_ItemsItemsListCus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemSerial] forKey:kJCModel_ItemsItemsListItemSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.meta] forKey:kJCModel_ItemsItemsListMeta];
    [mutableDict setValue:self.state forKey:kJCModel_ItemsItemsListState];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemsListOwner];
    self.storer = [aDecoder decodeObjectForKey:kJCModel_ItemsItemsListStorer];
    self.probater = [aDecoder decodeObjectForKey:kJCModel_ItemsItemsListProbater];
    self.cus = [aDecoder decodeObjectForKey:kJCModel_ItemsItemsListCus];
    self.itemSerial = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemsListItemSerial];
    self.meta = [aDecoder decodeDoubleForKey:kJCModel_ItemsItemsListMeta];
    self.state = [aDecoder decodeObjectForKey:kJCModel_ItemsItemsListState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_ItemsItemsListOwner];
    [aCoder encodeObject:_storer forKey:kJCModel_ItemsItemsListStorer];
    [aCoder encodeObject:_probater forKey:kJCModel_ItemsItemsListProbater];
    [aCoder encodeObject:_cus forKey:kJCModel_ItemsItemsListCus];
    [aCoder encodeDouble:_itemSerial forKey:kJCModel_ItemsItemsListItemSerial];
    [aCoder encodeDouble:_meta forKey:kJCModel_ItemsItemsListMeta];
    [aCoder encodeObject:_state forKey:kJCModel_ItemsItemsListState];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsItemsList *copy = [[JCModel_ItemsItemsList alloc] init];
    
    
    
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
