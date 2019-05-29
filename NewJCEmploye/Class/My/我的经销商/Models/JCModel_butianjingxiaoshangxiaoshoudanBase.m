//
//  JCModel_butianjingxiaoshangxiaoshoudanBase.m
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_butianjingxiaoshangxiaoshoudanBase.h"
#import "JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder.h"


NSString *const kJCModel_butianjingxiaoshangxiaoshoudanBaseCommand = @"command";
NSString *const kJCModel_butianjingxiaoshangxiaoshoudanBaseIsPre = @"isPre";
NSString *const kJCModel_butianjingxiaoshangxiaoshoudanBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_butianjingxiaoshangxiaoshoudanBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_butianjingxiaoshangxiaoshoudanBase

@synthesize command = _command;
@synthesize isPre = _isPre;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseCommand fromDictionary:dict];
            self.isPre = [[self objectOrNilForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseIsPre fromDictionary:dict] boolValue];
            self.franchiserOrder = [JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseIsPre];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseCommand];
    self.isPre = [aDecoder decodeBoolForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseIsPre];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseCommand];
    [aCoder encodeBool:_isPre forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseIsPre];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_butianjingxiaoshangxiaoshoudanBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_butianjingxiaoshangxiaoshoudanBase *copy = [[JCModel_butianjingxiaoshangxiaoshoudanBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.isPre = self.isPre;
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
