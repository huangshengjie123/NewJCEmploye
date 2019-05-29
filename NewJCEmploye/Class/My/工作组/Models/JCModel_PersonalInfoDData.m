//
//  JCModel_PersonalInfoDData.m
//
//  Created by   on 2018/11/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PersonalInfoDData.h"


NSString *const kJCModel_PersonalInfoDDataProbationSum = @"probationSum";
NSString *const kJCModel_PersonalInfoDDataDealSum = @"dealSum";
NSString *const kJCModel_PersonalInfoDDataCycleUnit = @"cycleUnit";
NSString *const kJCModel_PersonalInfoDDataDealPercent = @"dealPercent";
NSString *const kJCModel_PersonalInfoDDataProbationOnSum = @"probationOnSum";


@interface JCModel_PersonalInfoDData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PersonalInfoDData

@synthesize probationSum = _probationSum;
@synthesize dealSum = _dealSum;
@synthesize cycleUnit = _cycleUnit;
@synthesize dealPercent = _dealPercent;
@synthesize probationOnSum = _probationOnSum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.probationSum = [[self objectOrNilForKey:kJCModel_PersonalInfoDDataProbationSum fromDictionary:dict] doubleValue];
            self.dealSum = [[self objectOrNilForKey:kJCModel_PersonalInfoDDataDealSum fromDictionary:dict] doubleValue];
            self.cycleUnit = [self objectOrNilForKey:kJCModel_PersonalInfoDDataCycleUnit fromDictionary:dict];
            self.dealPercent = [[self objectOrNilForKey:kJCModel_PersonalInfoDDataDealPercent fromDictionary:dict] doubleValue];
            self.probationOnSum = [[self objectOrNilForKey:kJCModel_PersonalInfoDDataProbationOnSum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.probationSum] forKey:kJCModel_PersonalInfoDDataProbationSum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dealSum] forKey:kJCModel_PersonalInfoDDataDealSum];
    [mutableDict setValue:self.cycleUnit forKey:kJCModel_PersonalInfoDDataCycleUnit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dealPercent] forKey:kJCModel_PersonalInfoDDataDealPercent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.probationOnSum] forKey:kJCModel_PersonalInfoDDataProbationOnSum];

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

    self.probationSum = [aDecoder decodeDoubleForKey:kJCModel_PersonalInfoDDataProbationSum];
    self.dealSum = [aDecoder decodeDoubleForKey:kJCModel_PersonalInfoDDataDealSum];
    self.cycleUnit = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDDataCycleUnit];
    self.dealPercent = [aDecoder decodeDoubleForKey:kJCModel_PersonalInfoDDataDealPercent];
    self.probationOnSum = [aDecoder decodeDoubleForKey:kJCModel_PersonalInfoDDataProbationOnSum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_probationSum forKey:kJCModel_PersonalInfoDDataProbationSum];
    [aCoder encodeDouble:_dealSum forKey:kJCModel_PersonalInfoDDataDealSum];
    [aCoder encodeObject:_cycleUnit forKey:kJCModel_PersonalInfoDDataCycleUnit];
    [aCoder encodeDouble:_dealPercent forKey:kJCModel_PersonalInfoDDataDealPercent];
    [aCoder encodeDouble:_probationOnSum forKey:kJCModel_PersonalInfoDDataProbationOnSum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PersonalInfoDData *copy = [[JCModel_PersonalInfoDData alloc] init];
    
    
    
    if (copy) {

        copy.probationSum = self.probationSum;
        copy.dealSum = self.dealSum;
        copy.cycleUnit = [self.cycleUnit copyWithZone:zone];
        copy.dealPercent = self.dealPercent;
        copy.probationOnSum = self.probationOnSum;
    }
    
    return copy;
}


@end
