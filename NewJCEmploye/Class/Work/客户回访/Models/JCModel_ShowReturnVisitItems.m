//
//  JCModel_ShowReturnVisitItems.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitItems.h"


NSString *const kJCModel_ShowReturnVisitItemsNum = @"num";
NSString *const kJCModel_ShowReturnVisitItemsId = @"id";
NSString *const kJCModel_ShowReturnVisitItemsItem = @"item";
NSString *const kJCModel_ShowReturnVisitItemsName = @"name";


@interface JCModel_ShowReturnVisitItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitItems

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
            self.num = [[self objectOrNilForKey:kJCModel_ShowReturnVisitItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_ShowReturnVisitItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_ShowReturnVisitItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ShowReturnVisitItemsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_ShowReturnVisitItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_ShowReturnVisitItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_ShowReturnVisitItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_ShowReturnVisitItemsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitItemsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_ShowReturnVisitItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_ShowReturnVisitItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_ShowReturnVisitItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_ShowReturnVisitItemsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitItems *copy = [[JCModel_ShowReturnVisitItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
