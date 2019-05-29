//
//  JCModel_stopFranchiserSaleFranchiserInOutOrder.m
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_stopFranchiserSaleFranchiserInOutOrder.h"


NSString *const kJCModel_stopFranchiserSaleFranchiserInOutOrderId = @"id";


@interface JCModel_stopFranchiserSaleFranchiserInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_stopFranchiserSaleFranchiserInOutOrder

@synthesize franchiserInOutOrderIdentifier = _franchiserInOutOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserInOutOrderIdentifier = [self objectOrNilForKey:kJCModel_stopFranchiserSaleFranchiserInOutOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserInOutOrderIdentifier forKey:kJCModel_stopFranchiserSaleFranchiserInOutOrderId];

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

    self.franchiserInOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_stopFranchiserSaleFranchiserInOutOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserInOutOrderIdentifier forKey:kJCModel_stopFranchiserSaleFranchiserInOutOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_stopFranchiserSaleFranchiserInOutOrder *copy = [[JCModel_stopFranchiserSaleFranchiserInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserInOutOrderIdentifier = [self.franchiserInOutOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
