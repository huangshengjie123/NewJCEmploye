//
//  JCModel_deletetuihuoRefundment.m
//
//  Created by   on 2019/3/28
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_deletetuihuoRefundment.h"


NSString *const kJCModel_deletetuihuoRefundmentId = @"id";


@interface JCModel_deletetuihuoRefundment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_deletetuihuoRefundment

@synthesize refundmentIdentifier = _refundmentIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.refundmentIdentifier = [self objectOrNilForKey:kJCModel_deletetuihuoRefundmentId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.refundmentIdentifier forKey:kJCModel_deletetuihuoRefundmentId];

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

    self.refundmentIdentifier = [aDecoder decodeObjectForKey:kJCModel_deletetuihuoRefundmentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_refundmentIdentifier forKey:kJCModel_deletetuihuoRefundmentId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_deletetuihuoRefundment *copy = [[JCModel_deletetuihuoRefundment alloc] init];
    
    
    
    if (copy) {

        copy.refundmentIdentifier = [self.refundmentIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
