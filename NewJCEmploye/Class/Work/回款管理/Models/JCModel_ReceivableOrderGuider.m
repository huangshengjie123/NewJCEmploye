//
//  JCModel_ReceivableOrderGuider.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderGuider.h"


NSString *const kJCModel_ReceivableOrderGuiderId = @"id";
NSString *const kJCModel_ReceivableOrderGuiderName = @"name";
NSString *const kJCModel_ReceivableOrderGuiderMbPhone = @"mbPhone";


@interface JCModel_ReceivableOrderGuider ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderGuider

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
            self.guiderIdentifier = [[self objectOrNilForKey:kJCModel_ReceivableOrderGuiderId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ReceivableOrderGuiderName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_ReceivableOrderGuiderMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guiderIdentifier] forKey:kJCModel_ReceivableOrderGuiderId];
    [mutableDict setValue:self.name forKey:kJCModel_ReceivableOrderGuiderName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_ReceivableOrderGuiderMbPhone];

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

    self.guiderIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderGuiderId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderGuiderName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderGuiderMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_guiderIdentifier forKey:kJCModel_ReceivableOrderGuiderId];
    [aCoder encodeObject:_name forKey:kJCModel_ReceivableOrderGuiderName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_ReceivableOrderGuiderMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderGuider *copy = [[JCModel_ReceivableOrderGuider alloc] init];
    
    
    
    if (copy) {

        copy.guiderIdentifier = self.guiderIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
