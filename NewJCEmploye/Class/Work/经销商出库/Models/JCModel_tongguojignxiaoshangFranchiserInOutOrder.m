//
//  JCModel_tongguojignxiaoshangFranchiserInOutOrder.m
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_tongguojignxiaoshangFranchiserInOutOrder.h"


NSString *const kJCModel_tongguojignxiaoshangFranchiserInOutOrderId = @"id";


@interface JCModel_tongguojignxiaoshangFranchiserInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_tongguojignxiaoshangFranchiserInOutOrder

@synthesize franchiserInOutOrderIdentifier = _franchiserInOutOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserInOutOrderIdentifier = [self objectOrNilForKey:kJCModel_tongguojignxiaoshangFranchiserInOutOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserInOutOrderIdentifier forKey:kJCModel_tongguojignxiaoshangFranchiserInOutOrderId];

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

    self.franchiserInOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_tongguojignxiaoshangFranchiserInOutOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserInOutOrderIdentifier forKey:kJCModel_tongguojignxiaoshangFranchiserInOutOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_tongguojignxiaoshangFranchiserInOutOrder *copy = [[JCModel_tongguojignxiaoshangFranchiserInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserInOutOrderIdentifier = [self.franchiserInOutOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
