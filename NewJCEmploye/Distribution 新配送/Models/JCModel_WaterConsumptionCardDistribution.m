//
//  JCModel_WaterConsumptionCardDistribution.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardDistribution.h"
#import "JCModel_WaterConsumptionCardItems.h"


NSString *const kJCModel_WaterConsumptionCardDistributionCusId = @"cusId";
NSString *const kJCModel_WaterConsumptionCardDistributionAddrId = @"addrId";
NSString *const kJCModel_WaterConsumptionCardDistributionItems = @"items";


@interface JCModel_WaterConsumptionCardDistribution ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardDistribution

@synthesize cusId = _cusId;
@synthesize addrId = _addrId;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cusId = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardDistributionCusId fromDictionary:dict] doubleValue];
            self.addrId = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardDistributionAddrId fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_WaterConsumptionCardItems = [dict objectForKey:kJCModel_WaterConsumptionCardDistributionItems];
    NSMutableArray *parsedJCModel_WaterConsumptionCardItems = [NSMutableArray array];
    
    if ([receivedJCModel_WaterConsumptionCardItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterConsumptionCardItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterConsumptionCardItems addObject:[JCModel_WaterConsumptionCardItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterConsumptionCardItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterConsumptionCardItems addObject:[JCModel_WaterConsumptionCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterConsumptionCardItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_WaterConsumptionCardItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_WaterConsumptionCardDistributionCusId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addrId] forKey:kJCModel_WaterConsumptionCardDistributionAddrId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_WaterConsumptionCardDistributionItems];

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

    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardDistributionCusId];
    self.addrId = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardDistributionAddrId];
    self.items = [aDecoder decodeObjectForKey:kJCModel_WaterConsumptionCardDistributionItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cusId forKey:kJCModel_WaterConsumptionCardDistributionCusId];
    [aCoder encodeDouble:_addrId forKey:kJCModel_WaterConsumptionCardDistributionAddrId];
    [aCoder encodeObject:_items forKey:kJCModel_WaterConsumptionCardDistributionItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardDistribution *copy = [[JCModel_WaterConsumptionCardDistribution alloc] init];
    
    
    
    if (copy) {

        copy.cusId = self.cusId;
        copy.addrId = self.addrId;
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
