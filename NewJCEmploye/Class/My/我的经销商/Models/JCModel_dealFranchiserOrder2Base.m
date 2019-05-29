//
//  JCModel_dealFranchiserOrder2Base.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder2Base.h"
#import "JCModel_dealFranchiserOrder2FranchiserOrder.h"


NSString *const kJCModel_dealFranchiserOrder2BaseCommand = @"command";
NSString *const kJCModel_dealFranchiserOrder2BaseIsPre = @"isPre";
NSString *const kJCModel_dealFranchiserOrder2BaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_dealFranchiserOrder2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder2Base

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
            self.command = [self objectOrNilForKey:kJCModel_dealFranchiserOrder2BaseCommand fromDictionary:dict];
            self.isPre = [self objectOrNilForKey:kJCModel_dealFranchiserOrder2BaseIsPre fromDictionary:dict];
            self.franchiserOrder = [JCModel_dealFranchiserOrder2FranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_dealFranchiserOrder2BaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_dealFranchiserOrder2BaseCommand];
    [mutableDict setValue:self.isPre forKey:kJCModel_dealFranchiserOrder2BaseIsPre];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_dealFranchiserOrder2BaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder2BaseCommand];
    self.isPre = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder2BaseIsPre];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder2BaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_dealFranchiserOrder2BaseCommand];
    [aCoder encodeObject:_isPre forKey:kJCModel_dealFranchiserOrder2BaseIsPre];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_dealFranchiserOrder2BaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder2Base *copy = [[JCModel_dealFranchiserOrder2Base alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.isPre = [self.isPre copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
