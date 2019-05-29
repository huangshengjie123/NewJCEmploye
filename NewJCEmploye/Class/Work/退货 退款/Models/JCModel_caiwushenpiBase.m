//
//  JCModel_caiwushenpiBase.m
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_caiwushenpiBase.h"
#import "JCModel_caiwushenpiRefundment.h"


NSString *const kJCModel_caiwushenpiBaseRefundment = @"refundment";
NSString *const kJCModel_caiwushenpiBaseCurrent = @"current";
NSString *const kJCModel_caiwushenpiBaseCommand = @"command";
NSString *const kJCModel_caiwushenpiBasePassCheck = @"passCheck";


@interface JCModel_caiwushenpiBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_caiwushenpiBase

@synthesize refundment = _refundment;
@synthesize current = _current;
@synthesize command = _command;
@synthesize passCheck = _passCheck;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.refundment = [JCModel_caiwushenpiRefundment modelObjectWithDictionary:[dict objectForKey:kJCModel_caiwushenpiBaseRefundment]];
            self.current = [self objectOrNilForKey:kJCModel_caiwushenpiBaseCurrent fromDictionary:dict];
            self.command = [self objectOrNilForKey:kJCModel_caiwushenpiBaseCommand fromDictionary:dict];
            self.passCheck = [[self objectOrNilForKey:kJCModel_caiwushenpiBasePassCheck fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.refundment dictionaryRepresentation] forKey:kJCModel_caiwushenpiBaseRefundment];
    [mutableDict setValue:self.current forKey:kJCModel_caiwushenpiBaseCurrent];
    [mutableDict setValue:self.command forKey:kJCModel_caiwushenpiBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.passCheck] forKey:kJCModel_caiwushenpiBasePassCheck];

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

    self.refundment = [aDecoder decodeObjectForKey:kJCModel_caiwushenpiBaseRefundment];
    self.current = [aDecoder decodeObjectForKey:kJCModel_caiwushenpiBaseCurrent];
    self.command = [aDecoder decodeObjectForKey:kJCModel_caiwushenpiBaseCommand];
    self.passCheck = [aDecoder decodeBoolForKey:kJCModel_caiwushenpiBasePassCheck];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_refundment forKey:kJCModel_caiwushenpiBaseRefundment];
    [aCoder encodeObject:_current forKey:kJCModel_caiwushenpiBaseCurrent];
    [aCoder encodeObject:_command forKey:kJCModel_caiwushenpiBaseCommand];
    [aCoder encodeBool:_passCheck forKey:kJCModel_caiwushenpiBasePassCheck];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_caiwushenpiBase *copy = [[JCModel_caiwushenpiBase alloc] init];
    
    
    
    if (copy) {

        copy.refundment = [self.refundment copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.passCheck = self.passCheck;
    }
    
    return copy;
}


@end
