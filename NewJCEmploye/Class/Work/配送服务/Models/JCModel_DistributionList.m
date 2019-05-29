//
//  JCModel_DistributionList.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionList.h"
#import "JCModel_DistributionUserExtInfo.h"
#import "JCModel_DistributionCustomer.h"
#import "JCModel_DistributionItems.h"


NSString *const kJCModel_DistributionListStaff = @"staff";
NSString *const kJCModel_DistributionListCardId = @"cardId";
NSString *const kJCModel_DistributionListId = @"id";
NSString *const kJCModel_DistributionListUserExtInfo = @"userExtInfo";
NSString *const kJCModel_DistributionListCusId = @"cusId";
NSString *const kJCModel_DistributionListCustomer = @"customer";
NSString *const kJCModel_DistributionListCreateTime = @"createTime";
NSString *const kJCModel_DistributionListItems = @"items";


@interface JCModel_DistributionList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionList

@synthesize staff = _staff;
@synthesize cardId = _cardId;
@synthesize listIdentifier = _listIdentifier;
@synthesize userExtInfo = _userExtInfo;
@synthesize cusId = _cusId;
@synthesize customer = _customer;
@synthesize createTime = _createTime;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.staff = [[self objectOrNilForKey:kJCModel_DistributionListStaff fromDictionary:dict] doubleValue];
            self.cardId = [self objectOrNilForKey:kJCModel_DistributionListCardId fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_DistributionListId fromDictionary:dict];
            self.userExtInfo = [JCModel_DistributionUserExtInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_DistributionListUserExtInfo]];
            self.cusId = [[self objectOrNilForKey:kJCModel_DistributionListCusId fromDictionary:dict] doubleValue];
            self.customer = [JCModel_DistributionCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_DistributionListCustomer]];
            self.createTime = [self objectOrNilForKey:kJCModel_DistributionListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_DistributionItems = [dict objectForKey:kJCModel_DistributionListItems];
    NSMutableArray *parsedJCModel_DistributionItems = [NSMutableArray array];
    
    if ([receivedJCModel_DistributionItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DistributionItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DistributionItems addObject:[JCModel_DistributionItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DistributionItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DistributionItems addObject:[JCModel_DistributionItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DistributionItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_DistributionItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staff] forKey:kJCModel_DistributionListStaff];
    [mutableDict setValue:self.cardId forKey:kJCModel_DistributionListCardId];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_DistributionListId];
    [mutableDict setValue:[self.userExtInfo dictionaryRepresentation] forKey:kJCModel_DistributionListUserExtInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_DistributionListCusId];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_DistributionListCustomer];
    [mutableDict setValue:self.createTime forKey:kJCModel_DistributionListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_DistributionListItems];

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

    self.staff = [aDecoder decodeDoubleForKey:kJCModel_DistributionListStaff];
    self.cardId = [aDecoder decodeObjectForKey:kJCModel_DistributionListCardId];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_DistributionListId];
    self.userExtInfo = [aDecoder decodeObjectForKey:kJCModel_DistributionListUserExtInfo];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_DistributionListCusId];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_DistributionListCustomer];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_DistributionListCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_DistributionListItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_staff forKey:kJCModel_DistributionListStaff];
    [aCoder encodeObject:_cardId forKey:kJCModel_DistributionListCardId];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_DistributionListId];
    [aCoder encodeObject:_userExtInfo forKey:kJCModel_DistributionListUserExtInfo];
    [aCoder encodeDouble:_cusId forKey:kJCModel_DistributionListCusId];
    [aCoder encodeObject:_customer forKey:kJCModel_DistributionListCustomer];
    [aCoder encodeObject:_createTime forKey:kJCModel_DistributionListCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_DistributionListItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionList *copy = [[JCModel_DistributionList alloc] init];
    
    
    
    if (copy) {

        copy.staff = self.staff;
        copy.cardId = [self.cardId copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.userExtInfo = [self.userExtInfo copyWithZone:zone];
        copy.cusId = self.cusId;
        copy.customer = [self.customer copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
