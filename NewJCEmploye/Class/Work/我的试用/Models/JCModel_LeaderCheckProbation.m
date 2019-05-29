//
//  JCModel_LeaderCheckProbation.m
//
//  Created by   on 2018/7/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_LeaderCheckProbation.h"


NSString *const kJCModel_LeaderCheckProbationId = @"id";


@interface JCModel_LeaderCheckProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_LeaderCheckProbation

@synthesize probationIdentifier = _probationIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.probationIdentifier = [self objectOrNilForKey:kJCModel_LeaderCheckProbationId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.probationIdentifier forKey:kJCModel_LeaderCheckProbationId];

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

    self.probationIdentifier = [aDecoder decodeObjectForKey:kJCModel_LeaderCheckProbationId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_probationIdentifier forKey:kJCModel_LeaderCheckProbationId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_LeaderCheckProbation *copy = [[JCModel_LeaderCheckProbation alloc] init];
    
    
    
    if (copy) {

        copy.probationIdentifier = [self.probationIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
