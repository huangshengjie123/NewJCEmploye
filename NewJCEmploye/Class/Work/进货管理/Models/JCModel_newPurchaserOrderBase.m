//
//  JCModel_newPurchaserOrderBase.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newPurchaserOrderBase.h"
#import "JCModel_newPurchaserOrderPurchaserOrder.h"


NSString *const kJCModel_newPurchaserOrderBaseCommand = @"command";
NSString *const kJCModel_newPurchaserOrderBasePurchaserOrder = @"purchaserOrder";


@interface JCModel_newPurchaserOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newPurchaserOrderBase

@synthesize command = _command;
@synthesize purchaserOrder = _purchaserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_newPurchaserOrderBaseCommand fromDictionary:dict];
            self.purchaserOrder = [JCModel_newPurchaserOrderPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_newPurchaserOrderBasePurchaserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_newPurchaserOrderBaseCommand];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_newPurchaserOrderBasePurchaserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderBaseCommand];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_newPurchaserOrderBasePurchaserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_newPurchaserOrderBaseCommand];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_newPurchaserOrderBasePurchaserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newPurchaserOrderBase *copy = [[JCModel_newPurchaserOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
