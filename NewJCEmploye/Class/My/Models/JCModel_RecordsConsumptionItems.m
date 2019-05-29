//
//  JCModel_RecordsConsumptionItems.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_RecordsConsumptionItems.h"


NSString *const kJCModel_RecordsConsumptionItemsNum = @"num";
NSString *const kJCModel_RecordsConsumptionItemsId = @"id";
NSString *const kJCModel_RecordsConsumptionItemsItem = @"item";
NSString *const kJCModel_RecordsConsumptionItemsName = @"name";


@interface JCModel_RecordsConsumptionItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_RecordsConsumptionItems

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
            self.num = [[self objectOrNilForKey:kJCModel_RecordsConsumptionItemsNum fromDictionary:dict] doubleValue];
            self.itemsIdentifier = [self objectOrNilForKey:kJCModel_RecordsConsumptionItemsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_RecordsConsumptionItemsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_RecordsConsumptionItemsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_RecordsConsumptionItemsNum];
    [mutableDict setValue:self.itemsIdentifier forKey:kJCModel_RecordsConsumptionItemsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_RecordsConsumptionItemsItem];
    [mutableDict setValue:self.name forKey:kJCModel_RecordsConsumptionItemsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionItemsNum];
    self.itemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionItemsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionItemsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionItemsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_RecordsConsumptionItemsNum];
    [aCoder encodeObject:_itemsIdentifier forKey:kJCModel_RecordsConsumptionItemsId];
    [aCoder encodeDouble:_item forKey:kJCModel_RecordsConsumptionItemsItem];
    [aCoder encodeObject:_name forKey:kJCModel_RecordsConsumptionItemsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_RecordsConsumptionItems *copy = [[JCModel_RecordsConsumptionItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
