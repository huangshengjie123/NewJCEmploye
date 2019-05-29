//
//  JCModel_dealFranchiserOrder1Base.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder1Base.h"
#import "JCModel_dealFranchiserOrder1FranchiserOrder.h"


NSString *const kJCModel_dealFranchiserOrder1BaseIsPre = @"isPre";
NSString *const kJCModel_dealFranchiserOrder1BasePreId = @"preId";
NSString *const kJCModel_dealFranchiserOrder1BaseCommand = @"command";
NSString *const kJCModel_dealFranchiserOrder1BaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_dealFranchiserOrder1Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder1Base

@synthesize isPre = _isPre;
@synthesize preId = _preId;
@synthesize command = _command;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isPre = [self objectOrNilForKey:kJCModel_dealFranchiserOrder1BaseIsPre fromDictionary:dict];
            self.preId = [[self objectOrNilForKey:kJCModel_dealFranchiserOrder1BasePreId fromDictionary:dict] doubleValue];
            self.command = [self objectOrNilForKey:kJCModel_dealFranchiserOrder1BaseCommand fromDictionary:dict];
            self.franchiserOrder = [JCModel_dealFranchiserOrder1FranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_dealFranchiserOrder1BaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isPre forKey:kJCModel_dealFranchiserOrder1BaseIsPre];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preId] forKey:kJCModel_dealFranchiserOrder1BasePreId];
    [mutableDict setValue:self.command forKey:kJCModel_dealFranchiserOrder1BaseCommand];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_dealFranchiserOrder1BaseFranchiserOrder];

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

    self.isPre = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder1BaseIsPre];
    self.preId = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserOrder1BasePreId];
    self.command = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder1BaseCommand];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder1BaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isPre forKey:kJCModel_dealFranchiserOrder1BaseIsPre];
    [aCoder encodeDouble:_preId forKey:kJCModel_dealFranchiserOrder1BasePreId];
    [aCoder encodeObject:_command forKey:kJCModel_dealFranchiserOrder1BaseCommand];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_dealFranchiserOrder1BaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder1Base *copy = [[JCModel_dealFranchiserOrder1Base alloc] init];
    
    
    
    if (copy) {

        copy.isPre = [self.isPre copyWithZone:zone];
        copy.preId = self.preId;
        copy.command = [self.command copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
