//
//  JCModel_NewWorkLogUPDailyLog.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewWorkLogUPDailyLog.h"
#import "JCModel_NewWorkLogUPLogRows.h"


NSString *const kJCModel_NewWorkLogUPDailyLogSummary = @"summary";
NSString *const kJCModel_NewWorkLogUPDailyLogLogRows = @"logRows";
NSString *const kJCModel_NewWorkLogUPDailyLogNextPlan = @"nextPlan";


@interface JCModel_NewWorkLogUPDailyLog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewWorkLogUPDailyLog

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
            self.summary = [self objectOrNilForKey:kJCModel_NewWorkLogUPDailyLogSummary fromDictionary:dict];
    NSObject *receivedJCModel_NewWorkLogUPLogRows = [dict objectForKey:kJCModel_NewWorkLogUPDailyLogLogRows];
    NSMutableArray *parsedJCModel_NewWorkLogUPLogRows = [NSMutableArray array];
    
    if ([receivedJCModel_NewWorkLogUPLogRows isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewWorkLogUPLogRows) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewWorkLogUPLogRows addObject:[JCModel_NewWorkLogUPLogRows modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewWorkLogUPLogRows isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewWorkLogUPLogRows addObject:[JCModel_NewWorkLogUPLogRows modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewWorkLogUPLogRows]];
    }

    self.logRows = [NSArray arrayWithArray:parsedJCModel_NewWorkLogUPLogRows];
            self.nextPlan = [self objectOrNilForKey:kJCModel_NewWorkLogUPDailyLogNextPlan fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.summary forKey:kJCModel_NewWorkLogUPDailyLogSummary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLogRows] forKey:kJCModel_NewWorkLogUPDailyLogLogRows];
    [mutableDict setValue:self.nextPlan forKey:kJCModel_NewWorkLogUPDailyLogNextPlan];

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

    self.summary = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPDailyLogSummary];
    self.logRows = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPDailyLogLogRows];
    self.nextPlan = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPDailyLogNextPlan];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_summary forKey:kJCModel_NewWorkLogUPDailyLogSummary];
    [aCoder encodeObject:_logRows forKey:kJCModel_NewWorkLogUPDailyLogLogRows];
    [aCoder encodeObject:_nextPlan forKey:kJCModel_NewWorkLogUPDailyLogNextPlan];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewWorkLogUPDailyLog *copy = [[JCModel_NewWorkLogUPDailyLog alloc] init];
    
    
    
    if (copy) {

        copy.summary = [self.summary copyWithZone:zone];
        copy.logRows = [self.logRows copyWithZone:zone];
        copy.nextPlan = [self.nextPlan copyWithZone:zone];
    }
    
    return copy;
}


@end
