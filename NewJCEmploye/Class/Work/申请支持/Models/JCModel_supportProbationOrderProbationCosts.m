//
//  JCModel_supportProbationOrderProbationCosts.m
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportProbationOrderProbationCosts.h"


NSString *const kJCModel_supportProbationOrderProbationCostsNum = @"num";
NSString *const kJCModel_supportProbationOrderProbationCostsItem = @"item";


@interface JCModel_supportProbationOrderProbationCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportProbationOrderProbationCosts

@synthesize num = _num;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_supportProbationOrderProbationCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_supportProbationOrderProbationCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_supportProbationOrderProbationCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_supportProbationOrderProbationCostsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_supportProbationOrderProbationCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_supportProbationOrderProbationCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_supportProbationOrderProbationCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_supportProbationOrderProbationCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportProbationOrderProbationCosts *copy = [[JCModel_supportProbationOrderProbationCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
