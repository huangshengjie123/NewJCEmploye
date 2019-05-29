//
//  JCModel_probationOrderGuider.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderGuider.h"


NSString *const kJCModel_probationOrderGuiderId = @"id";
NSString *const kJCModel_probationOrderGuiderName = @"name";
NSString *const kJCModel_probationOrderGuiderMbPhone = @"mbPhone";


@interface JCModel_probationOrderGuider ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderGuider

@synthesize guiderIdentifier = _guiderIdentifier;
@synthesize name = _name;
@synthesize mbPhone = _mbPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.guiderIdentifier = [[self objectOrNilForKey:kJCModel_probationOrderGuiderId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_probationOrderGuiderName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_probationOrderGuiderMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guiderIdentifier] forKey:kJCModel_probationOrderGuiderId];
    [mutableDict setValue:self.name forKey:kJCModel_probationOrderGuiderName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_probationOrderGuiderMbPhone];

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

    self.guiderIdentifier = [aDecoder decodeDoubleForKey:kJCModel_probationOrderGuiderId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_probationOrderGuiderName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_probationOrderGuiderMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_guiderIdentifier forKey:kJCModel_probationOrderGuiderId];
    [aCoder encodeObject:_name forKey:kJCModel_probationOrderGuiderName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_probationOrderGuiderMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderGuider *copy = [[JCModel_probationOrderGuider alloc] init];
    
    
    
    if (copy) {

        copy.guiderIdentifier = self.guiderIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
