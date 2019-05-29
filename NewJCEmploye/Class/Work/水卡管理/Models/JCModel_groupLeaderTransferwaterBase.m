//
//  JCModel_groupLeaderTransferwaterBase.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_groupLeaderTransferwaterBase.h"
#import "JCModel_groupLeaderTransferwaterWaterCardChangeList.h"


NSString *const kJCModel_groupLeaderTransferwaterBaseWaterCardChangeList = @"waterCardChangeList";


@interface JCModel_groupLeaderTransferwaterBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_groupLeaderTransferwaterBase

@synthesize waterCardChangeList = _waterCardChangeList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_groupLeaderTransferwaterWaterCardChangeList = [dict objectForKey:kJCModel_groupLeaderTransferwaterBaseWaterCardChangeList];
    NSMutableArray *parsedJCModel_groupLeaderTransferwaterWaterCardChangeList = [NSMutableArray array];
    
    if ([receivedJCModel_groupLeaderTransferwaterWaterCardChangeList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_groupLeaderTransferwaterWaterCardChangeList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_groupLeaderTransferwaterWaterCardChangeList addObject:[JCModel_groupLeaderTransferwaterWaterCardChangeList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_groupLeaderTransferwaterWaterCardChangeList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_groupLeaderTransferwaterWaterCardChangeList addObject:[JCModel_groupLeaderTransferwaterWaterCardChangeList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_groupLeaderTransferwaterWaterCardChangeList]];
    }

    self.waterCardChangeList = [NSArray arrayWithArray:parsedJCModel_groupLeaderTransferwaterWaterCardChangeList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardChangeList] forKey:kJCModel_groupLeaderTransferwaterBaseWaterCardChangeList];

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

    self.waterCardChangeList = [aDecoder decodeObjectForKey:kJCModel_groupLeaderTransferwaterBaseWaterCardChangeList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardChangeList forKey:kJCModel_groupLeaderTransferwaterBaseWaterCardChangeList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_groupLeaderTransferwaterBase *copy = [[JCModel_groupLeaderTransferwaterBase alloc] init];
    
    
    
    if (copy) {

        copy.waterCardChangeList = [self.waterCardChangeList copyWithZone:zone];
    }
    
    return copy;
}


@end
