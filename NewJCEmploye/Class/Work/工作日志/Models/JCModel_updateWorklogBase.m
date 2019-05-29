//
//  JCModel_updateWorklogBase.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateWorklogBase.h"
#import "JCModel_updateWorklogDailyLog.h"
#import "JCModel_updateWorklogDailyLogStore.h"


NSString *const kJCModel_updateWorklogBaseDailyLog = @"dailyLog";
NSString *const kJCModel_updateWorklogBaseDailyLogStore = @"dailyLogStore";


@interface JCModel_updateWorklogBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateWorklogBase

@synthesize dailyLog = _dailyLog;
@synthesize dailyLogStore = _dailyLogStore;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dailyLog = [JCModel_updateWorklogDailyLog modelObjectWithDictionary:[dict objectForKey:kJCModel_updateWorklogBaseDailyLog]];
            self.dailyLogStore = [JCModel_updateWorklogDailyLogStore modelObjectWithDictionary:[dict objectForKey:kJCModel_updateWorklogBaseDailyLogStore]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.dailyLog dictionaryRepresentation] forKey:kJCModel_updateWorklogBaseDailyLog];
    [mutableDict setValue:[self.dailyLogStore dictionaryRepresentation] forKey:kJCModel_updateWorklogBaseDailyLogStore];

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

    self.dailyLog = [aDecoder decodeObjectForKey:kJCModel_updateWorklogBaseDailyLog];
    self.dailyLogStore = [aDecoder decodeObjectForKey:kJCModel_updateWorklogBaseDailyLogStore];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dailyLog forKey:kJCModel_updateWorklogBaseDailyLog];
    [aCoder encodeObject:_dailyLogStore forKey:kJCModel_updateWorklogBaseDailyLogStore];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateWorklogBase *copy = [[JCModel_updateWorklogBase alloc] init];
    
    
    
    if (copy) {

        copy.dailyLog = [self.dailyLog copyWithZone:zone];
        copy.dailyLogStore = [self.dailyLogStore copyWithZone:zone];
    }
    
    return copy;
}


@end
