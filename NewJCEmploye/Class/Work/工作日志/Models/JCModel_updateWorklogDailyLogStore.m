//
//  JCModel_updateWorklogDailyLogStore.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateWorklogDailyLogStore.h"


NSString *const kJCModel_updateWorklogDailyLogStoreId = @"id";


@interface JCModel_updateWorklogDailyLogStore ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateWorklogDailyLogStore

@synthesize dailyLogStoreIdentifier = _dailyLogStoreIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dailyLogStoreIdentifier = [self objectOrNilForKey:kJCModel_updateWorklogDailyLogStoreId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dailyLogStoreIdentifier forKey:kJCModel_updateWorklogDailyLogStoreId];

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

    self.dailyLogStoreIdentifier = [aDecoder decodeObjectForKey:kJCModel_updateWorklogDailyLogStoreId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dailyLogStoreIdentifier forKey:kJCModel_updateWorklogDailyLogStoreId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateWorklogDailyLogStore *copy = [[JCModel_updateWorklogDailyLogStore alloc] init];
    
    
    
    if (copy) {

        copy.dailyLogStoreIdentifier = [self.dailyLogStoreIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
