//
//  JCModel_CooperationPoiontOrderList.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderList.h"
#import "JCModel_CooperationPoiontOrderGuider.h"
#import "JCModel_CooperationPoiontOrderCooPointSimp.h"
#import "JCModel_CooperationPoiontOrderCooPointOrderCosts.h"
#import "JCModel_CooperationPoiontOrderItems.h"


NSString *const kJCModel_CooperationPoiontOrderListId = @"id";
NSString *const kJCModel_CooperationPoiontOrderListComments = @"comments";
NSString *const kJCModel_CooperationPoiontOrderListGuide = @"guide";
NSString *const kJCModel_CooperationPoiontOrderListProcessId = @"processId";
NSString *const kJCModel_CooperationPoiontOrderListLeader = @"leader";
NSString *const kJCModel_CooperationPoiontOrderListHasOut = @"hasOut";
NSString *const kJCModel_CooperationPoiontOrderListGuider = @"guider";
NSString *const kJCModel_CooperationPoiontOrderListCooId = @"cooId";
NSString *const kJCModel_CooperationPoiontOrderListCom = @"com";
NSString *const kJCModel_CooperationPoiontOrderListCooPointSimp = @"cooPointSimp";
NSString *const kJCModel_CooperationPoiontOrderListCooPointOrderCosts = @"cooPointOrderCosts";
NSString *const kJCModel_CooperationPoiontOrderListCreateTime = @"createTime";
NSString *const kJCModel_CooperationPoiontOrderListItems = @"items";
NSString *const kJCModel_CooperationPoiontOrderListStatus = @"status";


