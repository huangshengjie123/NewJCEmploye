//
//  JCModel_WorkLogDailyLog.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogDailyLog.h"
#import "JCModel_WorkLogLogRows.h"


NSString *const kJCModel_WorkLogDailyLogLogRows = @"logRows";
NSString *const kJCModel_WorkLogDailyLogSummary = @"summary";
NSString *const kJCModel_WorkLogDailyLogNextPlan = @"nextPlan";


@interface JCModel_WorkLogDailyLog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogDailyLog

@synthesize logRows = _logRows;
@synthesize summary = _summary;
@synthesize nextPlan = _nextPlan;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_WorkLogLogRows = [dict objectForKey:kJCModel_WorkLogDailyLogLogRows];
    NSMutableArray *parsedJCModel_WorkLogLogRows = [NSMutableArray array];
    
    if ([receivedJCModel_WorkLogLogRows isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WorkLogLogRows) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WorkLogLogRows addObject:[JCModel_WorkLogLogRows modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WorkLogLogRows isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WorkLogLogRows addObject:[JCModel_WorkLogLogRows modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WorkLogLogRows]];
    }

    self.logRows = [NSArray arrayWithArray:parsedJCModel_WorkLogLogRows];
            self.summary = [self objectOrNilForKey:kJCModel_WorkLogDailyLogSummary fromDictionary:dict];
            self.nextPlan = [self objectOrNilForKey:kJCModel_WorkLogDailyLogNextPlan fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLogRows = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.logRows) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLogRows addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLogRows addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLogRows] forKey:kJCModel_WorkLogDailyLogLogRows];
    [mutableDict setValue:self.summary forKey:kJCModel_WorkLogDailyLogSummary];
    [mutableDict setValue:self.nextPlan forKey:kJCModel_WorkLogDailyLogNextPlan];

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

    self.logRows = [aDecoder decodeObjectForKey:kJCModel_WorkLogDailyLogLogRows];
    self.summary = [aDecoder decodeObjectForKey:kJCModel_WorkLogDailyLogSummary];
    self.nextPlan = [aDecoder decodeObjectForKey:kJCModel_WorkLogDailyLogNextPlan];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_logRows forKey:kJCModel_WorkLogDailyLogLogRows];
    [aCoder encodeObject:_summary forKey:kJCModel_WorkLogDailyLogSummary];
    [aCoder encodeObject:_nextPlan forKey:kJCModel_WorkLogDailyLogNextPlan];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogDailyLog *copy = [[JCModel_WorkLogDailyLog alloc] init];
    
    
    
    if (copy) {

        copy.logRows = [self.logRows copyWithZone:zone];
        copy.summary = [self.summary copyWithZone:zone];
        copy.nextPlan = [self.nextPlan copyWithZone:zone];
    }
    
    return copy;
}


@end
