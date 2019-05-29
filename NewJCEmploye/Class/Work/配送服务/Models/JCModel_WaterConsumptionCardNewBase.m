//
//  JCModel_WaterConsumptionCardNewBase.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardNewBase.h"
#import "JCModel_WaterConsumptionCardNewDistribution.h"
#import "JCModel_WaterConsumptionCardNewWaterCardChange.h"


NSString *const kJCModel_WaterConsumptionCardNewBaseDistribution = @"distribution";
NSString *const kJCModel_WaterConsumptionCardNewBaseWaterCardChange = @"waterCardChange";


@interface JCModel_WaterConsumptionCardNewBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardNewBase

@synthesize distribution = _distribution;
@synthesize waterCardChange = _waterCardChange;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.distribution = [JCModel_WaterConsumptionCardNewDistribution modelObjectWithDictionary:[dict objectForKey:kJCModel_WaterConsumptionCardNewBaseDistribution]];
            self.waterCardChange = [JCModel_WaterConsumptionCardNewWaterCardChange modelObjectWithDictionary:[dict objectForKey:kJCModel_WaterConsumptionCardNewBaseWaterCardChange]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.distribution dictionaryRepresentation] forKey:kJCModel_WaterConsumptionCardNewBaseDistribution];
    [mutableDict setValue:[self.waterCardChange dictionaryRepresentation] forKey:kJCModel_WaterConsumptionCardNewBaseWaterCardChange];

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

    self.distribution = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardNewBaseDistribution];
    self.waterCardChange = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardNewBaseWaterCardChange];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_distribution forKey:kJCModel_WaterConsumptionCardNewBaseDistribution];
    [aCoder encodeObject:_waterCardChange forKey:kJCModel_WaterConsumptionCardNewBaseWaterCardChange];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardNewBase *copy = [[JCModel_WaterConsumptionCardNewBase alloc] init];
    
    
    
    if (copy) {

        copy.distribution = [self.distribution copyWithZone:zone];
        copy.waterCardChange = [self.waterCardChange copyWithZone:zone];
    }
    
    return copy;
}


@end
