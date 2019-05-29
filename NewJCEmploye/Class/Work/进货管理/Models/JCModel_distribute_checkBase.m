//
//  JCModel_distribute_checkBase.m
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_distribute_checkBase.h"
#import "JCModel_distribute_checkPurchaserOrder.h"


NSString *const kJCModel_distribute_checkBaseCurrent = @"current";
NSString *const kJCModel_distribute_checkBaseDistributeCheck = @"distributeCheck";
NSString *const kJCModel_distribute_checkBasePurchaserOrder = @"purchaserOrder";
NSString *const kJCModel_distribute_checkBaseCommand = @"command";


@interface JCModel_distribute_checkBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_distribute_checkBase

@synthesize current = _current;
@synthesize distributeCheck = _distributeCheck;
@synthesize purchaserOrder = _purchaserOrder;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_distribute_checkBaseCurrent fromDictionary:dict];
            self.distributeCheck = [self objectOrNilForKey:kJCModel_distribute_checkBaseDistributeCheck fromDictionary:dict];
            self.purchaserOrder = [JCModel_distribute_checkPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_distribute_checkBasePurchaserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_distribute_checkBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_distribute_checkBaseCurrent];
    [mutableDict setValue:self.distributeCheck forKey:kJCModel_distribute_checkBaseDistributeCheck];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_distribute_checkBasePurchaserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_distribute_checkBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_distribute_checkBaseCurrent];
    self.distributeCheck = [aDecoder decodeObjectForKey:kJCModel_distribute_checkBaseDistributeCheck];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_distribute_checkBasePurchaserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_distribute_checkBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_distribute_checkBaseCurrent];
    [aCoder encodeObject:_distributeCheck forKey:kJCModel_distribute_checkBaseDistributeCheck];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_distribute_checkBasePurchaserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_distribute_checkBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_distribute_checkBase *copy = [[JCModel_distribute_checkBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.distributeCheck = [self.distributeCheck copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
