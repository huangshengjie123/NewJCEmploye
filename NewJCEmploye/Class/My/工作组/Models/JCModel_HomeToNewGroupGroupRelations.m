//
//  JCModel_HomeToNewGroupGroupRelations.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_HomeToNewGroupGroupRelations.h"


NSString *const kJCModel_HomeToNewGroupGroupRelationsNumber = @"number";


@interface JCModel_HomeToNewGroupGroupRelations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_HomeToNewGroupGroupRelations

@synthesize number = _number;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.number = [[self objectOrNilForKey:kJCModel_HomeToNewGroupGroupRelationsNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_HomeToNewGroupGroupRelationsNumber];

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

    self.number = [aDecoder decodeDoubleForKey:kJCModel_HomeToNewGroupGroupRelationsNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_number forKey:kJCModel_HomeToNewGroupGroupRelationsNumber];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_HomeToNewGroupGroupRelations *copy = [[JCModel_HomeToNewGroupGroupRelations alloc] init];
    
    
    
    if (copy) {

        copy.number = self.number;
    }
    
    return copy;
}


@end
