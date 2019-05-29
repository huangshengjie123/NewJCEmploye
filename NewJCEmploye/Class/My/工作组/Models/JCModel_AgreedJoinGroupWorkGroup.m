//
//  JCModel_AgreedJoinGroupWorkGroup.m
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AgreedJoinGroupWorkGroup.h"


NSString *const kJCModel_AgreedJoinGroupWorkGroupId = @"id";


@interface JCModel_AgreedJoinGroupWorkGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AgreedJoinGroupWorkGroup

@synthesize workGroupIdentifier = _workGroupIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.workGroupIdentifier = [self objectOrNilForKey:kJCModel_AgreedJoinGroupWorkGroupId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.workGroupIdentifier forKey:kJCModel_AgreedJoinGroupWorkGroupId];

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

    self.workGroupIdentifier = [aDecoder decodeObjectForKey:kJCModel_AgreedJoinGroupWorkGroupId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_workGroupIdentifier forKey:kJCModel_AgreedJoinGroupWorkGroupId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AgreedJoinGroupWorkGroup *copy = [[JCModel_AgreedJoinGroupWorkGroup alloc] init];
    
    
    
    if (copy) {

        copy.workGroupIdentifier = [self.workGroupIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
