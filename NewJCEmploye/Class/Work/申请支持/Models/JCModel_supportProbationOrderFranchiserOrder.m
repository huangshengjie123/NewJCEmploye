//
//  JCModel_supportProbationOrderFranchiserOrder.m
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportProbationOrderFranchiserOrder.h"
#import "JCModel_supportProbationOrderFranProbation.h"


NSString *const kJCModel_supportProbationOrderFranchiserOrderId = @"id";
NSString *const kJCModel_supportProbationOrderFranchiserOrderFranProbation = @"franProbation";


@interface JCModel_supportProbationOrderFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportProbationOrderFranchiserOrder

@synthesize franchiserOrderIdentifier = _franchiserOrderIdentifier;
@synthesize franProbation = _franProbation;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_supportProbationOrderFranchiserOrderId fromDictionary:dict];
            self.franProbation = [JCModel_supportProbationOrderFranProbation modelObjectWithDictionary:[dict objectForKey:kJCModel_supportProbationOrderFranchiserOrderFranProbation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_supportProbationOrderFranchiserOrderId];
    [mutableDict setValue:[self.franProbation dictionaryRepresentation] forKey:kJCModel_supportProbationOrderFranchiserOrderFranProbation];

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

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderFranchiserOrderId];
    self.franProbation = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderFranchiserOrderFranProbation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_supportProbationOrderFranchiserOrderId];
    [aCoder encodeObject:_franProbation forKey:kJCModel_supportProbationOrderFranchiserOrderFranProbation];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportProbationOrderFranchiserOrder *copy = [[JCModel_supportProbationOrderFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserOrderIdentifier = [self.franchiserOrderIdentifier copyWithZone:zone];
        copy.franProbation = [self.franProbation copyWithZone:zone];
    }
    
    return copy;
}


@end
