//
//  JCModel_CooperationPoiontOrderGuider.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderGuider.h"


NSString *const kJCModel_CooperationPoiontOrderGuiderId = @"id";
NSString *const kJCModel_CooperationPoiontOrderGuiderName = @"name";
NSString *const kJCModel_CooperationPoiontOrderGuiderMbPhone = @"mbPhone";


@interface JCModel_CooperationPoiontOrderGuider ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderGuider

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
            self.guiderIdentifier = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderGuiderId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderGuiderName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderGuiderMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guiderIdentifier] forKey:kJCModel_CooperationPoiontOrderGuiderId];
    [mutableDict setValue:self.name forKey:kJCModel_CooperationPoiontOrderGuiderName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_CooperationPoiontOrderGuiderMbPhone];

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

    self.guiderIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderGuiderId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderGuiderName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderGuiderMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_guiderIdentifier forKey:kJCModel_CooperationPoiontOrderGuiderId];
    [aCoder encodeObject:_name forKey:kJCModel_CooperationPoiontOrderGuiderName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_CooperationPoiontOrderGuiderMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderGuider *copy = [[JCModel_CooperationPoiontOrderGuider alloc] init];
    
    
    
    if (copy) {

        copy.guiderIdentifier = self.guiderIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
