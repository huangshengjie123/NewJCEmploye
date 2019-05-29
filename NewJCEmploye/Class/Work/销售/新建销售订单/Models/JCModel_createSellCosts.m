//
//  JCModel_createSellCosts.m
//
//  Created by   on 2018/6/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createSellCosts.h"


NSString *const kJCModel_createSellCostsNum = @"num";
NSString *const kJCModel_createSellCostsItem = @"item";


@interface JCModel_createSellCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createSellCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_createSellCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_createSellCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_createSellCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_createSellCostsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_createSellCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_createSellCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_createSellCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_createSellCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createSellCosts *copy = [[JCModel_createSellCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
