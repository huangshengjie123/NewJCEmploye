//
//  JCModel_ShowReturnVisitList.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitList.h"
#import "JCModel_ShowReturnVisitCustomer.h"
#import "JCModel_ShowReturnVisitItems.h"


NSString *const kJCModel_ShowReturnVisitListMyItem = @"myItem";
NSString *const kJCModel_ShowReturnVisitListComments = @"comments";
NSString *const kJCModel_ShowReturnVisitListId = @"id";
NSString *const kJCModel_ShowReturnVisitListOutStatus = @"outStatus";
NSString *const kJCModel_ShowReturnVisitListInOutId = @"inOutId";
NSString *const kJCModel_ShowReturnVisitListGuide = @"guide";
NSString *const kJCModel_ShowReturnVisitListCusId = @"cusId";
NSString *const kJCModel_ShowReturnVisitListVtype = @"vtype";
NSString *const kJCModel_ShowReturnVisitListCustomer = @"customer";
NSString *const kJCModel_ShowReturnVisitListCreateTime = @"createTime";
NSString *const kJCModel_ShowReturnVisitListItems = @"items";


@interface JCModel_ShowReturnVisitList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitList

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
            self.myItem = [self objectOrNilForKey:kJCModel_ShowReturnVisitListMyItem fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_ShowReturnVisitListComments fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_ShowReturnVisitListId fromDictionary:dict] doubleValue];
            self.outStatus = [self objectOrNilForKey:kJCModel_ShowReturnVisitListOutStatus fromDictionary:dict];
            self.inOutId = [self objectOrNilForKey:kJCModel_ShowReturnVisitListInOutId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_ShowReturnVisitListGuide fromDictionary:dict] doubleValue];
            self.cusId = [[self objectOrNilForKey:kJCModel_ShowReturnVisitListCusId fromDictionary:dict] doubleValue];
            self.vtype = [[self objectOrNilForKey:kJCModel_ShowReturnVisitListVtype fromDictionary:dict] doubleValue];
            self.customer = [JCModel_ShowReturnVisitCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_ShowReturnVisitListCustomer]];
            self.createTime = [self objectOrNilForKey:kJCModel_ShowReturnVisitListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_ShowReturnVisitItems = [dict objectForKey:kJCModel_ShowReturnVisitListItems];
    NSMutableArray *parsedJCModel_ShowReturnVisitItems = [NSMutableArray array];
    
    if ([receivedJCModel_ShowReturnVisitItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ShowReturnVisitItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ShowReturnVisitItems addObject:[JCModel_ShowReturnVisitItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ShowReturnVisitItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ShowReturnVisitItems addObject:[JCModel_ShowReturnVisitItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ShowReturnVisitItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_ShowReturnVisitItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.myItem forKey:kJCModel_ShowReturnVisitListMyItem];
    [mutableDict setValue:self.comments forKey:kJCModel_ShowReturnVisitListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_ShowReturnVisitListId];
    [mutableDict setValue:self.outStatus forKey:kJCModel_ShowReturnVisitListOutStatus];
    [mutableDict setValue:self.inOutId forKey:kJCModel_ShowReturnVisitListInOutId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_ShowReturnVisitListGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_ShowReturnVisitListCusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vtype] forKey:kJCModel_ShowReturnVisitListVtype];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_ShowReturnVisitListCustomer];
    [mutableDict setValue:self.createTime forKey:kJCModel_ShowReturnVisitListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_ShowReturnVisitListItems];

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

    self.myItem = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListMyItem];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListComments];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitListId];
    self.outStatus = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListOutStatus];
    self.inOutId = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListInOutId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitListGuide];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitListCusId];
    self.vtype = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitListVtype];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListCustomer];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitListItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_myItem forKey:kJCModel_ShowReturnVisitListMyItem];
    [aCoder encodeObject:_comments forKey:kJCModel_ShowReturnVisitListComments];
    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_ShowReturnVisitListId];
    [aCoder encodeObject:_outStatus forKey:kJCModel_ShowReturnVisitListOutStatus];
    [aCoder encodeObject:_inOutId forKey:kJCModel_ShowReturnVisitListInOutId];
    [aCoder encodeDouble:_guide forKey:kJCModel_ShowReturnVisitListGuide];
    [aCoder encodeDouble:_cusId forKey:kJCModel_ShowReturnVisitListCusId];
    [aCoder encodeDouble:_vtype forKey:kJCModel_ShowReturnVisitListVtype];
    [aCoder encodeObject:_customer forKey:kJCModel_ShowReturnVisitListCustomer];
    [aCoder encodeObject:_createTime forKey:kJCModel_ShowReturnVisitListCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_ShowReturnVisitListItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitList *copy = [[JCModel_ShowReturnVisitList alloc] init];
    
    
    
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
