//
//  JCModel_distribute_confirmBase.m
//
//  Created by   on 2018/9/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_distribute_confirmBase.h"
#import "JCModel_distribute_confirmPurchaserOrder.h"


NSString *const kJCModel_distribute_confirmBaseGetStoreCheck = @"getStoreCheck";
NSString *const kJCModel_distribute_confirmBaseCurrent = @"current";
NSString *const kJCModel_distribute_confirmBasePurchaserOrder = @"purchaserOrder";
NSString *const kJCModel_distribute_confirmBaseCommand = @"command";


@interface JCModel_distribute_confirmBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_distribute_confirmBase

@synthesize getStoreCheck = _getStoreCheck;
@synthesize current = _current;
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
            self.getStoreCheck = [self objectOrNilForKey:kJCModel_distribute_confirmBaseGetStoreCheck fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_distribute_confirmBaseCurrent fromDictionary:dict];
            self.purchaserOrder = [JCModel_distribute_confirmPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_distribute_confirmBasePurchaserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_distribute_confirmBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.getStoreCheck forKey:kJCModel_distribute_confirmBaseGetStoreCheck];
    [mutableDict setValue:self.current forKey:kJCModel_distribute_confirmBaseCurrent];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_distribute_confirmBasePurchaserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_distribute_confirmBaseCommand];

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

    self.getStoreCheck = [aDecoder decodeObjectForKey:kJCModel_distribute_confirmBaseGetStoreCheck];
    self.current = [aDecoder decodeObjectForKey:kJCModel_distribute_confirmBaseCurrent];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_distribute_confirmBasePurchaserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_distribute_confirmBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_getStoreCheck forKey:kJCModel_distribute_confirmBaseGetStoreCheck];
    [aCoder encodeObject:_current forKey:kJCModel_distribute_confirmBaseCurrent];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_distribute_confirmBasePurchaserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_distribute_confirmBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_distribute_confirmBase *copy = [[JCModel_distribute_confirmBase alloc] init];
    
    
    
    if (copy) {

        copy.getStoreCheck = [self.getStoreCheck copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
