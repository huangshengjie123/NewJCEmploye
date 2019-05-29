//
//  JCModel_updateWorklogDailyLog.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateWorklogDailyLog.h"
#import "JCModel_updateWorklogLogRows.h"


NSString *const kJCModel_updateWorklogDailyLogSummary = @"summary";
NSString *const kJCModel_updateWorklogDailyLogLogRows = @"logRows";
NSString *const kJCModel_updateWorklogDailyLogNextPlan = @"nextPlan";


@interface JCModel_updateWorklogDailyLog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateWorklogDailyLog

@synthesize summary = _summary;
@synthesize logRows = _logRows;
@synthesize nextPlan = _nextPlan;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.summary = [self objectOrNilForKey:kJCModel_updateWorklogDailyLogSummary fromDictionary:dict];
    NSObject *receivedJCModel_updateWorklogLogRows = [dict objectForKey:kJCModel_updateWorklogDailyLogLogRows];
    NSMutableArray *parsedJCModel_updateWorklogLogRows = [NSMutableArray array];
    
    if ([receivedJCModel_updateWorklogLogRows isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_updateWorklogLogRows) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_updateWorklogLogRows addObject:[JCModel_updateWorklogLogRows modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_updateWorklogLogRows isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_updateWorklogLogRows addObject:[JCModel_updateWorklogLogRows modelObjectWithDictionary:(NSDictionary *)receivedJCModel_updateWorklogLogRows]];
    }

    self.logRows = [NSArray arrayWithArray:parsedJCModel_updateWorklogLogRows];
            self.nextPlan = [self objectOrNilForKey:kJCModel_updateWorklogDailyLogNextPlan fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.summary forKey:kJCModel_updateWorklogDailyLogSummary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLogRows] forKey:kJCModel_updateWorklogDailyLogLogRows];
    [mutableDict setValue:self.nextPlan forKey:kJCModel_updateWorklogDailyLogNextPlan];

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

    self.summary = [aDecoder decodeObjectForKey:kJCModel_updateWorklogDailyLogSummary];
    self.logRows = [aDecoder decodeObjectForKey:kJCModel_updateWorklogDailyLogLogRows];
    self.nextPlan = [aDecoder decodeObjectForKey:kJCModel_updateWorklogDailyLogNextPlan];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_summary forKey:kJCModel_updateWorklogDailyLogSummary];
    [aCoder encodeObject:_logRows forKey:kJCModel_updateWorklogDailyLogLogRows];
    [aCoder encodeObject:_nextPlan forKey:kJCModel_updateWorklogDailyLogNextPlan];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateWorklogDailyLog *copy = [[JCModel_updateWorklogDailyLog alloc] init];
    
    
    
    if (copy) {

        copy.summary = [self.summary copyWithZone:zone];
        copy.logRows = [self.logRows copyWithZone:zone];
        copy.nextPlan = [self.nextPlan copyWithZone:zone];
    }
    
    return copy;
}


@end
