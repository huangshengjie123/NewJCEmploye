//
//  JCModel_warehouseRejectJsonBase.m
//
//  Created by   on 2018/5/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_warehouseRejectJsonBase.h"
#import "JCModel_warehouseRejectJsonInOutOrder.h"


NSString *const kJCModel_warehouseRejectJsonBaseCurrent = @"current";
NSString *const kJCModel_warehouseRejectJsonBaseIsStoreOutCheckPass = @"isStoreOutCheckPass";
NSString *const kJCModel_warehouseRejectJsonBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_warehouseRejectJsonBaseCommand = @"command";
NSString *const kJCModel_warehouseRejectJsonBaseBackReason = @"backReason";


@interface JCModel_warehouseRejectJsonBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_warehouseRejectJsonBase

@synthesize current = _current;
@synthesize isStoreOutCheckPass = _isStoreOutCheckPass;
@synthesize inOutOrder = _inOutOrder;
@synthesize command = _command;
@synthesize backReason = _backReason;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_warehouseRejectJsonBaseCurrent fromDictionary:dict];
            self.isStoreOutCheckPass = [[self objectOrNilForKey:kJCModel_warehouseRejectJsonBaseIsStoreOutCheckPass fromDictionary:dict] boolValue];
            self.inOutOrder = [JCModel_warehouseRejectJsonInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_warehouseRejectJsonBaseInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_warehouseRejectJsonBaseCommand fromDictionary:dict];
            self.backReason = [self objectOrNilForKey:kJCModel_warehouseRejectJsonBaseBackReason fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_warehouseRejectJsonBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isStoreOutCheckPass] forKey:kJCModel_warehouseRejectJsonBaseIsStoreOutCheckPass];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_warehouseRejectJsonBaseInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_warehouseRejectJsonBaseCommand];
    [mutableDict setValue:self.backReason forKey:kJCModel_warehouseRejectJsonBaseBackReason];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_warehouseRejectJsonBaseCurrent];
    self.isStoreOutCheckPass = [aDecoder decodeBoolForKey:kJCModel_warehouseRejectJsonBaseIsStoreOutCheckPass];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_warehouseRejectJsonBaseInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_warehouseRejectJsonBaseCommand];
    self.backReason = [aDecoder decodeObjectForKey:kJCModel_warehouseRejectJsonBaseBackReason];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_warehouseRejectJsonBaseCurrent];
    [aCoder encodeBool:_isStoreOutCheckPass forKey:kJCModel_warehouseRejectJsonBaseIsStoreOutCheckPass];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_warehouseRejectJsonBaseInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_warehouseRejectJsonBaseCommand];
    [aCoder encodeObject:_backReason forKey:kJCModel_warehouseRejectJsonBaseBackReason];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_warehouseRejectJsonBase *copy = [[JCModel_warehouseRejectJsonBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.isStoreOutCheckPass = self.isStoreOutCheckPass;
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.backReason = [self.backReason copyWithZone:zone];
    }
    
    return copy;
}


@end
