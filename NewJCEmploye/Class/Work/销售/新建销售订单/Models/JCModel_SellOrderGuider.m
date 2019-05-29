//
//  JCModel_SellOrderGuider.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderGuider.h"


NSString *const kJCModel_SellOrderGuiderId = @"id";
NSString *const kJCModel_SellOrderGuiderName = @"name";
NSString *const kJCModel_SellOrderGuiderMbPhone = @"mbPhone";


@interface JCModel_SellOrderGuider ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderGuider

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
            self.guiderIdentifier = [[self objectOrNilForKey:kJCModel_SellOrderGuiderId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_SellOrderGuiderName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_SellOrderGuiderMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guiderIdentifier] forKey:kJCModel_SellOrderGuiderId];
    [mutableDict setValue:self.name forKey:kJCModel_SellOrderGuiderName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_SellOrderGuiderMbPhone];

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

    self.guiderIdentifier = [aDecoder decodeDoubleForKey:kJCModel_SellOrderGuiderId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_SellOrderGuiderName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_SellOrderGuiderMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_guiderIdentifier forKey:kJCModel_SellOrderGuiderId];
    [aCoder encodeObject:_name forKey:kJCModel_SellOrderGuiderName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_SellOrderGuiderMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderGuider *copy = [[JCModel_SellOrderGuider alloc] init];
    
    
    
    if (copy) {

        copy.guiderIdentifier = self.guiderIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
