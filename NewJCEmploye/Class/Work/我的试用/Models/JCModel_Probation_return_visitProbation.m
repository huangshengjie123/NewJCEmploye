//
//  JCModel_Probation_return_visitProbation.m
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_Probation_return_visitProbation.h"


NSString *const kJCModel_Probation_return_visitProbationId = @"id";


@interface JCModel_Probation_return_visitProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_Probation_return_visitProbation

@synthesize probationIdentifier = _probationIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.probationIdentifier = [self objectOrNilForKey:kJCModel_Probation_return_visitProbationId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.probationIdentifier forKey:kJCModel_Probation_return_visitProbationId];

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

    self.probationIdentifier = [aDecoder decodeObjectForKey:kJCModel_Probation_return_visitProbationId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_probationIdentifier forKey:kJCModel_Probation_return_visitProbationId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_Probation_return_visitProbation *copy = [[JCModel_Probation_return_visitProbation alloc] init];
    
    
    
    if (copy) {

        copy.probationIdentifier = [self.probationIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
