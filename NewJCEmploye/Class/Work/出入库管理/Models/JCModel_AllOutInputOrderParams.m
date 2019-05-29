//
//  JCModel_AllOutInputOrderParams.m
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AllOutInputOrderParams.h"
#import "JCModel_AllOutInputOrderInOutOrder.h"


NSString *const kJCModel_AllOutInputOrderParamsCancel = @"cancel";
NSString *const kJCModel_AllOutInputOrderParamsInOutOrder = @"inOutOrder";
NSString *const kJCModel_AllOutInputOrderParamsReason = @"reason";
NSString *const kJCModel_AllOutInputOrderParamsNeedLeaderCheck = @"needLeaderCheck";
NSString *const kJCModel_AllOutInputOrderParamsOutputer = @"outputer";
NSString *const kJCModel_AllOutInputOrderParamsCheckcode = @"checkcode";
NSString *const kJCModel_AllOutInputOrderParamsIsStoreOutCheckPass = @"isStoreOutCheckPass";
NSString *const kJCModel_AllOutInputOrderParamsStoreHourse = @"storeHourse";


@interface JCModel_AllOutInputOrderParams ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AllOutInputOrderParams

@synthesize cancel = _cancel;
@synthesize inOutOrder = _inOutOrder;
@synthesize reason = _reason;
@synthesize needLeaderCheck = _needLeaderCheck;
@synthesize outputer = _outputer;
@synthesize checkcode = _checkcode;
@synthesize isStoreOutCheckPass = _isStoreOutCheckPass;
@synthesize storeHourse = _storeHourse;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cancel = [[self objectOrNilForKey:kJCModel_AllOutInputOrderParamsCancel fromDictionary:dict] boolValue];
            self.inOutOrder = [JCModel_AllOutInputOrderInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_AllOutInputOrderParamsInOutOrder]];
            self.reason = [self objectOrNilForKey:kJCModel_AllOutInputOrderParamsReason fromDictionary:dict];
            self.needLeaderCheck = [[self objectOrNilForKey:kJCModel_AllOutInputOrderParamsNeedLeaderCheck fromDictionary:dict] boolValue];
            self.outputer = [self objectOrNilForKey:kJCModel_AllOutInputOrderParamsOutputer fromDictionary:dict];
            self.checkcode = [self objectOrNilForKey:kJCModel_AllOutInputOrderParamsCheckcode fromDictionary:dict];
            self.isStoreOutCheckPass = [[self objectOrNilForKey:kJCModel_AllOutInputOrderParamsIsStoreOutCheckPass fromDictionary:dict] boolValue];
            self.storeHourse = [self objectOrNilForKey:kJCModel_AllOutInputOrderParamsStoreHourse fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.cancel] forKey:kJCModel_AllOutInputOrderParamsCancel];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_AllOutInputOrderParamsInOutOrder];
    [mutableDict setValue:self.reason forKey:kJCModel_AllOutInputOrderParamsReason];
    [mutableDict setValue:[NSNumber numberWithBool:self.needLeaderCheck] forKey:kJCModel_AllOutInputOrderParamsNeedLeaderCheck];
    [mutableDict setValue:self.outputer forKey:kJCModel_AllOutInputOrderParamsOutputer];
    [mutableDict setValue:self.checkcode forKey:kJCModel_AllOutInputOrderParamsCheckcode];
    [mutableDict setValue:[NSNumber numberWithBool:self.isStoreOutCheckPass] forKey:kJCModel_AllOutInputOrderParamsIsStoreOutCheckPass];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_AllOutInputOrderParamsStoreHourse];

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

    self.cancel = [aDecoder decodeBoolForKey:kJCModel_AllOutInputOrderParamsCancel];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderParamsInOutOrder];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderParamsReason];
    self.needLeaderCheck = [aDecoder decodeBoolForKey:kJCModel_AllOutInputOrderParamsNeedLeaderCheck];
    self.outputer = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderParamsOutputer];
    self.checkcode = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderParamsCheckcode];
    self.isStoreOutCheckPass = [aDecoder decodeBoolForKey:kJCModel_AllOutInputOrderParamsIsStoreOutCheckPass];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderParamsStoreHourse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_cancel forKey:kJCModel_AllOutInputOrderParamsCancel];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_AllOutInputOrderParamsInOutOrder];
    [aCoder encodeObject:_reason forKey:kJCModel_AllOutInputOrderParamsReason];
    [aCoder encodeBool:_needLeaderCheck forKey:kJCModel_AllOutInputOrderParamsNeedLeaderCheck];
    [aCoder encodeObject:_outputer forKey:kJCModel_AllOutInputOrderParamsOutputer];
    [aCoder encodeObject:_checkcode forKey:kJCModel_AllOutInputOrderParamsCheckcode];
    [aCoder encodeBool:_isStoreOutCheckPass forKey:kJCModel_AllOutInputOrderParamsIsStoreOutCheckPass];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_AllOutInputOrderParamsStoreHourse];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AllOutInputOrderParams *copy = [[JCModel_AllOutInputOrderParams alloc] init];
    
    
    
    if (copy) {

        copy.cancel = self.cancel;
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.needLeaderCheck = self.needLeaderCheck;
        copy.outputer = [self.outputer copyWithZone:zone];
        copy.checkcode = [self.checkcode copyWithZone:zone];
        copy.isStoreOutCheckPass = self.isStoreOutCheckPass;
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
    }
    
    return copy;
}


@end
