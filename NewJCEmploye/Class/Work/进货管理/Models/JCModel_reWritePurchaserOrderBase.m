//
//  JCModel_reWritePurchaserOrderBase.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reWritePurchaserOrderBase.h"
#import "JCModel_reWritePurchaserOrderPurchaserOrder.h"


NSString *const kJCModel_reWritePurchaserOrderBaseCommand = @"command";
NSString *const kJCModel_reWritePurchaserOrderBaseCurrent = @"current";
NSString *const kJCModel_reWritePurchaserOrderBasePurchaserOrder = @"purchaserOrder";


@interface JCModel_reWritePurchaserOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reWritePurchaserOrderBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize purchaserOrder = _purchaserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_reWritePurchaserOrderBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_reWritePurchaserOrderBaseCurrent fromDictionary:dict];
            self.purchaserOrder = [JCModel_reWritePurchaserOrderPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_reWritePurchaserOrderBasePurchaserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_reWritePurchaserOrderBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_reWritePurchaserOrderBaseCurrent];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_reWritePurchaserOrderBasePurchaserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_reWritePurchaserOrderBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_reWritePurchaserOrderBaseCurrent];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_reWritePurchaserOrderBasePurchaserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_reWritePurchaserOrderBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_reWritePurchaserOrderBaseCurrent];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_reWritePurchaserOrderBasePurchaserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reWritePurchaserOrderBase *copy = [[JCModel_reWritePurchaserOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
