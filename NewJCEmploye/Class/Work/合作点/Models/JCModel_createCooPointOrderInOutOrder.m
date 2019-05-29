//
//  JCModel_createCooPointOrderInOutOrder.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createCooPointOrderInOutOrder.h"


NSString *const kJCModel_createCooPointOrderInOutOrderChecker = @"checkerM";
NSString *const kJCModel_createCooPointOrderInOutOrderStoreHouse = @"storeHouse";


@interface JCModel_createCooPointOrderInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createCooPointOrderInOutOrder

@synthesize checkerM = _checkerM;
@synthesize storeHouse = _storeHouse;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.checkerM = [[self objectOrNilForKey:kJCModel_createCooPointOrderInOutOrderChecker fromDictionary:dict] doubleValue];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_createCooPointOrderInOutOrderStoreHouse fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkerM] forKey:kJCModel_createCooPointOrderInOutOrderChecker];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_createCooPointOrderInOutOrderStoreHouse];

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

    self.checkerM = [aDecoder decodeDoubleForKey:kJCModel_createCooPointOrderInOutOrderChecker];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_createCooPointOrderInOutOrderStoreHouse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_checkerM forKey:kJCModel_createCooPointOrderInOutOrderChecker];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_createCooPointOrderInOutOrderStoreHouse];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createCooPointOrderInOutOrder *copy = [[JCModel_createCooPointOrderInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.checkerM = self.checkerM;
        copy.storeHouse = self.storeHouse;
    }
    
    return copy;
}


@end
