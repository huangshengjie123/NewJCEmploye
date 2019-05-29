//
//  JCModel_dealFranchiserInOutOrderFranchiserInOutOrder.m
//
//  Created by   on 2018/9/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserInOutOrderFranchiserInOutOrder.h"
#import "JCModel_dealFranchiserInOutOrderItems.h"


NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStatus = @"status";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderFranchiser = @"franchiser";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderReason = @"reason";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderId = @"id";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderComments = @"comments";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStoreHouse = @"storeHouse";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderApplicant = @"applicant";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderType = @"type";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderCreateTime = @"createTime";
NSString *const kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderItems = @"items";


@interface JCModel_dealFranchiserInOutOrderFranchiserInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserInOutOrderFranchiserInOutOrder

@synthesize status = _status;
@synthesize franchiser = _franchiser;
@synthesize reason = _reason;
@synthesize franchiserInOutOrderIdentifier = _franchiserInOutOrderIdentifier;
@synthesize comments = _comments;
@synthesize storeHouse = _storeHouse;
@synthesize applicant = _applicant;
@synthesize type = _type;
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
            self.status = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStatus fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderFranchiser fromDictionary:dict];
            self.reason = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderReason fromDictionary:dict];
            self.franchiserInOutOrderIdentifier = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderComments fromDictionary:dict];
            self.storeHouse = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStoreHouse fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderApplicant fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderType fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_dealFranchiserInOutOrderItems = [dict objectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderItems];
    NSMutableArray *parsedJCModel_dealFranchiserInOutOrderItems = [NSMutableArray array];
    
    if ([receivedJCModel_dealFranchiserInOutOrderItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_dealFranchiserInOutOrderItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_dealFranchiserInOutOrderItems addObject:[JCModel_dealFranchiserInOutOrderItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_dealFranchiserInOutOrderItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_dealFranchiserInOutOrderItems addObject:[JCModel_dealFranchiserInOutOrderItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_dealFranchiserInOutOrderItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_dealFranchiserInOutOrderItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStatus];
    [mutableDict setValue:self.franchiser forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderFranchiser];
    [mutableDict setValue:self.reason forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderReason];
    [mutableDict setValue:self.franchiserInOutOrderIdentifier forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderId];
    [mutableDict setValue:self.comments forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderComments];
    [mutableDict setValue:self.storeHouse forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderApplicant];
    [mutableDict setValue:self.type forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderType];
    [mutableDict setValue:self.createTime forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderItems];

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

    self.status = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStatus];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderFranchiser];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderReason];
    self.franchiserInOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderComments];
    self.storeHouse = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStoreHouse];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderApplicant];
    self.type = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderType];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStatus];
    [aCoder encodeObject:_franchiser forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderFranchiser];
    [aCoder encodeObject:_reason forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderReason];
    [aCoder encodeObject:_franchiserInOutOrderIdentifier forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderId];
    [aCoder encodeObject:_comments forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderComments];
    [aCoder encodeObject:_storeHouse forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderStoreHouse];
    [aCoder encodeDouble:_applicant forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderApplicant];
    [aCoder encodeObject:_type forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderType];
    [aCoder encodeObject:_createTime forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_dealFranchiserInOutOrderFranchiserInOutOrderItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserInOutOrderFranchiserInOutOrder *copy = [[JCModel_dealFranchiserInOutOrderFranchiserInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.franchiserInOutOrderIdentifier = [self.franchiserInOutOrderIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.storeHouse = [self.storeHouse copyWithZone:zone];
        copy.applicant = self.applicant;
        copy.type = [self.type copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
