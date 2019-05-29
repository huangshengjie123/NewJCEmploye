//
//  JCModel_WaterConsumptionCardItems.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterConsumptionCardItems.h"


NSString *const kJCModel_WaterConsumptionCardItemsNum = @"num";
NSString *const kJCModel_WaterConsumptionCardItemsItem = @"item";


@interface JCModel_WaterConsumptionCardItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterConsumptionCardItems

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
            self.num = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardItemsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_WaterConsumptionCardItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_WaterConsumptionCardItemsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_WaterConsumptionCardItemsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardItemsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_WaterConsumptionCardItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_WaterConsumptionCardItemsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_WaterConsumptionCardItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterConsumptionCardItems *copy = [[JCModel_WaterConsumptionCardItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
