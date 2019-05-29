//
//  JCModel_rukucancelBase.m
//
//  Created by   on 2019/2/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rukucancelBase.h"
#import "JCModel_rukucancelInOutOrder.h"


NSString *const kJCModel_rukucancelBaseCommand = @"command";
NSString *const kJCModel_rukucancelBaseCurrent = @"current";
NSString *const kJCModel_rukucancelBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_rukucancelBaseIsStoreInputCheckPass = @"isStoreInputCheckPass";
NSString *const kJCModel_rukucancelBaseBackReason = @"backReason";


@interface JCModel_rukucancelBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rukucancelBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;
@synthesize isStoreInputCheckPass = _isStoreInputCheckPass;
@synthesize backReason = _backReason;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_rukucancelBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_rukucancelBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_rukucancelInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_rukucancelBaseInOutOrder]];
            self.isStoreInputCheckPass = [[self objectOrNilForKey:kJCModel_rukucancelBaseIsStoreInputCheckPass fromDictionary:dict] boolValue];
            self.backReason = [self objectOrNilForKey:kJCModel_rukucancelBaseBackReason fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_rukucancelBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_rukucancelBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_rukucancelBaseInOutOrder];
    [mutableDict setValue:[NSNumber numberWithBool:self.isStoreInputCheckPass] forKey:kJCModel_rukucancelBaseIsStoreInputCheckPass];
    [mutableDict setValue:self.backReason forKey:kJCModel_rukucancelBaseBackReason];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_rukucancelBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_rukucancelBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_rukucancelBaseInOutOrder];
    self.isStoreInputCheckPass = [aDecoder decodeBoolForKey:kJCModel_rukucancelBaseIsStoreInputCheckPass];
    self.backReason = [aDecoder decodeObjectForKey:kJCModel_rukucancelBaseBackReason];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_rukucancelBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_rukucancelBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_rukucancelBaseInOutOrder];
    [aCoder encodeBool:_isStoreInputCheckPass forKey:kJCModel_rukucancelBaseIsStoreInputCheckPass];
    [aCoder encodeObject:_backReason forKey:kJCModel_rukucancelBaseBackReason];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rukucancelBase *copy = [[JCModel_rukucancelBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.isStoreInputCheckPass = self.isStoreInputCheckPass;
        copy.backReason = [self.backReason copyWithZone:zone];
    }
    
    return copy;
}


@end
