//
//  JCModel_ReturnVisitList.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitList.h"
#import "JCModel_ReturnVisitCustomer.h"
#import "JCModel_ReturnVisitItems.h"


NSString *const kJCModel_ReturnVisitListMyItem = @"myItem";
NSString *const kJCModel_ReturnVisitListComments = @"comments";
NSString *const kJCModel_ReturnVisitListId = @"id";
NSString *const kJCModel_ReturnVisitListOutStatus = @"outStatus";
NSString *const kJCModel_ReturnVisitListInOutId = @"inOutId";
NSString *const kJCModel_ReturnVisitListGuide = @"guide";
NSString *const kJCModel_ReturnVisitListCusId = @"cusId";
NSString *const kJCModel_ReturnVisitListVtype = @"vtype";
NSString *const kJCModel_ReturnVisitListCustomer = @"customer";
NSString *const kJCModel_ReturnVisitListCreateTime = @"createTime";
NSString *const kJCModel_ReturnVisitListItems = @"items";


@interface JCModel_ReturnVisitList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitList

@synthesize myItem = _myItem;
@synthesize comments = _comments;
@synthesize listIdentifier = _listIdentifier;
@synthesize outStatus = _outStatus;
@synthesize inOutId = _inOutId;
@synthesize guide = _guide;
@synthesize cusId = _cusId;
@synthesize vtype = _vtype;
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
            self.myItem = [self objectOrNilForKey:kJCModel_ReturnVisitListMyItem fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_ReturnVisitListComments fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_ReturnVisitListId fromDictionary:dict] doubleValue];
            self.outStatus = [self objectOrNilForKey:kJCModel_ReturnVisitListOutStatus fromDictionary:dict];
            self.inOutId = [self objectOrNilForKey:kJCModel_ReturnVisitListInOutId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_ReturnVisitListGuide fromDictionary:dict] doubleValue];
            self.cusId = [[self objectOrNilForKey:kJCModel_ReturnVisitListCusId fromDictionary:dict] doubleValue];
            self.vtype = [[self objectOrNilForKey:kJCModel_ReturnVisitListVtype fromDictionary:dict] doubleValue];
            self.customer = [JCModel_ReturnVisitCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_ReturnVisitListCustomer]];
            self.createTime = [self objectOrNilForKey:kJCModel_ReturnVisitListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_ReturnVisitItems = [dict objectForKey:kJCModel_ReturnVisitListItems];
    NSMutableArray *parsedJCModel_ReturnVisitItems = [NSMutableArray array];
    
    if ([receivedJCModel_ReturnVisitItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReturnVisitItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReturnVisitItems addObject:[JCModel_ReturnVisitItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReturnVisitItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReturnVisitItems addObject:[JCModel_ReturnVisitItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReturnVisitItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_ReturnVisitItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.myItem forKey:kJCModel_ReturnVisitListMyItem];
    [mutableDict setValue:self.comments forKey:kJCModel_ReturnVisitListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_ReturnVisitListId];
    [mutableDict setValue:self.outStatus forKey:kJCModel_ReturnVisitListOutStatus];
    [mutableDict setValue:self.inOutId forKey:kJCModel_ReturnVisitListInOutId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_ReturnVisitListGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_ReturnVisitListCusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vtype] forKey:kJCModel_ReturnVisitListVtype];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_ReturnVisitListCustomer];
    [mutableDict setValue:self.createTime forKey:kJCModel_ReturnVisitListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_ReturnVisitListItems];

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

    self.myItem = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListMyItem];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListComments];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitListId];
    self.outStatus = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListOutStatus];
    self.inOutId = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListInOutId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitListGuide];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitListCusId];
    self.vtype = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitListVtype];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListCustomer];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitListItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_myItem forKey:kJCModel_ReturnVisitListMyItem];
    [aCoder encodeObject:_comments forKey:kJCModel_ReturnVisitListComments];
    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_ReturnVisitListId];
    [aCoder encodeObject:_outStatus forKey:kJCModel_ReturnVisitListOutStatus];
    [aCoder encodeObject:_inOutId forKey:kJCModel_ReturnVisitListInOutId];
    [aCoder encodeDouble:_guide forKey:kJCModel_ReturnVisitListGuide];
    [aCoder encodeDouble:_cusId forKey:kJCModel_ReturnVisitListCusId];
    [aCoder encodeDouble:_vtype forKey:kJCModel_ReturnVisitListVtype];
    [aCoder encodeObject:_customer forKey:kJCModel_ReturnVisitListCustomer];
    [aCoder encodeObject:_createTime forKey:kJCModel_ReturnVisitListCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_ReturnVisitListItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitList *copy = [[JCModel_ReturnVisitList alloc] init];
    
    
    
    if (copy) {

        copy.myItem = [self.myItem copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.listIdentifier = self.listIdentifier;
        copy.outStatus = [self.outStatus copyWithZone:zone];
        copy.inOutId = [self.inOutId copyWithZone:zone];
        copy.guide = self.guide;
        copy.cusId = self.cusId;
        copy.vtype = self.vtype;
        copy.customer = [self.customer copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
