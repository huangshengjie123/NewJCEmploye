//
//  JCModel_tongguojignxiaoshangBase.m
//
//  Created by   on 2019/4/8
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_tongguojignxiaoshangBase.h"
#import "JCModel_tongguojignxiaoshangFranchiserInOutOrder.h"


NSString *const kJCModel_tongguojignxiaoshangBaseCurrent = @"current";
NSString *const kJCModel_tongguojignxiaoshangBaseIsStoreOutCheckPass = @"isStoreOutCheckPass";
NSString *const kJCModel_tongguojignxiaoshangBaseFranchiserInOutOrder = @"franchiserInOutOrder";
NSString *const kJCModel_tongguojignxiaoshangBaseCommand = @"command";


@interface JCModel_tongguojignxiaoshangBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_tongguojignxiaoshangBase

@synthesize current = _current;
@synthesize isStoreOutCheckPass = _isStoreOutCheckPass;
@synthesize franchiserInOutOrder = _franchiserInOutOrder;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_tongguojignxiaoshangBaseCurrent fromDictionary:dict];
            self.isStoreOutCheckPass = [[self objectOrNilForKey:kJCModel_tongguojignxiaoshangBaseIsStoreOutCheckPass fromDictionary:dict] boolValue];
            self.franchiserInOutOrder = [JCModel_tongguojignxiaoshangFranchiserInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_tongguojignxiaoshangBaseFranchiserInOutOrder]];
            self.command = [self objectOrNilForKey:kJCModel_tongguojignxiaoshangBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_tongguojignxiaoshangBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isStoreOutCheckPass] forKey:kJCModel_tongguojignxiaoshangBaseIsStoreOutCheckPass];
    [mutableDict setValue:[self.franchiserInOutOrder dictionaryRepresentation] forKey:kJCModel_tongguojignxiaoshangBaseFranchiserInOutOrder];
    [mutableDict setValue:self.command forKey:kJCModel_tongguojignxiaoshangBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_tongguojignxiaoshangBaseCurrent];
    self.isStoreOutCheckPass = [aDecoder decodeBoolForKey:kJCModel_tongguojignxiaoshangBaseIsStoreOutCheckPass];
    self.franchiserInOutOrder = [aDecoder decodeObjectForKey:kJCModel_tongguojignxiaoshangBaseFranchiserInOutOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_tongguojignxiaoshangBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_tongguojignxiaoshangBaseCurrent];
    [aCoder encodeBool:_isStoreOutCheckPass forKey:kJCModel_tongguojignxiaoshangBaseIsStoreOutCheckPass];
    [aCoder encodeObject:_franchiserInOutOrder forKey:kJCModel_tongguojignxiaoshangBaseFranchiserInOutOrder];
    [aCoder encodeObject:_command forKey:kJCModel_tongguojignxiaoshangBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_tongguojignxiaoshangBase *copy = [[JCModel_tongguojignxiaoshangBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.isStoreOutCheckPass = self.isStoreOutCheckPass;
        copy.franchiserInOutOrder = [self.franchiserInOutOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
