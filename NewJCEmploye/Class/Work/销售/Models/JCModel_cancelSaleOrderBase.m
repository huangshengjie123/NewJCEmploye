//
//  JCModel_cancelSaleOrderBase.m
//
//  Created by   on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_cancelSaleOrderBase.h"
#import "JCModel_cancelSaleOrderOrder.h"


NSString *const kJCModel_cancelSaleOrderBaseRollBack = @"rollBack";
NSString *const kJCModel_cancelSaleOrderBaseCurrent = @"current";
NSString *const kJCModel_cancelSaleOrderBaseOrder = @"order";
NSString *const kJCModel_cancelSaleOrderBaseCommand = @"command";


@interface JCModel_cancelSaleOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_cancelSaleOrderBase

@synthesize rollBack = _rollBack;
@synthesize current = _current;
@synthesize order = _order;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.rollBack = [[self objectOrNilForKey:kJCModel_cancelSaleOrderBaseRollBack fromDictionary:dict] boolValue];
            self.current = [self objectOrNilForKey:kJCModel_cancelSaleOrderBaseCurrent fromDictionary:dict];
            self.order = [JCModel_cancelSaleOrderOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_cancelSaleOrderBaseOrder]];
            self.command = [self objectOrNilForKey:kJCModel_cancelSaleOrderBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.rollBack] forKey:kJCModel_cancelSaleOrderBaseRollBack];
    [mutableDict setValue:self.current forKey:kJCModel_cancelSaleOrderBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_cancelSaleOrderBaseOrder];
    [mutableDict setValue:self.command forKey:kJCModel_cancelSaleOrderBaseCommand];

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

    self.rollBack = [aDecoder decodeBoolForKey:kJCModel_cancelSaleOrderBaseRollBack];
    self.current = [aDecoder decodeObjectForKey:kJCModel_cancelSaleOrderBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_cancelSaleOrderBaseOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_cancelSaleOrderBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_rollBack forKey:kJCModel_cancelSaleOrderBaseRollBack];
    [aCoder encodeObject:_current forKey:kJCModel_cancelSaleOrderBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_cancelSaleOrderBaseOrder];
    [aCoder encodeObject:_command forKey:kJCModel_cancelSaleOrderBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_cancelSaleOrderBase *copy = [[JCModel_cancelSaleOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.rollBack = self.rollBack;
        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
