//
//  JCModel_RecordsConsumptionList.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_RecordsConsumptionList.h"
#import "JCModel_RecordsConsumptionItems.h"


NSString *const kJCModel_RecordsConsumptionListAmount = @"amount";
NSString *const kJCModel_RecordsConsumptionListFranchiser = @"franchiser";
NSString *const kJCModel_RecordsConsumptionListPhone = @"phone";
NSString *const kJCModel_RecordsConsumptionListId = @"id";
NSString *const kJCModel_RecordsConsumptionListTime = @"time";
NSString *const kJCModel_RecordsConsumptionListOid = @"oid";
NSString *const kJCModel_RecordsConsumptionListType = @"type";
NSString *const kJCModel_RecordsConsumptionListName = @"name";
NSString *const kJCModel_RecordsConsumptionListItems = @"items";


@interface JCModel_RecordsConsumptionList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_RecordsConsumptionList

@synthesize amount = _amount;
@synthesize franchiser = _franchiser;
@synthesize phone = _phone;
@synthesize listIdentifier = _listIdentifier;
@synthesize time = _time;
@synthesize oid = _oid;
@synthesize type = _type;
@synthesize name = _name;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [[self objectOrNilForKey:kJCModel_RecordsConsumptionListAmount fromDictionary:dict] doubleValue];
            self.franchiser = [self objectOrNilForKey:kJCModel_RecordsConsumptionListFranchiser fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_RecordsConsumptionListPhone fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_RecordsConsumptionListId fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_RecordsConsumptionListTime fromDictionary:dict];
            self.oid = [self objectOrNilForKey:kJCModel_RecordsConsumptionListOid fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_RecordsConsumptionListType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_RecordsConsumptionListName fromDictionary:dict];
    NSObject *receivedJCModel_RecordsConsumptionItems = [dict objectForKey:kJCModel_RecordsConsumptionListItems];
    NSMutableArray *parsedJCModel_RecordsConsumptionItems = [NSMutableArray array];
    
    if ([receivedJCModel_RecordsConsumptionItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_RecordsConsumptionItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_RecordsConsumptionItems addObject:[JCModel_RecordsConsumptionItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_RecordsConsumptionItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_RecordsConsumptionItems addObject:[JCModel_RecordsConsumptionItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_RecordsConsumptionItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_RecordsConsumptionItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_RecordsConsumptionListAmount];
    [mutableDict setValue:self.franchiser forKey:kJCModel_RecordsConsumptionListFranchiser];
    [mutableDict setValue:self.phone forKey:kJCModel_RecordsConsumptionListPhone];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_RecordsConsumptionListId];
    [mutableDict setValue:self.time forKey:kJCModel_RecordsConsumptionListTime];
    [mutableDict setValue:self.oid forKey:kJCModel_RecordsConsumptionListOid];
    [mutableDict setValue:self.type forKey:kJCModel_RecordsConsumptionListType];
    [mutableDict setValue:self.name forKey:kJCModel_RecordsConsumptionListName];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_RecordsConsumptionListItems];

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

    self.amount = [aDecoder decodeDoubleForKey:kJCModel_RecordsConsumptionListAmount];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListFranchiser];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListPhone];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListId];
    self.time = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListTime];
    self.oid = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListOid];
    self.type = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListName];
    self.items = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionListItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kJCModel_RecordsConsumptionListAmount];
    [aCoder encodeObject:_franchiser forKey:kJCModel_RecordsConsumptionListFranchiser];
    [aCoder encodeObject:_phone forKey:kJCModel_RecordsConsumptionListPhone];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_RecordsConsumptionListId];
    [aCoder encodeObject:_time forKey:kJCModel_RecordsConsumptionListTime];
    [aCoder encodeObject:_oid forKey:kJCModel_RecordsConsumptionListOid];
    [aCoder encodeObject:_type forKey:kJCModel_RecordsConsumptionListType];
    [aCoder encodeObject:_name forKey:kJCModel_RecordsConsumptionListName];
    [aCoder encodeObject:_items forKey:kJCModel_RecordsConsumptionListItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_RecordsConsumptionList *copy = [[JCModel_RecordsConsumptionList alloc] init];
    
    
    
    if (copy) {

        copy.amount = self.amount;
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.oid = [self.oid copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