@interface JCModel_CooperationPoiontOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize guide = _guide;
@synthesize processId = _processId;
@synthesize leader = _leader;
@synthesize hasOut = _hasOut;
@synthesize guider = _guider;
@synthesize cooId = _cooId;
@synthesize com = _com;
@synthesize cooPointSimp = _cooPointSimp;
@synthesize cooPointOrderCosts = _cooPointOrderCosts;
@synthesize createTime = _createTime;
@synthesize items = _items;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListComments fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderListGuide fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListProcessId fromDictionary:dict];
            self.leader = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListLeader fromDictionary:dict];
            self.hasOut = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderListHasOut fromDictionary:dict] doubleValue];
            self.guider = [JCModel_CooperationPoiontOrderGuider modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationPoiontOrderListGuider]];
            self.cooId = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderListCooId fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListCom fromDictionary:dict];
            self.cooPointSimp = [JCModel_CooperationPoiontOrderCooPointSimp modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationPoiontOrderListCooPointSimp]];
    NSObject *receivedJCModel_CooperationPoiontOrderCooPointOrderCosts = [dict objectForKey:kJCModel_CooperationPoiontOrderListCooPointOrderCosts];
    NSMutableArray *parsedJCModel_CooperationPoiontOrderCooPointOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_CooperationPoiontOrderCooPointOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CooperationPoiontOrderCooPointOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CooperationPoiontOrderCooPointOrderCosts addObject:[JCModel_CooperationPoiontOrderCooPointOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CooperationPoiontOrderCooPointOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CooperationPoiontOrderCooPointOrderCosts addObject:[JCModel_CooperationPoiontOrderCooPointOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CooperationPoiontOrderCooPointOrderCosts]];
    }

    self.cooPointOrderCosts = [NSArray arrayWithArray:parsedJCModel_CooperationPoiontOrderCooPointOrderCosts];
            self.createTime = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_CooperationPoiontOrderItems = [dict objectForKey:kJCModel_CooperationPoiontOrderListItems];
    NSMutableArray *parsedJCModel_CooperationPoiontOrderItems = [NSMutableArray array];
    
    if ([receivedJCModel_CooperationPoiontOrderItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CooperationPoiontOrderItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CooperationPoiontOrderItems addObject:[JCModel_CooperationPoiontOrderItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CooperationPoiontOrderItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CooperationPoiontOrderItems addObject:[JCModel_CooperationPoiontOrderItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CooperationPoiontOrderItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_CooperationPoiontOrderItems];
            self.status = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_CooperationPoiontOrderListId];
    [mutableDict setValue:self.comments forKey:kJCModel_CooperationPoiontOrderListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_CooperationPoiontOrderListGuide];
    [mutableDict setValue:self.processId forKey:kJCModel_CooperationPoiontOrderListProcessId];
    [mutableDict setValue:self.leader forKey:kJCModel_CooperationPoiontOrderListLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasOut] forKey:kJCModel_CooperationPoiontOrderListHasOut];
    [mutableDict setValue:[self.guider dictionaryRepresentation] forKey:kJCModel_CooperationPoiontOrderListGuider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cooId] forKey:kJCModel_CooperationPoiontOrderListCooId];
    [mutableDict setValue:self.com forKey:kJCModel_CooperationPoiontOrderListCom];
    [mutableDict setValue:[self.cooPointSimp dictionaryRepresentation] forKey:kJCModel_CooperationPoiontOrderListCooPointSimp];
    NSMutableArray *tempArrayForCooPointOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.cooPointOrderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCooPointOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCooPointOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCooPointOrderCosts] forKey:kJCModel_CooperationPoiontOrderListCooPointOrderCosts];
    [mutableDict setValue:self.createTime forKey:kJCModel_CooperationPoiontOrderListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_CooperationPoiontOrderListItems];
    [mutableDict setValue:self.status forKey:kJCModel_CooperationPoiontOrderListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListComments];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderListGuide];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListProcessId];
    self.leader = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListLeader];
    self.hasOut = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderListHasOut];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListGuider];
    self.cooId = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderListCooId];
    self.com = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListCom];
    self.cooPointSimp = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListCooPointSimp];
    self.cooPointOrderCosts = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListCooPointOrderCosts];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListItems];
    self.status = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_CooperationPoiontOrderListId];
    [aCoder encodeObject:_comments forKey:kJCModel_CooperationPoiontOrderListComments];
    [aCoder encodeDouble:_guide forKey:kJCModel_CooperationPoiontOrderListGuide];
    [aCoder encodeObject:_processId forKey:kJCModel_CooperationPoiontOrderListProcessId];
    [aCoder encodeObject:_leader forKey:kJCModel_CooperationPoiontOrderListLeader];
    [aCoder encodeDouble:_hasOut forKey:kJCModel_CooperationPoiontOrderListHasOut];
    [aCoder encodeObject:_guider forKey:kJCModel_CooperationPoiontOrderListGuider];
    [aCoder encodeDouble:_cooId forKey:kJCModel_CooperationPoiontOrderListCooId];
    [aCoder encodeObject:_com forKey:kJCModel_CooperationPoiontOrderListCom];
    [aCoder encodeObject:_cooPointSimp forKey:kJCModel_CooperationPoiontOrderListCooPointSimp];
    [aCoder encodeObject:_cooPointOrderCosts forKey:kJCModel_CooperationPoiontOrderListCooPointOrderCosts];
    [aCoder encodeObject:_createTime forKey:kJCModel_CooperationPoiontOrderListCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_CooperationPoiontOrderListItems];
    [aCoder encodeObject:_status forKey:kJCModel_CooperationPoiontOrderListStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderList *copy = [[JCModel_CooperationPoiontOrderList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.guide = self.guide;
        copy.processId = [self.processId copyWithZone:zone];
        copy.leader = [self.leader copyWithZone:zone];
        copy.hasOut = self.hasOut;
        copy.guider = [self.guider copyWithZone:zone];
        copy.cooId = self.cooId;
        copy.com = [self.com copyWithZone:zone];
        copy.cooPointSimp = [self.cooPointSimp copyWithZone:zone];
        copy.cooPointOrderCosts = [self.cooPointOrderCosts copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
