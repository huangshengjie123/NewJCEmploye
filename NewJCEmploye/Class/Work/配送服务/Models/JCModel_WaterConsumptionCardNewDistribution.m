//
//  JCModel_WaterConsumptionCardNewDistribution.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardNewDistribution.h"
#import "JCModel_WaterConsumptionCardNewItems.h"


NSString *const kJCModel_WaterConsumptionCardNewDistributionCusId = @"cusId";
NSString *const kJCModel_WaterConsumptionCardNewDistributionItems = @"items";


@interface JCModel_WaterConsumptionCardNewDistribution ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardNewDistribution

@synthesize cusId = _cusId;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cusId = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardNewDistributionCusId fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_WaterConsumptionCardNewItems = [dict objectForKey:kJCModel_WaterConsumptionCardNewDistributionItems];
    NSMutableArray *parsedJCModel_WaterConsumptionCardNewItems = [NSMutableArray array];
    
    if ([receivedJCModel_WaterConsumptionCardNewItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterConsumptionCardNewItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterConsumptionCardNewItems addObject:[JCModel_WaterConsumptionCardNewItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterConsumptionCardNewItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterConsumptionCardNewItems addObject:[JCModel_WaterConsumptionCardNewItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterConsumptionCardNewItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_WaterConsumptionCardNewItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_WaterConsumptionCardNewDistributionCusId];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_WaterConsumptionCardNewDistributionItems];

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

    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardNewDistributionCusId];
    self.items = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardNewDistributionItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cusId forKey:kJCModel_WaterConsumptionCardNewDistributionCusId];
    [aCoder encodeObject:_items forKey:kJCModel_WaterConsumptionCardNewDistributionItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardNewDistribution *copy = [[JCModel_WaterConsumptionCardNewDistribution alloc] init];
    
    
    
    if (copy) {

        copy.cusId = self.cusId;
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
