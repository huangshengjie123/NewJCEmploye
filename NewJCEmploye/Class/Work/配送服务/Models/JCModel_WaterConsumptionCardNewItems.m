//
//  JCModel_WaterConsumptionCardNewItems.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardNewItems.h"


NSString *const kJCModel_WaterConsumptionCardNewItemsNum = @"num";
NSString *const kJCModel_WaterConsumptionCardNewItemsItem = @"item";


@interface JCModel_WaterConsumptionCardNewItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardNewItems

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
            self.num = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardNewItemsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardNewItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_WaterConsumptionCardNewItemsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_WaterConsumptionCardNewItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardNewItemsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardNewItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_WaterConsumptionCardNewItemsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_WaterConsumptionCardNewItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardNewItems *copy = [[JCModel_WaterConsumptionCardNewItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
