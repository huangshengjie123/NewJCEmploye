//
//  JCModel_probation_visitProbation.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probation_visitProbation.h"


NSString *const kJCModel_probation_visitProbationId = @"id";
NSString *const kJCModel_probation_visitProbationIsDeal = @"isDeal";


@interface JCModel_probation_visitProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probation_visitProbation

@synthesize probationIdentifier = _probationIdentifier;
@synthesize isDeal = _isDeal;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.probationIdentifier = [self objectOrNilForKey:kJCModel_probation_visitProbationId fromDictionary:dict];
            self.isDeal = [self objectOrNilForKey:kJCModel_probation_visitProbationIsDeal fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.probationIdentifier forKey:kJCModel_probation_visitProbationId];
    [mutableDict setValue:self.isDeal forKey:kJCModel_probation_visitProbationIsDeal];

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

    self.probationIdentifier = [aDecoder decodeObjectForKey:kJCModel_probation_visitProbationId];
    self.isDeal = [aDecoder decodeObjectForKey:kJCModel_probation_visitProbationIsDeal];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_probationIdentifier forKey:kJCModel_probation_visitProbationId];
    [aCoder encodeObject:_isDeal forKey:kJCModel_probation_visitProbationIsDeal];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probation_visitProbation *copy = [[JCModel_probation_visitProbation alloc] init];
    
    
    
    if (copy) {

        copy.probationIdentifier = [self.probationIdentifier copyWithZone:zone];
        copy.isDeal = [self.isDeal copyWithZone:zone];
    }
    
    return copy;
}


@end
