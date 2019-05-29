//
//  JCModel_ProbationNextBase.m
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ProbationNextBase.h"
#import "JCModel_ProbationNextProbation.h"


NSString *const kJCModel_ProbationNextBaseCommand = @"command";
NSString *const kJCModel_ProbationNextBaseCurrent = @"current";
NSString *const kJCModel_ProbationNextBaseProbation = @"probation";


@interface JCModel_ProbationNextBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ProbationNextBase

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
            self.command = [self objectOrNilForKey:kJCModel_ProbationNextBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_ProbationNextBaseCurrent fromDictionary:dict];
            self.probation = [JCModel_ProbationNextProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_ProbationNextBaseProbation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_ProbationNextBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_ProbationNextBaseCurrent];
    [mutableDict setValue:[self.probation dictionaryRepresentation] forKey:kJCModel_ProbationNextBaseProbation];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_ProbationNextBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_ProbationNextBaseCurrent];
    self.probation = [aDecoder decodeObjectForKey:kJCModel_ProbationNextBaseProbation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_ProbationNextBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_ProbationNextBaseCurrent];
    [aCoder encodeObject:_probation forKey:kJCModel_ProbationNextBaseProbation];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ProbationNextBase *copy = [[JCModel_ProbationNextBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.probation = [self.probation copyWithZone:zone];
    }
    
    return copy;
}


@end
