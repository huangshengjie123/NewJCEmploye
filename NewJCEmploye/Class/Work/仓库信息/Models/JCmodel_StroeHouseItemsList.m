//
//  JCmodel_StroeHouseItemsList.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsList.h"
#import "JCmodel_StroeHouseItemsItemOne.h"


NSString *const kJCmodel_StroeHouseItemsListNum = @"num";
NSString *const kJCmodel_StroeHouseItemsListRepertory = @"repertory";
NSString *const kJCmodel_StroeHouseItemsListItem = @"item";
NSString *const kJCmodel_StroeHouseItemsListItemOne = @"itemOne";


@interface JCmodel_StroeHouseItemsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsList

@synthesize num = _num;
@synthesize repertory = _repertory;
@synthesize item = _item;
@synthesize itemOne = _itemOne;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsListNum fromDictionary:dict] doubleValue];
            self.repertory = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsListRepertory fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsListItem fromDictionary:dict] doubleValue];
    NSObject *receivedJCmodel_StroeHouseItemsItemOne = [dict objectForKey:kJCmodel_StroeHouseItemsListItemOne];
    NSMutableArray *parsedJCmodel_StroeHouseItemsItemOne = [NSMutableArray array];
    
    if ([receivedJCmodel_StroeHouseItemsItemOne isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCmodel_StroeHouseItemsItemOne) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCmodel_StroeHouseItemsItemOne addObject:[JCmodel_StroeHouseItemsItemOne modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCmodel_StroeHouseItemsItemOne isKindOfClass:[NSDictionary class]]) {
       [parsedJCmodel_StroeHouseItemsItemOne addObject:[JCmodel_StroeHouseItemsItemOne modelObjectWithDictionary:(NSDictionary *)receivedJCmodel_StroeHouseItemsItemOne]];
    }

    self.itemOne = [NSArray arrayWithArray:parsedJCmodel_StroeHouseItemsItemOne];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCmodel_StroeHouseItemsListNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repertory] forKey:kJCmodel_StroeHouseItemsListRepertory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCmodel_StroeHouseItemsListItem];
    NSMutableArray *tempArrayForItemOne = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.itemOne) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemOne addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemOne addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemOne] forKey:kJCmodel_StroeHouseItemsListItemOne];

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

    self.num = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsListNum];
    self.repertory = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsListRepertory];
    self.item = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsListItem];
    self.itemOne = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsListItemOne];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCmodel_StroeHouseItemsListNum];
    [aCoder encodeDouble:_repertory forKey:kJCmodel_StroeHouseItemsListRepertory];
    [aCoder encodeDouble:_item forKey:kJCmodel_StroeHouseItemsListItem];
    [aCoder encodeObject:_itemOne forKey:kJCmodel_StroeHouseItemsListItemOne];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsList *copy = [[JCmodel_StroeHouseItemsList alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.repertory = self.repertory;
        copy.item = self.item;
        copy.itemOne = [self.itemOne copyWithZone:zone];
    }
    
    return copy;
}


@end
