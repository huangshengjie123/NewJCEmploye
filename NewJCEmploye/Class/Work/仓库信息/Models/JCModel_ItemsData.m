//
//  JCModel_ItemsData.m
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsData.h"
#import "JCModel_ItemsItemOne.h"


NSString *const kJCModel_ItemsDataNum = @"num";
NSString *const kJCModel_ItemsDataState = @"state";
NSString *const kJCModel_ItemsDataItemOne = @"itemOne";
NSString *const kJCModel_ItemsDataItem = @"item";
NSString *const kJCModel_ItemsDataUser = @"user";


@interface JCModel_ItemsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsData

@synthesize num = _num;
@synthesize state = _state;
@synthesize itemOne = _itemOne;
@synthesize item = _item;
@synthesize user = _user;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_ItemsDataNum fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kJCModel_ItemsDataState fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_ItemsItemOne = [dict objectForKey:kJCModel_ItemsDataItemOne];
    NSMutableArray *parsedJCModel_ItemsItemOne = [NSMutableArray array];
    
    if ([receivedJCModel_ItemsItemOne isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ItemsItemOne) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ItemsItemOne addObject:[JCModel_ItemsItemOne modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ItemsItemOne isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ItemsItemOne addObject:[JCModel_ItemsItemOne modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ItemsItemOne]];
    }

    self.itemOne = [NSArray arrayWithArray:parsedJCModel_ItemsItemOne];
            self.item = [[self objectOrNilForKey:kJCModel_ItemsDataItem fromDictionary:dict] doubleValue];
            self.user = [[self objectOrNilForKey:kJCModel_ItemsDataUser fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_ItemsDataNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kJCModel_ItemsDataState];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemOne] forKey:kJCModel_ItemsDataItemOne];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_ItemsDataItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.user] forKey:kJCModel_ItemsDataUser];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_ItemsDataNum];
    self.state = [aDecoder decodeDoubleForKey:kJCModel_ItemsDataState];
    self.itemOne = [aDecoder decodeObjectForKey:kJCModel_ItemsDataItemOne];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_ItemsDataItem];
    self.user = [aDecoder decodeDoubleForKey:kJCModel_ItemsDataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_ItemsDataNum];
    [aCoder encodeDouble:_state forKey:kJCModel_ItemsDataState];
    [aCoder encodeObject:_itemOne forKey:kJCModel_ItemsDataItemOne];
    [aCoder encodeDouble:_item forKey:kJCModel_ItemsDataItem];
    [aCoder encodeDouble:_user forKey:kJCModel_ItemsDataUser];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsData *copy = [[JCModel_ItemsData alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.state = self.state;
        copy.itemOne = [self.itemOne copyWithZone:zone];
        copy.item = self.item;
        copy.user = self.user;
    }
    
    return copy;
}


@end
