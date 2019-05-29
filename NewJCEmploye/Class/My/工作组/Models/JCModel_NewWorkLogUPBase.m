//
//  JCModel_NewWorkLogUPBase.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewWorkLogUPBase.h"
#import "JCModel_NewWorkLogUPDailyLog.h"


NSString *const kJCModel_NewWorkLogUPBaseDailyLog = @"dailyLog";


@interface JCModel_NewWorkLogUPBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewWorkLogUPBase

@synthesize dailyLog = _dailyLog;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dailyLog = [JCModel_NewWorkLogUPDailyLog modelObjectWithDictionary:[dict objectForKey:kJCModel_NewWorkLogUPBaseDailyLog]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.dailyLog dictionaryRepresentation] forKey:kJCModel_NewWorkLogUPBaseDailyLog];

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

    self.dailyLog = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPBaseDailyLog];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dailyLog forKey:kJCModel_NewWorkLogUPBaseDailyLog];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewWorkLogUPBase *copy = [[JCModel_NewWorkLogUPBase alloc] init];
    
    
    
    if (copy) {

        copy.dailyLog = [self.dailyLog copyWithZone:zone];
    }
    
    return copy;
}


@end
