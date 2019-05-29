//
//  JCModel_stopPurchaserOrderBase.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_stopPurchaserOrderBase.h"
#import "JCModel_stopPurchaserOrderPurchaserOrder.h"


NSString *const kJCModel_stopPurchaserOrderBaseCommand = @"command";
NSString *const kJCModel_stopPurchaserOrderBaseCurrent = @"current";
NSString *const kJCModel_stopPurchaserOrderBasePurchaserOrder = @"purchaserOrder";


@interface JCModel_stopPurchaserOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_stopPurchaserOrderBase

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
            self.command = [self objectOrNilForKey:kJCModel_stopPurchaserOrderBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_stopPurchaserOrderBaseCurrent fromDictionary:dict];
            self.purchaserOrder = [JCModel_stopPurchaserOrderPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_stopPurchaserOrderBasePurchaserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_stopPurchaserOrderBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_stopPurchaserOrderBaseCurrent];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_stopPurchaserOrderBasePurchaserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_stopPurchaserOrderBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_stopPurchaserOrderBaseCurrent];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_stopPurchaserOrderBasePurchaserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_stopPurchaserOrderBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_stopPurchaserOrderBaseCurrent];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_stopPurchaserOrderBasePurchaserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_stopPurchaserOrderBase *copy = [[JCModel_stopPurchaserOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
