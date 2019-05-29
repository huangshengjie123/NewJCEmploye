//
//  JCModel_updateCooPointCostItemBackItemXNums.m
//
//  Created by   on 2019/1/17
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateCooPointCostItemBackItemXNums.h"


NSString *const kJCModel_updateCooPointCostItemBackItemXNumsNum = @"num";
NSString *const kJCModel_updateCooPointCostItemBackItemXNumsItem = @"item";


@interface JCModel_updateCooPointCostItemBackItemXNums ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateCooPointCostItemBackItemXNums

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
            self.num = [[self objectOrNilForKey:kJCModel_updateCooPointCostItemBackItemXNumsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_updateCooPointCostItemBackItemXNumsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_updateCooPointCostItemBackItemXNumsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_updateCooPointCostItemBackItemXNumsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_updateCooPointCostItemBackItemXNumsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_updateCooPointCostItemBackItemXNumsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_updateCooPointCostItemBackItemXNumsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_updateCooPointCostItemBackItemXNumsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateCooPointCostItemBackItemXNums *copy = [[JCModel_updateCooPointCostItemBackItemXNums alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
