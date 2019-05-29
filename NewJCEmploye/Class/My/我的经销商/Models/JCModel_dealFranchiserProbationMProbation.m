//
//  JCModel_dealFranchiserProbationMProbation.m
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserProbationMProbation.h"
#import "JCModel_dealFranchiserProbationMProbationCosts.h"


NSString *const kJCModel_dealFranchiserProbationMProbationStatus = @"status";
NSString *const kJCModel_dealFranchiserProbationMProbationFranchiser = @"franchiser";
NSString *const kJCModel_dealFranchiserProbationMProbationUid = @"uid";
NSString *const kJCModel_dealFranchiserProbationMProbationId = @"id";
NSString *const kJCModel_dealFranchiserProbationMProbationEnd = @"end";
NSString *const kJCModel_dealFranchiserProbationMProbationComments = @"comments";
NSString *const kJCModel_dealFranchiserProbationMProbationStart = @"start";
NSString *const kJCModel_dealFranchiserProbationMProbationGuide = @"guide";
NSString *const kJCModel_dealFranchiserProbationMProbationProbationCosts = @"probationCosts";
NSString *const kJCModel_dealFranchiserProbationMProbationPreid = @"preid";
NSString *const kJCModel_dealFranchiserProbationMProbationCust = @"cust";


@interface JCModel_dealFranchiserProbationMProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserProbationMProbation

@synthesize status = _status;
@synthesize franchiser = _franchiser;
@synthesize uid = _uid;
@synthesize probationIdentifier = _probationIdentifier;
@synthesize endProperty = _endProperty;
@synthesize comments = _comments;
@synthesize start = _start;
@synthesize guide = _guide;
@synthesize probationCosts = _probationCosts;
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
            self.status = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationStatus fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationFranchiser fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationUid fromDictionary:dict] doubleValue];
            self.probationIdentifier = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationId fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationEnd fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationComments fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationStart fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationGuide fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_dealFranchiserProbationMProbationCosts = [dict objectForKey:kJCModel_dealFranchiserProbationMProbationProbationCosts];
    NSMutableArray *parsedJCModel_dealFranchiserProbationMProbationCosts = [NSMutableArray array];
    
    if ([receivedJCModel_dealFranchiserProbationMProbationCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_dealFranchiserProbationMProbationCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_dealFranchiserProbationMProbationCosts addObject:[JCModel_dealFranchiserProbationMProbationCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_dealFranchiserProbationMProbationCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_dealFranchiserProbationMProbationCosts addObject:[JCModel_dealFranchiserProbationMProbationCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_dealFranchiserProbationMProbationCosts]];
    }

    self.probationCosts = [NSArray arrayWithArray:parsedJCModel_dealFranchiserProbationMProbationCosts];
            self.preid = [[self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationPreid fromDictionary:dict] doubleValue];
            self.cust = [self objectOrNilForKey:kJCModel_dealFranchiserProbationMProbationCust fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kJCModel_dealFranchiserProbationMProbationStatus];
    [mutableDict setValue:self.franchiser forKey:kJCModel_dealFranchiserProbationMProbationFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_dealFranchiserProbationMProbationUid];
    [mutableDict setValue:self.probationIdentifier forKey:kJCModel_dealFranchiserProbationMProbationId];
    [mutableDict setValue:self.endProperty forKey:kJCModel_dealFranchiserProbationMProbationEnd];
    [mutableDict setValue:self.comments forKey:kJCModel_dealFranchiserProbationMProbationComments];
    [mutableDict setValue:self.start forKey:kJCModel_dealFranchiserProbationMProbationStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_dealFranchiserProbationMProbationGuide];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProbationCosts] forKey:kJCModel_dealFranchiserProbationMProbationProbationCosts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preid] forKey:kJCModel_dealFranchiserProbationMProbationPreid];
    [mutableDict setValue:self.cust forKey:kJCModel_dealFranchiserProbationMProbationCust];

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

    self.status = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationStatus];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationFranchiser];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserProbationMProbationUid];
    self.probationIdentifier = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationId];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationEnd];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationComments];
    self.start = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationStart];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserProbationMProbationGuide];
    self.probationCosts = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationProbationCosts];
    self.preid = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserProbationMProbationPreid];
    self.cust = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserProbationMProbationCust];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kJCModel_dealFranchiserProbationMProbationStatus];
    [aCoder encodeObject:_franchiser forKey:kJCModel_dealFranchiserProbationMProbationFranchiser];
    [aCoder encodeDouble:_uid forKey:kJCModel_dealFranchiserProbationMProbationUid];
    [aCoder encodeObject:_probationIdentifier forKey:kJCModel_dealFranchiserProbationMProbationId];
    [aCoder encodeObject:_endProperty forKey:kJCModel_dealFranchiserProbationMProbationEnd];
    [aCoder encodeObject:_comments forKey:kJCModel_dealFranchiserProbationMProbationComments];
    [aCoder encodeObject:_start forKey:kJCModel_dealFranchiserProbationMProbationStart];
    [aCoder encodeDouble:_guide forKey:kJCModel_dealFranchiserProbationMProbationGuide];
    [aCoder encodeObject:_probationCosts forKey:kJCModel_dealFranchiserProbationMProbationProbationCosts];
    [aCoder encodeDouble:_preid forKey:kJCModel_dealFranchiserProbationMProbationPreid];
    [aCoder encodeObject:_cust forKey:kJCModel_dealFranchiserProbationMProbationCust];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserProbationMProbation *copy = [[JCModel_dealFranchiserProbationMProbation alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.uid = self.uid;
        copy.probationIdentifier = [self.probationIdentifier copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
        copy.guide = self.guide;
        copy.probationCosts = [self.probationCosts copyWithZone:zone];
        copy.preid = self.preid;
        copy.cust = [self.cust copyWithZone:zone];
    }
    
    return copy;
}


@end
