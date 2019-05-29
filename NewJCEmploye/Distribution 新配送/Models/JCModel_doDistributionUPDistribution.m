//
//  JCModel_doDistributionUPDistribution.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_doDistributionUPDistribution.h"
#import "JCModel_doDistributionUPItems.h"


NSString *const kJCModel_doDistributionUPDistributionId = @"id";
NSString *const kJCModel_doDistributionUPDistributionItems = @"items";


@interface JCModel_doDistributionUPDistribution ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_doDistributionUPDistribution

@synthesize distributionIdentifier = _distributionIdentifier;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.distributionIdentifier = [self objectOrNilForKey:kJCModel_doDistributionUPDistributionId fromDictionary:dict];
    NSObject *receivedJCModel_doDistributionUPItems = [dict objectForKey:kJCModel_doDistributionUPDistributionItems];
    NSMutableArray *parsedJCModel_doDistributionUPItems = [NSMutableArray array];
    
    if ([receivedJCModel_doDistributionUPItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_doDistributionUPItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_doDistributionUPItems addObject:[JCModel_doDistributionUPItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_doDistributionUPItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_doDistributionUPItems addObject:[JCModel_doDistributionUPItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_doDistributionUPItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_doDistributionUPItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.distributionIdentifier forKey:kJCModel_doDistributionUPDistributionId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_doDistributionUPDistributionItems];

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

    self.distributionIdentifier = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPDistributionId];
    self.items = [aDecoder decodeObjectForKey:kJCModel_doDistributionUPDistributionItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_distributionIdentifier forKey:kJCModel_doDistributionUPDistributionId];
    [aCoder encodeObject:_items forKey:kJCModel_doDistributionUPDistributionItems];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_doDistributionUPDistribution *copy = [[JCModel_doDistributionUPDistribution alloc] init];
    
    
    
    if (copy) {

        copy.distributionIdentifier = [self.distributionIdentifier copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
