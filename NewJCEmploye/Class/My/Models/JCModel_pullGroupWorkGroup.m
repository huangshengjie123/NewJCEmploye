//
//  JCModel_pullGroupWorkGroup.m
//
//  Created by   on 2018/10/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_pullGroupWorkGroup.h"


NSString *const kJCModel_pullGroupWorkGroupId = @"id";


@interface JCModel_pullGroupWorkGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_pullGroupWorkGroup

@synthesize workGroupIdentifier = _workGroupIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.workGroupIdentifier = [self objectOrNilForKey:kJCModel_pullGroupWorkGroupId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.workGroupIdentifier forKey:kJCModel_pullGroupWorkGroupId];

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

    self.workGroupIdentifier = [aDecoder decodeObjectForKey:kJCModel_pullGroupWorkGroupId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_workGroupIdentifier forKey:kJCModel_pullGroupWorkGroupId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_pullGroupWorkGroup *copy = [[JCModel_pullGroupWorkGroup alloc] init];
    
    
    
    if (copy) {

        copy.workGroupIdentifier = [self.workGroupIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
