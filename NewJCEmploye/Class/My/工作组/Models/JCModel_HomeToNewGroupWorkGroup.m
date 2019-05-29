//
//  JCModel_HomeToNewGroupWorkGroup.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_HomeToNewGroupWorkGroup.h"
#import "JCModel_HomeToNewGroupGroupRelations.h"


NSString *const kJCModel_HomeToNewGroupWorkGroupId = @"id";
NSString *const kJCModel_HomeToNewGroupWorkGroupGroupRelations = @"groupRelations";


@interface JCModel_HomeToNewGroupWorkGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_HomeToNewGroupWorkGroup

@synthesize workGroupIdentifier = _workGroupIdentifier;
@synthesize groupRelations = _groupRelations;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.workGroupIdentifier = [self objectOrNilForKey:kJCModel_HomeToNewGroupWorkGroupId fromDictionary:dict];
    NSObject *receivedJCModel_HomeToNewGroupGroupRelations = [dict objectForKey:kJCModel_HomeToNewGroupWorkGroupGroupRelations];
    NSMutableArray *parsedJCModel_HomeToNewGroupGroupRelations = [NSMutableArray array];
    
    if ([receivedJCModel_HomeToNewGroupGroupRelations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_HomeToNewGroupGroupRelations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_HomeToNewGroupGroupRelations addObject:[JCModel_HomeToNewGroupGroupRelations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_HomeToNewGroupGroupRelations isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_HomeToNewGroupGroupRelations addObject:[JCModel_HomeToNewGroupGroupRelations modelObjectWithDictionary:(NSDictionary *)receivedJCModel_HomeToNewGroupGroupRelations]];
    }

    self.groupRelations = [NSArray arrayWithArray:parsedJCModel_HomeToNewGroupGroupRelations];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.workGroupIdentifier forKey:kJCModel_HomeToNewGroupWorkGroupId];
    NSMutableArray *tempArrayForGroupRelations = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.groupRelations) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroupRelations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroupRelations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroupRelations] forKey:kJCModel_HomeToNewGroupWorkGroupGroupRelations];

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

    self.workGroupIdentifier = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupWorkGroupId];
    self.groupRelations = [aDecoder decodeObjectForKey:kJCModel_HomeToNewGroupWorkGroupGroupRelations];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_workGroupIdentifier forKey:kJCModel_HomeToNewGroupWorkGroupId];
    [aCoder encodeObject:_groupRelations forKey:kJCModel_HomeToNewGroupWorkGroupGroupRelations];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_HomeToNewGroupWorkGroup *copy = [[JCModel_HomeToNewGroupWorkGroup alloc] init];
    
    
    
    if (copy) {

        copy.workGroupIdentifier = [self.workGroupIdentifier copyWithZone:zone];
        copy.groupRelations = [self.groupRelations copyWithZone:zone];
    }
    
    return copy;
}


@end
