//
//  JCModel_dealFranchiserProbationMBase.m
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserProbationMBase.h"
#import "JCModel_dealFranchiserProbationMProbation.h"


NSString *const kJCModel_dealFranchiserProbationMBaseStoreHourse = @"storeHourse";
NSString *const kJCModel_dealFranchiserProbationMBaseNeedOutStore = @"needOutStore";
NSString *const kJCModel_dealFranchiserProbationMBaseProbation = @"probation";
NSString *const kJCModel_dealFranchiserProbationMBaseCommand = @"command";


@interface JCModel_dealFranchiserProbationMBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserProbationMBase

@synthesize storeHourse = _storeHourse;
@synthesize needOutStore = _needOutStore;
@synthesize probation = _probation;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storeHourse = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMBaseStoreHourse fromDictionary:dict];
            self.needOutStore = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMBaseNeedOutStore fromDictionary:dict];
            self.probation = [JCModel_dealFranchiserProbationMProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_dealFranchiserProbationMBaseProbation]];
            self.command = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_dealFranchiserProbationMBaseStoreHourse];
    [mutableDict setValue:self.needOutStore forKey:kJCModel_dealFranchiserProbationMBaseNeedOutStore];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_dealFranchiserProbationMBaseProbation];
    [mutableDict setValue:self.command forKey:kJCModel_dealFranchiserProbationMBaseCommand];

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

    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMBaseStoreHourse];
    self.needOutStore = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMBaseNeedOutStore];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMBaseProbation];
    self.command = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_storeHourse forKey:kJCModel_dealFranchiserProbationMBaseStoreHourse];
    [aCoder encodeObject:_needOutStore forKey:kJCModel_dealFranchiserProbationMBaseNeedOutStore];
    [aCoder encodeObject:_probation forKey:kJCModel_dealFranchiserProbationMBaseProbation];
    [aCoder encodeObject:_command forKey:kJCModel_dealFranchiserProbationMBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserProbationMBase *copy = [[JCModel_dealFranchiserProbationMBase alloc] init];
    
    
    
    if (copy) {

        copy.storeHourse = [self.storeHourse copyWithZone:zone];
        copy.needOutStore = [self.needOutStore copyWithZone:zone];
        copy.probation = [self.probation copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
