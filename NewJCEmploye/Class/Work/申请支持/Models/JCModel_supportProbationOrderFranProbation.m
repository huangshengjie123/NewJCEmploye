//
//  JCModel_supportProbationOrderFranProbation.m
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportProbationOrderFranProbation.h"
#import "JCModel_supportProbationOrderProbationCosts.h"


NSString *const kJCModel_supportProbationOrderFranProbationProbationCosts = @"probationCosts";


@interface JCModel_supportProbationOrderFranProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportProbationOrderFranProbation

@synthesize probationCosts = _probationCosts;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_supportProbationOrderProbationCosts = [dict objectForKey:kJCModel_supportProbationOrderFranProbationProbationCosts];
    NSMutableArray *parsedJCModel_supportProbationOrderProbationCosts = [NSMutableArray array];
    
    if ([receivedJCModel_supportProbationOrderProbationCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_supportProbationOrderProbationCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_supportProbationOrderProbationCosts addObject:[JCModel_supportProbationOrderProbationCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_supportProbationOrderProbationCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_supportProbationOrderProbationCosts addObject:[JCModel_supportProbationOrderProbationCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_supportProbationOrderProbationCosts]];
    }

    self.probationCosts = [NSArray arrayWithArray:parsedJCModel_supportProbationOrderProbationCosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForProbationCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.probationCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProbationCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProbationCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProbationCosts] forKey:kJCModel_supportProbationOrderFranProbationProbationCosts];

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

    self.probationCosts = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderFranProbationProbationCosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_probationCosts forKey:kJCModel_supportProbationOrderFranProbationProbationCosts];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportProbationOrderFranProbation *copy = [[JCModel_supportProbationOrderFranProbation alloc] init];
    
    
    
    if (copy) {

        copy.probationCosts = [self.probationCosts copyWithZone:zone];
    }
    
    return copy;
}


@end
