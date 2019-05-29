//
//  JCModel_beyondBacklogParams.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_beyondBacklogParams.h"


NSString *const kJCModel_beyondBacklogParamsOwner = @"owner";
NSString *const kJCModel_beyondBacklogParamsWorkGroup = @"workGroup";
NSString *const kJCModel_beyondBacklogParamsInitiator = @"initiator";
NSString *const kJCModel_beyondBacklogParamsProcType = @"procType";


@interface JCModel_beyondBacklogParams ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_beyondBacklogParams

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
            self.owner = [[self objectOrNilForKey:kJCModel_beyondBacklogParamsOwner fromDictionary:dict] doubleValue];
            self.workGroup = [self objectOrNilForKey:kJCModel_beyondBacklogParamsWorkGroup fromDictionary:dict];
            self.initiator = [self objectOrNilForKey:kJCModel_beyondBacklogParamsInitiator fromDictionary:dict];
            self.procType = [self objectOrNilForKey:kJCModel_beyondBacklogParamsProcType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_beyondBacklogParamsOwner];
    [mutableDict setValue:self.workGroup forKey:kJCModel_beyondBacklogParamsWorkGroup];
    [mutableDict setValue:self.initiator forKey:kJCModel_beyondBacklogParamsInitiator];
    [mutableDict setValue:self.procType forKey:kJCModel_beyondBacklogParamsProcType];

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

    self.owner = [aDecoder decodeDoubleForKey:kJCModel_beyondBacklogParamsOwner];
    self.workGroup = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogParamsWorkGroup];
    self.initiator = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogParamsInitiator];
    self.procType = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogParamsProcType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_owner forKey:kJCModel_beyondBacklogParamsOwner];
    [aCoder encodeObject:_workGroup forKey:kJCModel_beyondBacklogParamsWorkGroup];
    [aCoder encodeObject:_initiator forKey:kJCModel_beyondBacklogParamsInitiator];
    [aCoder encodeObject:_procType forKey:kJCModel_beyondBacklogParamsProcType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_beyondBacklogParams *copy = [[JCModel_beyondBacklogParams alloc] init];
    
    
    
    if (copy) {

        copy.owner = self.owner;
        copy.workGroup = [self.workGroup copyWithZone:zone];
        copy.initiator = [self.initiator copyWithZone:zone];
        copy.procType = [self.procType copyWithZone:zone];
    }
    
    return copy;
}


@end
