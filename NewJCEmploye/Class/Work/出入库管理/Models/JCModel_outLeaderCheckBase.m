//
//  JCModel_outLeaderCheckBase.m
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_outLeaderCheckBase.h"
#import "JCModel_outLeaderCheckInOutOrder.h"


NSString *const kJCModel_outLeaderCheckBaseCurrent = @"current";
NSString *const kJCModel_outLeaderCheckBaseIsLeaderCheck = @"isLeaderCheck";
NSString *const kJCModel_outLeaderCheckBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_outLeaderCheckBaseCommand = @"command";


@interface JCModel_outLeaderCheckBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_outLeaderCheckBase

@synthesize current = _current;
@synthesize isLeaderCheck = _isLeaderCheck;
@synthesize inOutOrder = _inOutOrder;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_outLeaderCheckBaseCurrent fromDictionary:dict];
            self.isLeaderCheck = [[self objectOrNilForKey:kJCModel_outLeaderCheckBaseIsLeaderCheck fromDictionary:dict] boolValue];
            self.inOutOrder = [JCModel_outLeaderCheckInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_outLeaderCheckBaseInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_outLeaderCheckBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_outLeaderCheckBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLeaderCheck] forKey:kJCModel_outLeaderCheckBaseIsLeaderCheck];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_outLeaderCheckBaseInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_outLeaderCheckBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_outLeaderCheckBaseCurrent];
    self.isLeaderCheck = [aDecoder decodeBoolForKey:kJCModel_outLeaderCheckBaseIsLeaderCheck];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_outLeaderCheckBaseInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_outLeaderCheckBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_outLeaderCheckBaseCurrent];
    [aCoder encodeBool:_isLeaderCheck forKey:kJCModel_outLeaderCheckBaseIsLeaderCheck];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_outLeaderCheckBaseInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_outLeaderCheckBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_outLeaderCheckBase *copy = [[JCModel_outLeaderCheckBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.isLeaderCheck = self.isLeaderCheck;
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
