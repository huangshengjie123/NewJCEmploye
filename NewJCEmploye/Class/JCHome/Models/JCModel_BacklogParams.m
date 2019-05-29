//
//  JCModel_BacklogParams.m
//
//  Created by   on 2018/12/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BacklogParams.h"


NSString *const kJCModel_BacklogParamsApplicant = @"applicant";
NSString *const kJCModel_BacklogParamsOwner = @"owner";
NSString *const kJCModel_BacklogParamsWorkGroup = @"workGroup";
NSString *const kJCModel_BacklogParamsInitiator = @"initiator";
NSString *const kJCModel_BacklogParamsProcType = @"procType";


@interface JCModel_BacklogParams ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BacklogParams

@synthesize applicant = _applicant;
@synthesize owner = _owner;
@synthesize workGroup = _workGroup;
@synthesize initiator = _initiator;
@synthesize procType = _procType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.applicant = [[self objectOrNilForKey:kJCModel_BacklogParamsApplicant fromDictionary:dict] doubleValue];
            self.owner = [[self objectOrNilForKey:kJCModel_BacklogParamsOwner fromDictionary:dict] doubleValue];
            self.workGroup = [self objectOrNilForKey:kJCModel_BacklogParamsWorkGroup fromDictionary:dict];
            self.initiator = [self objectOrNilForKey:kJCModel_BacklogParamsInitiator fromDictionary:dict];
            self.procType = [self objectOrNilForKey:kJCModel_BacklogParamsProcType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_BacklogParamsApplicant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_BacklogParamsOwner];
    [mutableDict setValue:self.workGroup forKey:kJCModel_BacklogParamsWorkGroup];
    [mutableDict setValue:self.initiator forKey:kJCModel_BacklogParamsInitiator];
    [mutableDict setValue:self.procType forKey:kJCModel_BacklogParamsProcType];

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

    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_BacklogParamsApplicant];
    self.owner = [aDecoder decodeDoubleForKey:kJCModel_BacklogParamsOwner];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_BacklogParamsWorkGroup];
    self.initiator = [aDecoder decodeObjectForKey:kJCModel_BacklogParamsInitiator];
    self.procType = [aDecoder decodeObjectForKey:kJCModel_BacklogParamsProcType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_applicant forKey:kJCModel_BacklogParamsApplicant];
    [aCoder encodeDouble:_owner forKey:kJCModel_BacklogParamsOwner];
    [aCoder encodeObject:_workGroup forKey:kJCModel_BacklogParamsWorkGroup];
    [aCoder encodeObject:_initiator forKey:kJCModel_BacklogParamsInitiator];
    [aCoder encodeObject:_procType forKey:kJCModel_BacklogParamsProcType];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_BacklogParams *copy = [[JCModel_BacklogParams alloc] init];

    if (copy)
    {
        copy.applicant = self.applicant;
        copy.owner = self.owner;
        copy.workGroup = [self.workGroup copyWithZone:zone];
        copy.initiator = (id)[self.initiator copyWithZone:zone];
        copy.procType = [self.procType copyWithZone:zone];
    }
    
    return copy;
}


@end
