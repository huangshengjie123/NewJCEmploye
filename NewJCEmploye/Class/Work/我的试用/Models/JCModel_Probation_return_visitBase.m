//
//  JCModel_Probation_return_visitBase.m
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_Probation_return_visitBase.h"
#import "JCModel_Probation_return_visitProbation.h"


NSString *const kJCModel_Probation_return_visitBaseCurrent = @"current";
NSString *const kJCModel_Probation_return_visitBaseIsDeal = @"isDeal";
NSString *const kJCModel_Probation_return_visitBaseIsInStore = @"isInStore";
NSString *const kJCModel_Probation_return_visitBaseCommand = @"command";
NSString *const kJCModel_Probation_return_visitBaseProbation = @"probation";


@interface JCModel_Probation_return_visitBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_Probation_return_visitBase

@synthesize current = _current;
@synthesize isDeal = _isDeal;
@synthesize isInStore = _isInStore;
@synthesize command = _command;
@synthesize probation = _probation;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_Probation_return_visitBaseCurrent fromDictionary:dict];
            self.isDeal = [[self objectOrNilForKey:kJCModel_Probation_return_visitBaseIsDeal fromDictionary:dict] boolValue];
            self.isInStore = [[self objectOrNilForKey:kJCModel_Probation_return_visitBaseIsInStore fromDictionary:dict] boolValue];
            self.command = [self objectOrNilForKey:kJCModel_Probation_return_visitBaseCommand fromDictionary:dict];
            self.probation = [JCModel_Probation_return_visitProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_Probation_return_visitBaseProbation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_Probation_return_visitBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDeal] forKey:kJCModel_Probation_return_visitBaseIsDeal];
    [mutableDict setValue:[NSNumber numberWithBool:self.isInStore] forKey:kJCModel_Probation_return_visitBaseIsInStore];
    [mutableDict setValue:self.command forKey:kJCModel_Probation_return_visitBaseCommand];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_Probation_return_visitBaseProbation];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_Probation_return_visitBaseCurrent];
    self.isDeal = [aDecoder decodeBoolForKey:kJCModel_Probation_return_visitBaseIsDeal];
    self.isInStore = [aDecoder decodeBoolForKey:kJCModel_Probation_return_visitBaseIsInStore];
    self.command = [aDecoder decodeObjectForKey:kJCModel_Probation_return_visitBaseCommand];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_Probation_return_visitBaseProbation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_Probation_return_visitBaseCurrent];
    [aCoder encodeBool:_isDeal forKey:kJCModel_Probation_return_visitBaseIsDeal];
    [aCoder encodeBool:_isInStore forKey:kJCModel_Probation_return_visitBaseIsInStore];
    [aCoder encodeObject:_command forKey:kJCModel_Probation_return_visitBaseCommand];
    [aCoder encodeObject:_probation forKey:kJCModel_Probation_return_visitBaseProbation];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_Probation_return_visitBase *copy = [[JCModel_Probation_return_visitBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.isDeal = self.isDeal;
        copy.isInStore = self.isInStore;
        copy.command = [self.command copyWithZone:zone];
        copy.probation = [self.probation copyWithZone:zone];
    }
    
    return copy;
}


@end
