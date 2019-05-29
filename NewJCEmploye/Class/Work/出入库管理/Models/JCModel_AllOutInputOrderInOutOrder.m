//
//  JCModel_AllOutInputOrderInOutOrder.m
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AllOutInputOrderInOutOrder.h"
#import "JCModel_AllOutInputOrderItems.h"


NSString *const kJCModel_AllOutInputOrderInOutOrderId = @"id";
NSString *const kJCModel_AllOutInputOrderInOutOrderComments = @"comments";
NSString *const kJCModel_AllOutInputOrderInOutOrderProcessId = @"processId";
NSString *const kJCModel_AllOutInputOrderInOutOrderType = @"type";
NSString *const kJCModel_AllOutInputOrderInOutOrderChecker = @"checker";
NSString *const kJCModel_AllOutInputOrderInOutOrderCreateTime = @"createTime";
NSString *const kJCModel_AllOutInputOrderInOutOrderEndTime = @"endTime";
NSString *const kJCModel_AllOutInputOrderInOutOrderReason = @"reason";
NSString *const kJCModel_AllOutInputOrderInOutOrderItems = @"items";
NSString *const kJCModel_AllOutInputOrderInOutOrderStoreHouse = @"storeHouse";
NSString *const kJCModel_AllOutInputOrderInOutOrderApplicant = @"applicant";
NSString *const kJCModel_AllOutInputOrderInOutOrderStatus = @"status";


@interface JCModel_AllOutInputOrderInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AllOutInputOrderInOutOrder

@synthesize inOutOrderIdentifier = _inOutOrderIdentifier;
@synthesize comments = _comments;
@synthesize processId = _processId;
@synthesize type = _type;
@synthesize checker = _checker;
@synthesize createTime = _createTime;
@synthesize endTime = _endTime;
@synthesize reason = _reason;
@synthesize items = _items;
@synthesize storeHouse = _storeHouse;
@synthesize applicant = _applicant;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inOutOrderIdentifier = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderComments fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderProcessId fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderType fromDictionary:dict] doubleValue];
            self.checker = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderChecker fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderCreateTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderEndTime fromDictionary:dict];
            self.reason = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderReason fromDictionary:dict];
    NSObject *receivedJCModel_AllOutInputOrderItems = [dict objectForKey:kJCModel_AllOutInputOrderInOutOrderItems];
    NSMutableArray *parsedJCModel_AllOutInputOrderItems = [NSMutableArray array];
    
    if ([receivedJCModel_AllOutInputOrderItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_AllOutInputOrderItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_AllOutInputOrderItems addObject:[JCModel_AllOutInputOrderItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_AllOutInputOrderItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_AllOutInputOrderItems addObject:[JCModel_AllOutInputOrderItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_AllOutInputOrderItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_AllOutInputOrderItems];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderStoreHouse fromDictionary:dict] doubleValue];
            self.applicant = [[self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderApplicant fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kJCModel_AllOutInputOrderInOutOrderStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.inOutOrderIdentifier forKey:kJCModel_AllOutInputOrderInOutOrderId];
    [mutableDict setValue:self.comments forKey:kJCModel_AllOutInputOrderInOutOrderComments];
    [mutableDict setValue:self.processId forKey:kJCModel_AllOutInputOrderInOutOrderProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_AllOutInputOrderInOutOrderType];
    [mutableDict setValue:self.checker forKey:kJCModel_AllOutInputOrderInOutOrderChecker];
    [mutableDict setValue:self.createTime forKey:kJCModel_AllOutInputOrderInOutOrderCreateTime];
    [mutableDict setValue:self.endTime forKey:kJCModel_AllOutInputOrderInOutOrderEndTime];
    [mutableDict setValue:self.reason forKey:kJCModel_AllOutInputOrderInOutOrderReason];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_AllOutInputOrderInOutOrderItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_AllOutInputOrderInOutOrderStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_AllOutInputOrderInOutOrderApplicant];
    [mutableDict setValue:self.status forKey:kJCModel_AllOutInputOrderInOutOrderStatus];

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

    self.inOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderComments];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderProcessId];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_AllOutInputOrderInOutOrderType];
    self.checker = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderChecker];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderCreateTime];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderEndTime];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderReason];
    self.items = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderItems];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_AllOutInputOrderInOutOrderStoreHouse];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_AllOutInputOrderInOutOrderApplicant];
    self.status = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderInOutOrderStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inOutOrderIdentifier forKey:kJCModel_AllOutInputOrderInOutOrderId];
    [aCoder encodeObject:_comments forKey:kJCModel_AllOutInputOrderInOutOrderComments];
    [aCoder encodeObject:_processId forKey:kJCModel_AllOutInputOrderInOutOrderProcessId];
    [aCoder encodeDouble:_type forKey:kJCModel_AllOutInputOrderInOutOrderType];
    [aCoder encodeObject:_checker forKey:kJCModel_AllOutInputOrderInOutOrderChecker];
    [aCoder encodeObject:_createTime forKey:kJCModel_AllOutInputOrderInOutOrderCreateTime];
    [aCoder encodeObject:_endTime forKey:kJCModel_AllOutInputOrderInOutOrderEndTime];
    [aCoder encodeObject:_reason forKey:kJCModel_AllOutInputOrderInOutOrderReason];
    [aCoder encodeObject:_items forKey:kJCModel_AllOutInputOrderInOutOrderItems];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_AllOutInputOrderInOutOrderStoreHouse];
    [aCoder encodeDouble:_applicant forKey:kJCModel_AllOutInputOrderInOutOrderApplicant];
    [aCoder encodeObject:_status forKey:kJCModel_AllOutInputOrderInOutOrderStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AllOutInputOrderInOutOrder *copy = [[JCModel_AllOutInputOrderInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.inOutOrderIdentifier = [self.inOutOrderIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.type = self.type;
        copy.checker = [self.checker copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.storeHouse = self.storeHouse;
        copy.applicant = self.applicant;
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
