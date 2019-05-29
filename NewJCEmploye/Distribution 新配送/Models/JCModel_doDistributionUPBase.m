//
//  JCModel_doDistributionUPBase.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_doDistributionUPBase.h"
#import "JCModel_doDistributionUPDistribution.h"


NSString *const kJCModel_doDistributionUPBaseIsComplete = @"isComplete";
NSString *const kJCModel_doDistributionUPBaseCurrent = @"current";
NSString *const kJCModel_doDistributionUPBaseDistribution = @"distribution";
NSString *const kJCModel_doDistributionUPBaseCommand = @"command";


@interface JCModel_doDistributionUPBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_doDistributionUPBase

@synthesize isComplete = _isComplete;
@synthesize current = _current;
@synthesize distribution = _distribution;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isComplete = [self objectOrNilForKey:kJCModel_doDistributionUPBaseIsComplete fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_doDistributionUPBaseCurrent fromDictionary:dict];
            self.distribution = [JCModel_doDistributionUPDistribution modelObjectWithDictionary:[dict objectForKey:kJCModel_doDistributionUPBaseDistribution]];
            self.command = [self objectOrNilForKey:kJCModel_doDistributionUPBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isComplete forKey:kJCModel_doDistributionUPBaseIsComplete];
    [mutableDict setValue:self.current forKey:kJCModel_doDistributionUPBaseCurrent];
    [mutableDict setValue:[self.distribution dictionaryRepresentation] forKey:kJCModel_doDistributionUPBaseDistribution];
    [mutableDict setValue:self.command forKey:kJCModel_doDistributionUPBaseCommand];

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

    self.isComplete = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPBaseIsComplete];
    self.current = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPBaseCurrent];
    self.distribution = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPBaseDistribution];
    self.command = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isComplete forKey:kJCModel_doDistributionUPBaseIsComplete];
    [aCoder encodeObject:_current forKey:kJCModel_doDistributionUPBaseCurrent];
    [aCoder encodeObject:_distribution forKey:kJCModel_doDistributionUPBaseDistribution];
    [aCoder encodeObject:_command forKey:kJCModel_doDistributionUPBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_doDistributionUPBase *copy = [[JCModel_doDistributionUPBase alloc] init];
    
    
    
    if (copy) {

        copy.isComplete = [self.isComplete copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.distribution = [self.distribution copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
