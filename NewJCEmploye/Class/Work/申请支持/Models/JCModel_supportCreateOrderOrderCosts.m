//
//  JCModel_supportCreateOrderOrderCosts.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportCreateOrderOrderCosts.h"


NSString *const kJCModel_supportCreateOrderOrderCostsNum = @"num";
NSString *const kJCModel_supportCreateOrderOrderCostsItem = @"item";


@interface JCModel_supportCreateOrderOrderCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportCreateOrderOrderCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_supportCreateOrderOrderCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_supportCreateOrderOrderCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_supportCreateOrderOrderCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_supportCreateOrderOrderCostsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_supportCreateOrderOrderCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_supportCreateOrderOrderCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_supportCreateOrderOrderCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_supportCreateOrderOrderCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportCreateOrderOrderCosts *copy = [[JCModel_supportCreateOrderOrderCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
