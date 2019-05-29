//
//  JCModel_newReturnGoods2Refundment.m
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnGoods2Refundment.h"
#import "JCModel_newReturnGoods2RefundmentCosts.h"


NSString *const kJCModel_newReturnGoods2RefundmentRefundmentCosts = @"refundmentCosts";
NSString *const kJCModel_newReturnGoods2RefundmentId = @"id";
NSString *const kJCModel_newReturnGoods2RefundmentStoreHouse = @"storeHouse";
NSString *const kJCModel_newReturnGoods2RefundmentRefundment = @"refundment";


@interface JCModel_newReturnGoods2Refundment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnGoods2Refundment

@synthesize refundmentCosts = _refundmentCosts;
@synthesize refundmentIdentifier = _refundmentIdentifier;
@synthesize storeHouse = _storeHouse;
@synthesize refundment = _refundment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_newReturnGoods2RefundmentCosts = [dict objectForKey:kJCModel_newReturnGoods2RefundmentRefundmentCosts];
    NSMutableArray *parsedJCModel_newReturnGoods2RefundmentCosts = [NSMutableArray array];
    
    if ([receivedJCModel_newReturnGoods2RefundmentCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_newReturnGoods2RefundmentCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_newReturnGoods2RefundmentCosts addObject:[JCModel_newReturnGoods2RefundmentCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_newReturnGoods2RefundmentCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_newReturnGoods2RefundmentCosts addObject:[JCModel_newReturnGoods2RefundmentCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_newReturnGoods2RefundmentCosts]];
    }

    self.refundmentCosts = [NSArray arrayWithArray:parsedJCModel_newReturnGoods2RefundmentCosts];
            self.refundmentIdentifier = [self objectOrNilForKey:kJCModel_newReturnGoods2RefundmentId fromDictionary:dict];
            self.storeHouse = [self objectOrNilForKey:kJCModel_newReturnGoods2RefundmentStoreHouse fromDictionary:dict];
            self.refundment = [[self objectOrNilForKey:kJCModel_newReturnGoods2RefundmentRefundment fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForRefundmentCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.refundmentCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRefundmentCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRefundmentCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRefundmentCosts] forKey:kJCModel_newReturnGoods2RefundmentRefundmentCosts];
    [mutableDict setValue:self.refundmentIdentifier forKey:kJCModel_newReturnGoods2RefundmentId];
    [mutableDict setValue:self.storeHouse forKey:kJCModel_newReturnGoods2RefundmentStoreHouse];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refundment] forKey:kJCModel_newReturnGoods2RefundmentRefundment];

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

    self.refundmentCosts = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2RefundmentRefundmentCosts];
    self.refundmentIdentifier = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2RefundmentId];
    self.storeHouse = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2RefundmentStoreHouse];
    self.refundment = [aDecoder decodeDoubleForKey:kJCModel_newReturnGoods2RefundmentRefundment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_refundmentCosts forKey:kJCModel_newReturnGoods2RefundmentRefundmentCosts];
    [aCoder encodeObject:_refundmentIdentifier forKey:kJCModel_newReturnGoods2RefundmentId];
    [aCoder encodeObject:_storeHouse forKey:kJCModel_newReturnGoods2RefundmentStoreHouse];
    [aCoder encodeDouble:_refundment forKey:kJCModel_newReturnGoods2RefundmentRefundment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnGoods2Refundment *copy = [[JCModel_newReturnGoods2Refundment alloc] init];
    
    
    
    if (copy) {

        copy.refundmentCosts = [self.refundmentCosts copyWithZone:zone];
        copy.refundmentIdentifier = [self.refundmentIdentifier copyWithZone:zone];
        copy.storeHouse = [self.storeHouse copyWithZone:zone];
        copy.refundment = self.refundment;
    }
    
    return copy;
}


@end
