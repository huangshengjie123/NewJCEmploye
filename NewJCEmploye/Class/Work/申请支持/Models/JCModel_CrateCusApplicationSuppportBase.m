//
//  JCModel_CrateCusApplicationSuppportBase.m
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CrateCusApplicationSuppportBase.h"
#import "JCModel_CrateCusApplicationSuppportFranchiserOrder.h"


NSString *const kJCModel_CrateCusApplicationSuppportBaseCommand = @"command";
NSString *const kJCModel_CrateCusApplicationSuppportBaseIsPre = @"isPre";
NSString *const kJCModel_CrateCusApplicationSuppportBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_CrateCusApplicationSuppportBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CrateCusApplicationSuppportBase

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
            self.command = [self objectOrNilForKey:kJCModel_CrateCusApplicationSuppportBaseCommand fromDictionary:dict];
            self.isPre = [[self objectOrNilForKey:kJCModel_CrateCusApplicationSuppportBaseIsPre fromDictionary:dict] boolValue];
            self.franchiserOrder = [JCModel_CrateCusApplicationSuppportFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_CrateCusApplicationSuppportBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_CrateCusApplicationSuppportBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_CrateCusApplicationSuppportBaseIsPre];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_CrateCusApplicationSuppportBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_CrateCusApplicationSuppportBaseCommand];
    self.isPre = [aDecoder decodeBoolForKey:kJCModel_CrateCusApplicationSuppportBaseIsPre];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_CrateCusApplicationSuppportBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_CrateCusApplicationSuppportBaseCommand];
    [aCoder encodeBool:_isPre forKey:kJCModel_CrateCusApplicationSuppportBaseIsPre];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_CrateCusApplicationSuppportBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CrateCusApplicationSuppportBase *copy = [[JCModel_CrateCusApplicationSuppportBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.isPre = self.isPre;
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
