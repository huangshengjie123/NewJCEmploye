//
//  JCModel_WorkGroupGroupRelations.m
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkGroupGroupRelations.h"


NSString *const kJCModel_WorkGroupGroupRelationsId = @"id";
NSString *const kJCModel_WorkGroupGroupRelationsNumber = @"number";
NSString *const kJCModel_WorkGroupGroupRelationsName = @"name";


@interface JCModel_WorkGroupGroupRelations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkGroupGroupRelations

@synthesize groupRelationsIdentifier = _groupRelationsIdentifier;
@synthesize number = _number;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.groupRelationsIdentifier = [[self objectOrNilForKey:kJCModel_WorkGroupGroupRelationsId fromDictionary:dict]doubleValue];
            self.number = [[self objectOrNilForKey:kJCModel_WorkGroupGroupRelationsNumber fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_WorkGroupGroupRelationsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupRelationsIdentifier] forKey:kJCModel_WorkGroupGroupRelationsId];

    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_WorkGroupGroupRelationsNumber];
    [mutableDict setValue:self.name forKey:kJCModel_WorkGroupGroupRelationsName];

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
    self.number = [aDecoder decodeDoubleForKey:kJCModel_WorkGroupGroupRelationsId];
    self.number = [aDecoder decodeDoubleForKey:kJCModel_WorkGroupGroupRelationsNumber];
    self.name = [aDecoder decodeObjectForKey:kJCModel_WorkGroupGroupRelationsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:_groupRelationsIdentifier forKey:kJCModel_WorkGroupGroupRelationsNumber];

    [aCoder encodeDouble:_number forKey:kJCModel_WorkGroupGroupRelationsNumber];
    [aCoder encodeObject:_name forKey:kJCModel_WorkGroupGroupRelationsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkGroupGroupRelations *copy = [[JCModel_WorkGroupGroupRelations alloc] init];
    
    
    
    if (copy) {
        copy.number = self.groupRelationsIdentifier;
        copy.number = self.number;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
