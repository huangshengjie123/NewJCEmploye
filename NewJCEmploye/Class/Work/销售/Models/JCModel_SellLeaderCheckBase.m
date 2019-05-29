//
//  JCModel_SellLeaderCheckBase.m
//
//  Created by   on 2018/7/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellLeaderCheckBase.h"
#import "JCModel_SellLeaderCheckOrder.h"


NSString *const kJCModel_SellLeaderCheckBaseCurrent = @"current";
NSString *const kJCModel_SellLeaderCheckBaseOrder = @"order";
NSString *const kJCModel_SellLeaderCheckBaseLeaderPass = @"leaderPass";
NSString *const kJCModel_SellLeaderCheckBaseCommand = @"command";


@interface JCModel_SellLeaderCheckBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellLeaderCheckBase

@synthesize current = _current;
@synthesize order = _order;
@synthesize leaderPass = _leaderPass;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_SellLeaderCheckBaseCurrent fromDictionary:dict];
            self.order = [JCModel_SellLeaderCheckOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_SellLeaderCheckBaseOrder]];
            self.leaderPass = [[self objectOrNilForKey:kJCModel_SellLeaderCheckBaseLeaderPass fromDictionary:dict] boolValue];
            self.command = [self objectOrNilForKey:kJCModel_SellLeaderCheckBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_SellLeaderCheckBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_SellLeaderCheckBaseOrder];
    [mutableDict setValue:[NSNumber numberWithBool:self.leaderPass] forKey:kJCModel_SellLeaderCheckBaseLeaderPass];
    [mutableDict setValue:self.command forKey:kJCModel_SellLeaderCheckBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_SellLeaderCheckBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_SellLeaderCheckBaseOrder];
    self.leaderPass = [aDecoder decodeBoolForKey:kJCModel_SellLeaderCheckBaseLeaderPass];
    self.command = [aDecoder decodeObjectForKey:kJCModel_SellLeaderCheckBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_SellLeaderCheckBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_SellLeaderCheckBaseOrder];
    [aCoder encodeBool:_leaderPass forKey:kJCModel_SellLeaderCheckBaseLeaderPass];
    [aCoder encodeObject:_command forKey:kJCModel_SellLeaderCheckBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellLeaderCheckBase *copy = [[JCModel_SellLeaderCheckBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.leaderPass = self.leaderPass;
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
