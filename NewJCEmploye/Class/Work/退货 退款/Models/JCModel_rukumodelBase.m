//
//  JCModel_rukumodelBase.m
//
//  Created by   on 2019/2/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rukumodelBase.h"
#import "JCModel_rukumodelInOutOrder.h"


NSString *const kJCModel_rukumodelBaseCurrent = @"current";
NSString *const kJCModel_rukumodelBaseInOutOrder = @"inOutOrder";
NSString *const kJCModel_rukumodelBaseCommand = @"command";
NSString *const kJCModel_rukumodelBaseIsStoreInputCheckPass = @"isStoreInputCheckPass";


@interface JCModel_rukumodelBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rukumodelBase

@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;
@synthesize command = _command;
@synthesize isStoreInputCheckPass = _isStoreInputCheckPass;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_rukumodelBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_rukumodelInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_rukumodelBaseInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_rukumodelBaseCommand fromDictionary:dict];
            self.isStoreInputCheckPass = [[self objectOrNilForKey:kJCModel_rukumodelBaseIsStoreInputCheckPass fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_rukumodelBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_rukumodelBaseInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_rukumodelBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isStoreInputCheckPass] forKey:kJCModel_rukumodelBaseIsStoreInputCheckPass];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_rukumodelBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_rukumodelBaseInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_rukumodelBaseCommand];
    self.isStoreInputCheckPass = [aDecoder decodeBoolForKey:kJCModel_rukumodelBaseIsStoreInputCheckPass];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_rukumodelBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_rukumodelBaseInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_rukumodelBaseCommand];
    [aCoder encodeBool:_isStoreInputCheckPass forKey:kJCModel_rukumodelBaseIsStoreInputCheckPass];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rukumodelBase *copy = [[JCModel_rukumodelBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.isStoreInputCheckPass = self.isStoreInputCheckPass;
    }
    
    return copy;
}


@end
