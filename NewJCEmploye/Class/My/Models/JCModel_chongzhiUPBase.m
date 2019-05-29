//
//  JCModel_chongzhiUPBase.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_chongzhiUPBase.h"
#import "JCModel_chongzhiUPWaterCardChangeList.h"


NSString *const kJCModel_chongzhiUPBaseWaterCardChangeList = @"waterCardChangeList";


@interface JCModel_chongzhiUPBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_chongzhiUPBase

@synthesize waterCardChangeList = _waterCardChangeList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_chongzhiUPWaterCardChangeList = [dict objectForKey:kJCModel_chongzhiUPBaseWaterCardChangeList];
    NSMutableArray *parsedJCModel_chongzhiUPWaterCardChangeList = [NSMutableArray array];
    
    if ([receivedJCModel_chongzhiUPWaterCardChangeList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_chongzhiUPWaterCardChangeList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_chongzhiUPWaterCardChangeList addObject:[JCModel_chongzhiUPWaterCardChangeList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_chongzhiUPWaterCardChangeList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_chongzhiUPWaterCardChangeList addObject:[JCModel_chongzhiUPWaterCardChangeList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_chongzhiUPWaterCardChangeList]];
    }

    self.waterCardChangeList = [NSArray arrayWithArray:parsedJCModel_chongzhiUPWaterCardChangeList];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardChangeList] forKey:kJCModel_chongzhiUPBaseWaterCardChangeList];

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

    self.waterCardChangeList = [aDecoder decodeObjectForKey:kJCModel_chongzhiUPBaseWaterCardChangeList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardChangeList forKey:kJCModel_chongzhiUPBaseWaterCardChangeList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_chongzhiUPBase *copy = [[JCModel_chongzhiUPBase alloc] init];
    
    
    
    if (copy) {

        copy.waterCardChangeList = [self.waterCardChangeList copyWithZone:zone];
    }
    
    return copy;
}


@end
