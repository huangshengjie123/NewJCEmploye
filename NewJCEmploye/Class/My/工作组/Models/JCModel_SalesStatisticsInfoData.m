//
//  JCModel_SalesStatisticsInfoData.m
//
//  Created by   on 2018/11/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SalesStatisticsInfoData.h"


NSString *const kJCModel_SalesStatisticsInfoDataGetPercent = @"getPercent";
NSString *const kJCModel_SalesStatisticsInfoDataGetAmountSum = @"getAmountSum";
NSString *const kJCModel_SalesStatisticsInfoDataCount = @"count";
NSString *const kJCModel_SalesStatisticsInfoDataCycleUnit = @"cycleUnit";
NSString *const kJCModel_SalesStatisticsInfoDataTotal = @"total";
NSString *const kJCModel_SalesStatisticsInfoDataAmountSum = @"amountSum";


@interface JCModel_SalesStatisticsInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SalesStatisticsInfoData

@synthesize getPercent = _getPercent;
@synthesize getAmountSum = _getAmountSum;
@synthesize count = _count;
@synthesize cycleUnit = _cycleUnit;
@synthesize total = _total;
@synthesize amountSum = _amountSum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.getPercent = [[self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataGetPercent fromDictionary:dict] doubleValue];
            self.getAmountSum = [[self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataGetAmountSum fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataCount fromDictionary:dict] doubleValue];
            self.cycleUnit = [self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataCycleUnit fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataTotal fromDictionary:dict] doubleValue];
            self.amountSum = [[self objectOrNilForKey:kJCModel_SalesStatisticsInfoDataAmountSum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getPercent] forKey:kJCModel_SalesStatisticsInfoDataGetPercent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getAmountSum] forKey:kJCModel_SalesStatisticsInfoDataGetAmountSum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_SalesStatisticsInfoDataCount];
    [mutableDict setValue:self.cycleUnit forKey:kJCModel_SalesStatisticsInfoDataCycleUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kJCModel_SalesStatisticsInfoDataTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amountSum] forKey:kJCModel_SalesStatisticsInfoDataAmountSum];

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

    self.getPercent = [aDecoder decodeDoubleForKey:kJCModel_SalesStatisticsInfoDataGetPercent];
    self.getAmountSum = [aDecoder decodeDoubleForKey:kJCModel_SalesStatisticsInfoDataGetAmountSum];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_SalesStatisticsInfoDataCount];
    self.cycleUnit = [aDecoder decodeObjectForKey:kJCModel_SalesStatisticsInfoDataCycleUnit];
    self.total = [aDecoder decodeDoubleForKey:kJCModel_SalesStatisticsInfoDataTotal];
    self.amountSum = [aDecoder decodeDoubleForKey:kJCModel_SalesStatisticsInfoDataAmountSum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_getPercent forKey:kJCModel_SalesStatisticsInfoDataGetPercent];
    [aCoder encodeDouble:_getAmountSum forKey:kJCModel_SalesStatisticsInfoDataGetAmountSum];
    [aCoder encodeDouble:_count forKey:kJCModel_SalesStatisticsInfoDataCount];
    [aCoder encodeObject:_cycleUnit forKey:kJCModel_SalesStatisticsInfoDataCycleUnit];
    [aCoder encodeDouble:_total forKey:kJCModel_SalesStatisticsInfoDataTotal];
    [aCoder encodeDouble:_amountSum forKey:kJCModel_SalesStatisticsInfoDataAmountSum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SalesStatisticsInfoData *copy = [[JCModel_SalesStatisticsInfoData alloc] init];
    
    
    
    if (copy) {

        copy.getPercent = self.getPercent;
        copy.getAmountSum = self.getAmountSum;
        copy.count = self.count;
        copy.cycleUnit = [self.cycleUnit copyWithZone:zone];
        copy.total = self.total;
        copy.amountSum = self.amountSum;
    }
    
    return copy;
}


@end
