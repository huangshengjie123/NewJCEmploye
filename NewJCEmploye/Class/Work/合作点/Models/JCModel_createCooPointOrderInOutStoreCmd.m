//
//  JCModel_createCooPointOrderInOutStoreCmd.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createCooPointOrderInOutStoreCmd.h"
#import "JCModel_createCooPointOrderInOutOrder.h"


NSString *const kJCModel_createCooPointOrderInOutStoreCmdCommand = @"command";
NSString *const kJCModel_createCooPointOrderInOutStoreCmdCurrent = @"current";
NSString *const kJCModel_createCooPointOrderInOutStoreCmdInOutOrder = @"inOutOrder";


@interface JCModel_createCooPointOrderInOutStoreCmd ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createCooPointOrderInOutStoreCmd

@synthesize command = _command;
@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_createCooPointOrderInOutStoreCmdCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_createCooPointOrderInOutStoreCmdCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_createCooPointOrderInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_createCooPointOrderInOutStoreCmdInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_createCooPointOrderInOutStoreCmdCommand];
    [mutableDict setValue:self.current forKey:kJCModel_createCooPointOrderInOutStoreCmdCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_createCooPointOrderInOutStoreCmdInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderInOutStoreCmdCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderInOutStoreCmdCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_createCooPointOrderInOutStoreCmdInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_createCooPointOrderInOutStoreCmdCommand];
    [aCoder encodeObject:_current forKey:kJCModel_createCooPointOrderInOutStoreCmdCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_createCooPointOrderInOutStoreCmdInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createCooPointOrderInOutStoreCmd *copy = [[JCModel_createCooPointOrderInOutStoreCmd alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
