//
//  JCModel_UpCommonInOutInOutOrder.m
//
//  Created by   on 2018/7/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UpCommonInOutInOutOrder.h"
#import "JCModel_UpCommonInOutItems.h"


NSString *const kJCModel_UpCommonInOutInOutOrderItems = @"items";
NSString *const kJCModel_UpCommonInOutInOutOrderReason = @"reason";
NSString *const kJCModel_UpCommonInOutInOutOrderComments = @"comments";
NSString *const kJCModel_UpCommonInOutInOutOrderStoreHouse = @"storeHouse";
NSString *const kJCModel_UpCommonInOutInOutOrderApplicant = @"applicant";
NSString *const kJCModel_UpCommonInOutInOutOrderType = @"type";
NSString *const kJCModel_UpCommonInOutInOutOrderChecker = @"checker";


@interface JCModel_UpCommonInOutInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UpCommonInOutInOutOrder

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
    NSObject *receivedJCModel_UpCommonInOutItems = [dict objectForKey:kJCModel_UpCommonInOutInOutOrderItems];
    NSMutableArray *parsedJCModel_UpCommonInOutItems = [NSMutableArray array];
    
    if ([receivedJCModel_UpCommonInOutItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_UpCommonInOutItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_UpCommonInOutItems addObject:[JCModel_UpCommonInOutItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_UpCommonInOutItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_UpCommonInOutItems addObject:[JCModel_UpCommonInOutItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_UpCommonInOutItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_UpCommonInOutItems];
            self.reason = [self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderReason fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderComments fromDictionary:dict];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderStoreHouse fromDictionary:dict] doubleValue];
            self.applicant = [[self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderApplicant fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderType fromDictionary:dict] doubleValue];
            self.checker = [[self objectOrNilForKey:kJCModel_UpCommonInOutInOutOrderChecker fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_UpCommonInOutInOutOrderItems];
    [mutableDict setValue:self.reason forKey:kJCModel_UpCommonInOutInOutOrderReason];
    [mutableDict setValue:self.comments forKey:kJCModel_UpCommonInOutInOutOrderComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_UpCommonInOutInOutOrderStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_UpCommonInOutInOutOrderApplicant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_UpCommonInOutInOutOrderType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checker] forKey:kJCModel_UpCommonInOutInOutOrderChecker];

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

    self.items = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutInOutOrderItems];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutInOutOrderReason];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutInOutOrderComments];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_UpCommonInOutInOutOrderStoreHouse];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_UpCommonInOutInOutOrderApplicant];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_UpCommonInOutInOutOrderType];
    self.checker = [aDecoder decodeDoubleForKey:kJCModel_UpCommonInOutInOutOrderChecker];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kJCModel_UpCommonInOutInOutOrderItems];
    [aCoder encodeObject:_reason forKey:kJCModel_UpCommonInOutInOutOrderReason];
    [aCoder encodeObject:_comments forKey:kJCModel_UpCommonInOutInOutOrderComments];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_UpCommonInOutInOutOrderStoreHouse];
    [aCoder encodeDouble:_applicant forKey:kJCModel_UpCommonInOutInOutOrderApplicant];
    [aCoder encodeDouble:_type forKey:kJCModel_UpCommonInOutInOutOrderType];
    [aCoder encodeDouble:_checker forKey:kJCModel_UpCommonInOutInOutOrderChecker];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UpCommonInOutInOutOrder *copy = [[JCModel_UpCommonInOutInOutOrder alloc] init];
    
    
    
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
