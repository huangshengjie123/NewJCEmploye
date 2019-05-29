//
//  JCModel_AllOutInputOrderItems.m
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AllOutInputOrderItems.h"


NSString *const kJCModel_AllOutInputOrderItemsNum = @"num";
NSString *const kJCModel_AllOutInputOrderItemsId = @"id";
NSString *const kJCModel_AllOutInputOrderItemsItem = @"item";
NSString *const kJCModel_AllOutInputOrderItemsName = @"name";


@interface JCModel_AllOutInputOrderItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AllOutInputOrderItems

@synthesize num = _num;
@synthesize itemsIdentifier = _itemsIdentifier;
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
            self.num = [[self objectOrNilForKey:kJCModel_AllOutInputOrderItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_AllOutInputOrderItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_AllOutInputOrderItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_AllOutInputOrderItemsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_AllOutInputOrderItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_AllOutInputOrderItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_AllOutInputOrderItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_AllOutInputOrderItemsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_AllOutInputOrderItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_AllOutInputOrderItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderItemsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_AllOutInputOrderItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_AllOutInputOrderItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_AllOutInputOrderItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_AllOutInputOrderItemsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AllOutInputOrderItems *copy = [[JCModel_AllOutInputOrderItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
