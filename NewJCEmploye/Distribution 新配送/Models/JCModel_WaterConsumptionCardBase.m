//
//  JCModel_WaterConsumptionCardBase.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardBase.h"
#import "JCModel_WaterConsumptionCardDistribution.h"
#import "JCModel_WaterConsumptionCardWaterCardChangeList.h"


NSString *const kJCModel_WaterConsumptionCardBaseDistribution = @"distribution";
NSString *const kJCModel_WaterConsumptionCardBaseWaterCardChangeList = @"waterCardChangeList";


@interface JCModel_WaterConsumptionCardBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardBase

@synthesize distribution = _distribution;
@synthesize waterCardChangeList = _waterCardChangeList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.distribution = [JCModel_WaterConsumptionCardDistribution modelObjectWithDictionary:[dict objectForKey:kJCModel_WaterConsumptionCardBaseDistribution]];
    NSObject *receivedJCModel_WaterConsumptionCardWaterCardChangeList = [dict objectForKey:kJCModel_WaterConsumptionCardBaseWaterCardChangeList];
    NSMutableArray *parsedJCModel_WaterConsumptionCardWaterCardChangeList = [NSMutableArray array];
    
    if ([receivedJCModel_WaterConsumptionCardWaterCardChangeList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterConsumptionCardWaterCardChangeList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterConsumptionCardWaterCardChangeList addObject:[JCModel_WaterConsumptionCardWaterCardChangeList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterConsumptionCardWaterCardChangeList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterConsumptionCardWaterCardChangeList addObject:[JCModel_WaterConsumptionCardWaterCardChangeList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterConsumptionCardWaterCardChangeList]];
    }

    self.waterCardChangeList = [NSArray arrayWithArray:parsedJCModel_WaterConsumptionCardWaterCardChangeList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.distribution dictionaryRepresentation] forKey:kJCModel_WaterConsumptionCardBaseDistribution];
    NSMutableArray *tempArrayForWaterCardChangeList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.waterCardChangeList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWaterCardChangeList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWaterCardChangeList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardChangeList] forKey:kJCModel_WaterConsumptionCardBaseWaterCardChangeList];

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

    self.distribution = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardBaseDistribution];
    self.waterCardChangeList = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardBaseWaterCardChangeList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_distribution forKey:kJCModel_WaterConsumptionCardBaseDistribution];
    [aCoder encodeObject:_waterCardChangeList forKey:kJCModel_WaterConsumptionCardBaseWaterCardChangeList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardBase *copy = [[JCModel_WaterConsumptionCardBase alloc] init];
    
    
    
    if (copy) {

        copy.distribution = [self.distribution copyWithZone:zone];
        copy.waterCardChangeList = [self.waterCardChangeList copyWithZone:zone];
    }
    
    return copy;
}


@end
