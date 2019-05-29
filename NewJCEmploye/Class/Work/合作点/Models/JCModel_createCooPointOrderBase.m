//
//  JCModel_createCooPointOrderBase.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createCooPointOrderBase.h"
#import "JCModel_createCooPointOrderInOutStoreCmd.h"
#import "JCModel_createCooPointOrderCooPointOrder.h"


NSString *const kJCModel_createCooPointOrderBaseInOutStoreCmd = @"inOutStoreCmd";
NSString *const kJCModel_createCooPointOrderBaseCooPointOrder = @"cooPointOrder";


@interface JCModel_createCooPointOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createCooPointOrderBase

@synthesize inOutStoreCmd = _inOutStoreCmd;
@synthesize cooPointOrder = _cooPointOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inOutStoreCmd = [JCModel_createCooPointOrderInOutStoreCmd modelObjectWithDictionary:[dict objectForKey:kJCModel_createCooPointOrderBaseInOutStoreCmd]];
            self.cooPointOrder = [JCModel_createCooPointOrderCooPointOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_createCooPointOrderBaseCooPointOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.inOutStoreCmd dictionaryRepresentation] forKey:kJCModel_createCooPointOrderBaseInOutStoreCmd];
    [mutableDict setValue:[self.cooPointOrder dictionaryRepresentation] forKey:kJCModel_createCooPointOrderBaseCooPointOrder];

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

    self.inOutStoreCmd = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderBaseInOutStoreCmd];
    self.cooPointOrder = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderBaseCooPointOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inOutStoreCmd forKey:kJCModel_createCooPointOrderBaseInOutStoreCmd];
    [aCoder encodeObject:_cooPointOrder forKey:kJCModel_createCooPointOrderBaseCooPointOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createCooPointOrderBase *copy = [[JCModel_createCooPointOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.inOutStoreCmd = [self.inOutStoreCmd copyWithZone:zone];
        copy.cooPointOrder = [self.cooPointOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
