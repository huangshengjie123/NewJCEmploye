//
//  JCModel_probation_visitBase.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probation_visitBase.h"
#import "JCModel_probation_visitProbation.h"


NSString *const kJCModel_probation_visitBaseCommand = @"command";
NSString *const kJCModel_probation_visitBaseCurrent = @"current";
NSString *const kJCModel_probation_visitBaseProbation = @"probation";


@interface JCModel_probation_visitBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probation_visitBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize probation = _probation;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_probation_visitBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_probation_visitBaseCurrent fromDictionary:dict];
            self.probation = [JCModel_probation_visitProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_probation_visitBaseProbation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_probation_visitBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_probation_visitBaseCurrent];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_probation_visitBaseProbation];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_probation_visitBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_probation_visitBaseCurrent];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_probation_visitBaseProbation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_probation_visitBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_probation_visitBaseCurrent];
    [aCoder encodeObject:_probation forKey:kJCModel_probation_visitBaseProbation];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probation_visitBase *copy = [[JCModel_probation_visitBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.probation = [self.probation copyWithZone:zone];
    }
    
    return copy;
}


@end
