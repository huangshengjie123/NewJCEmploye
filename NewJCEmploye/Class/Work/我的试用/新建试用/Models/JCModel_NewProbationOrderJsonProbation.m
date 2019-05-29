//
//  JCModel_NewProbationOrderJsonProbation.m
//
//  Created by   on 2018/5/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProbationOrderJsonProbation.h"
#import "JCModel_NewProbationOrderJsonCosts.h"
#import "JCModel_NewProbationOrderJsonCostsSelf.h"


NSString *const kJCModel_NewProbationOrderJsonProbationStatus = @"status";
NSString *const kJCModel_NewProbationOrderJsonProbationEnd = @"end";
NSString *const kJCModel_NewProbationOrderJsonProbationComments = @"comments";
NSString *const kJCModel_NewProbationOrderJsonProbationId = @"id";
NSString *const kJCModel_NewProbationOrderJsonProbationProcessId = @"processId";
NSString *const kJCModel_NewProbationOrderJsonProbationStart = @"start";
NSString *const kJCModel_NewProbationOrderJsonProbationCosts = @"costs";
NSString *const kJCModel_NewProbationOrderJsonProbationGuide = @"guide";
NSString *const kJCModel_NewProbationOrderJsonProbationCostsSelf = @"costsSelf";
NSString *const kJCModel_NewProbationOrderJsonProbationPreid = @"preid";
NSString *const kJCModel_NewProbationOrderJsonProbationCust = @"cust";


@interface JCModel_NewProbationOrderJsonProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProbationOrderJsonProbation

@synthesize status = _status;
@synthesize endProperty = _endProperty;
@synthesize comments = _comments;
@synthesize probationIdentifier = _probationIdentifier;
@synthesize processId = _processId;
@synthesize start = _start;
@synthesize costs = _costs;
@synthesize guide = _guide;
@synthesize costsSelf = _costsSelf;
@synthesize preid = _preid;
@synthesize cust = _cust;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationStatus fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationEnd fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationComments fromDictionary:dict];
            self.probationIdentifier = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationId fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationProcessId fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationStart fromDictionary:dict];
    NSObject *receivedJCModel_NewProbationOrderJsonCosts = [dict objectForKey:kJCModel_NewProbationOrderJsonProbationCosts];
    NSMutableArray *parsedJCModel_NewProbationOrderJsonCosts = [NSMutableArray array];
    
    if ([receivedJCModel_NewProbationOrderJsonCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewProbationOrderJsonCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewProbationOrderJsonCosts addObject:[JCModel_NewProbationOrderJsonCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewProbationOrderJsonCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewProbationOrderJsonCosts addObject:[JCModel_NewProbationOrderJsonCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewProbationOrderJsonCosts]];
    }

    self.costs = [NSArray arrayWithArray:parsedJCModel_NewProbationOrderJsonCosts];
            self.guide = [[self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationGuide fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_NewProbationOrderJsonCostsSelf = [dict objectForKey:kJCModel_NewProbationOrderJsonProbationCostsSelf];
    NSMutableArray *parsedJCModel_NewProbationOrderJsonCostsSelf = [NSMutableArray array];
    
    if ([receivedJCModel_NewProbationOrderJsonCostsSelf isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewProbationOrderJsonCostsSelf) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewProbationOrderJsonCostsSelf addObject:[JCModel_NewProbationOrderJsonCostsSelf modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewProbationOrderJsonCostsSelf isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewProbationOrderJsonCostsSelf addObject:[JCModel_NewProbationOrderJsonCostsSelf modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewProbationOrderJsonCostsSelf]];
    }

    self.costsSelf = [NSArray arrayWithArray:parsedJCModel_NewProbationOrderJsonCostsSelf];
            self.preid = [[self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationPreid fromDictionary:dict] doubleValue];
            self.cust = [self objectOrNilForKey:kJCModel_NewProbationOrderJsonProbationCust fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kJCModel_NewProbationOrderJsonProbationStatus];
    [mutableDict setValue:self.endProperty forKey:kJCModel_NewProbationOrderJsonProbationEnd];
    [mutableDict setValue:self.comments forKey:kJCModel_NewProbationOrderJsonProbationComments];
    [mutableDict setValue:self.probationIdentifier forKey:kJCModel_NewProbationOrderJsonProbationId];
    [mutableDict setValue:self.processId forKey:kJCModel_NewProbationOrderJsonProbationProcessId];
    [mutableDict setValue:self.start forKey:kJCModel_NewProbationOrderJsonProbationStart];
    NSMutableArray *tempArrayForCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.costs) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCosts] forKey:kJCModel_NewProbationOrderJsonProbationCosts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_NewProbationOrderJsonProbationGuide];
    NSMutableArray *tempArrayForCostsSelf = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.costsSelf) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCostsSelf addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCostsSelf addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCostsSelf] forKey:kJCModel_NewProbationOrderJsonProbationCostsSelf];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preid] forKey:kJCModel_NewProbationOrderJsonProbationPreid];
    [mutableDict setValue:self.cust forKey:kJCModel_NewProbationOrderJsonProbationCust];

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

    self.status = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationStatus];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationEnd];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationComments];
    self.probationIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationId];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationProcessId];
    self.start = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationStart];
    self.costs = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationCosts];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_NewProbationOrderJsonProbationGuide];
    self.costsSelf = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationCostsSelf];
    self.preid = [aDecoder decodeDoubleForKey:kJCModel_NewProbationOrderJsonProbationPreid];
    self.cust = [aDecoder decodeObjectForKey:kJCModel_NewProbationOrderJsonProbationCust];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kJCModel_NewProbationOrderJsonProbationStatus];
    [aCoder encodeObject:_endProperty forKey:kJCModel_NewProbationOrderJsonProbationEnd];
    [aCoder encodeObject:_comments forKey:kJCModel_NewProbationOrderJsonProbationComments];
    [aCoder encodeObject:_probationIdentifier forKey:kJCModel_NewProbationOrderJsonProbationId];
    [aCoder encodeObject:_processId forKey:kJCModel_NewProbationOrderJsonProbationProcessId];
    [aCoder encodeObject:_start forKey:kJCModel_NewProbationOrderJsonProbationStart];
    [aCoder encodeObject:_costs forKey:kJCModel_NewProbationOrderJsonProbationCosts];
    [aCoder encodeDouble:_guide forKey:kJCModel_NewProbationOrderJsonProbationGuide];
    [aCoder encodeObject:_costsSelf forKey:kJCModel_NewProbationOrderJsonProbationCostsSelf];
    [aCoder encodeDouble:_preid forKey:kJCModel_NewProbationOrderJsonProbationPreid];
    [aCoder encodeObject:_cust forKey:kJCModel_NewProbationOrderJsonProbationCust];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProbationOrderJsonProbation *copy = [[JCModel_NewProbationOrderJsonProbation alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.probationIdentifier = [self.probationIdentifier copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
        copy.costs = [self.costs copyWithZone:zone];
        copy.guide = self.guide;
        copy.costsSelf = [self.costsSelf copyWithZone:zone];
        copy.preid = self.preid;
        copy.cust = [self.cust copyWithZone:zone];
    }
    
    return copy;
}


@end
