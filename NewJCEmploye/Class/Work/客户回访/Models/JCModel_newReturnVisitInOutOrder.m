//
//  JCModel_newReturnVisitInOutOrder.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnVisitInOutOrder.h"
#import "JCModel_newReturnVisitItems.h"


NSString *const kJCModel_newReturnVisitInOutOrderItems = @"items";
NSString *const kJCModel_newReturnVisitInOutOrderReason = @"reason";
NSString *const kJCModel_newReturnVisitInOutOrderComments = @"comments";
NSString *const kJCModel_newReturnVisitInOutOrderStoreHouse = @"storeHouse";
NSString *const kJCModel_newReturnVisitInOutOrderApplicant = @"applicant";
NSString *const kJCModel_newReturnVisitInOutOrderType = @"type";
NSString *const kJCModel_newReturnVisitInOutOrderChecker = @"checker";


@interface JCModel_newReturnVisitInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnVisitInOutOrder

@synthesize items = _items;
@synthesize reason = _reason;
@synthesize comments = _comments;
@synthesize storeHouse = _storeHouse;
@synthesize applicant = _applicant;
@synthesize type = _type;
@synthesize checker = _checker;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_newReturnVisitItems = [dict objectForKey:kJCModel_newReturnVisitInOutOrderItems];
    NSMutableArray *parsedJCModel_newReturnVisitItems = [NSMutableArray array];
    
    if ([receivedJCModel_newReturnVisitItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_newReturnVisitItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_newReturnVisitItems addObject:[JCModel_newReturnVisitItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_newReturnVisitItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_newReturnVisitItems addObject:[JCModel_newReturnVisitItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_newReturnVisitItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_newReturnVisitItems];
            self.reason = [self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderReason fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderComments fromDictionary:dict];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderStoreHouse fromDictionary:dict] doubleValue];
            self.applicant = [[self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderApplicant fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderType fromDictionary:dict] doubleValue];
            self.checker = [[self objectOrNilForKey:kJCModel_newReturnVisitInOutOrderChecker fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_newReturnVisitInOutOrderItems];
    [mutableDict setValue:self.reason forKey:kJCModel_newReturnVisitInOutOrderReason];
    [mutableDict setValue:self.comments forKey:kJCModel_newReturnVisitInOutOrderComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_newReturnVisitInOutOrderStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_newReturnVisitInOutOrderApplicant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_newReturnVisitInOutOrderType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checker] forKey:kJCModel_newReturnVisitInOutOrderChecker];

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

    self.items = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitInOutOrderItems];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitInOutOrderReason];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitInOutOrderComments];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitInOutOrderStoreHouse];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitInOutOrderApplicant];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitInOutOrderType];
    self.checker = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitInOutOrderChecker];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kJCModel_newReturnVisitInOutOrderItems];
    [aCoder encodeObject:_reason forKey:kJCModel_newReturnVisitInOutOrderReason];
    [aCoder encodeObject:_comments forKey:kJCModel_newReturnVisitInOutOrderComments];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_newReturnVisitInOutOrderStoreHouse];
    [aCoder encodeDouble:_applicant forKey:kJCModel_newReturnVisitInOutOrderApplicant];
    [aCoder encodeDouble:_type forKey:kJCModel_newReturnVisitInOutOrderType];
    [aCoder encodeDouble:_checker forKey:kJCModel_newReturnVisitInOutOrderChecker];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnVisitInOutOrder *copy = [[JCModel_newReturnVisitInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.storeHouse = self.storeHouse;
        copy.applicant = self.applicant;
        copy.type = self.type;
        copy.checker = self.checker;
    }
    
    return copy;
}


@end
