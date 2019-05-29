//
//  JCModel_outLeaderCheckInOutOrder.m
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_outLeaderCheckInOutOrder.h"


NSString *const kJCModel_outLeaderCheckInOutOrderId = @"id";


@interface JCModel_outLeaderCheckInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_outLeaderCheckInOutOrder

@synthesize inOutOrderIdentifier = _inOutOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inOutOrderIdentifier = [self objectOrNilForKey:kJCModel_outLeaderCheckInOutOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.inOutOrderIdentifier forKey:kJCModel_outLeaderCheckInOutOrderId];

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

    self.inOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_outLeaderCheckInOutOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inOutOrderIdentifier forKey:kJCModel_outLeaderCheckInOutOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_outLeaderCheckInOutOrder *copy = [[JCModel_outLeaderCheckInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.inOutOrderIdentifier = [self.inOutOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
