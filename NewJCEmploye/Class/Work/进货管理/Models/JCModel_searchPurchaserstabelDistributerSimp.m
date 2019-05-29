//
//  JCModel_searchPurchaserstabelDistributerSimp.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelDistributerSimp.h"


NSString *const kJCModel_searchPurchaserstabelDistributerSimpId = @"id";
NSString *const kJCModel_searchPurchaserstabelDistributerSimpName = @"name";
NSString *const kJCModel_searchPurchaserstabelDistributerSimpMbPhone = @"mbPhone";


@interface JCModel_searchPurchaserstabelDistributerSimp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelDistributerSimp

@synthesize distributerSimpIdentifier = _distributerSimpIdentifier;
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
            self.distributerSimpIdentifier = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelDistributerSimpId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_searchPurchaserstabelDistributerSimpName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_searchPurchaserstabelDistributerSimpMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.distributerSimpIdentifier] forKey:kJCModel_searchPurchaserstabelDistributerSimpId];
    [mutableDict setValue:self.name forKey:kJCModel_searchPurchaserstabelDistributerSimpName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_searchPurchaserstabelDistributerSimpMbPhone];

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

    self.distributerSimpIdentifier = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelDistributerSimpId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelDistributerSimpName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelDistributerSimpMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_distributerSimpIdentifier forKey:kJCModel_searchPurchaserstabelDistributerSimpId];
    [aCoder encodeObject:_name forKey:kJCModel_searchPurchaserstabelDistributerSimpName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_searchPurchaserstabelDistributerSimpMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelDistributerSimp *copy = [[JCModel_searchPurchaserstabelDistributerSimp alloc] init];
    
    
    
    if (copy) {

        copy.distributerSimpIdentifier = self.distributerSimpIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
