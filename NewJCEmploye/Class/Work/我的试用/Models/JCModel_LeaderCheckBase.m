//
//  JCModel_LeaderCheckBase.m
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_LeaderCheckBase.h"
#import "JCModel_LeaderCheckProbation.h"


NSString *const kJCModel_LeaderCheckBaseCurrent = @"current";
NSString *const kJCModel_LeaderCheckBaseLeaderPass = @"leaderPass";
NSString *const kJCModel_LeaderCheckBaseProbation = @"probation";
NSString *const kJCModel_LeaderCheckBaseCommand = @"command";


@interface JCModel_LeaderCheckBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_LeaderCheckBase

@synthesize current = _current;
@synthesize leaderPass = _leaderPass;
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
            self.current = [self objectOrNilForKey:kJCModel_LeaderCheckBaseCurrent fromDictionary:dict];
            self.leaderPass = [[self objectOrNilForKey:kJCModel_LeaderCheckBaseLeaderPass fromDictionary:dict] boolValue];
            self.probation = [JCModel_LeaderCheckProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_LeaderCheckBaseProbation]];
            self.command = [self objectOrNilForKey:kJCModel_LeaderCheckBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_LeaderCheckBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.leaderPass] forKey:kJCModel_LeaderCheckBaseLeaderPass];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_LeaderCheckBaseProbation];
    [mutableDict setValue:self.command forKey:kJCModel_LeaderCheckBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_LeaderCheckBaseCurrent];
    self.leaderPass = [aDecoder decodeBoolForKey:kJCModel_LeaderCheckBaseLeaderPass];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_LeaderCheckBaseProbation];
    self.command = [aDecoder decodeObjectForKey:kJCModel_LeaderCheckBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_LeaderCheckBaseCurrent];
    [aCoder encodeBool:_leaderPass forKey:kJCModel_LeaderCheckBaseLeaderPass];
    [aCoder encodeObject:_probation forKey:kJCModel_LeaderCheckBaseProbation];
    [aCoder encodeObject:_command forKey:kJCModel_LeaderCheckBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_LeaderCheckBase *copy = [[JCModel_LeaderCheckBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.leaderPass = self.leaderPass;
        copy.probation = [self.probation copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
