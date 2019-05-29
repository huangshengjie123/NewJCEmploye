//
//  JCModel_newReturnGoods2RefundmentCosts.m
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnGoods2RefundmentCosts.h"


NSString *const kJCModel_newReturnGoods2RefundmentCostsNum = @"num";
NSString *const kJCModel_newReturnGoods2RefundmentCostsItem = @"item";


@interface JCModel_newReturnGoods2RefundmentCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnGoods2RefundmentCosts

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
            self.num = [[self objectOrNilForKey:kJCModel_newReturnGoods2RefundmentCostsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_newReturnGoods2RefundmentCostsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_newReturnGoods2RefundmentCostsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_newReturnGoods2RefundmentCostsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_newReturnGoods2RefundmentCostsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_newReturnGoods2RefundmentCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_newReturnGoods2RefundmentCostsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_newReturnGoods2RefundmentCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnGoods2RefundmentCosts *copy = [[JCModel_newReturnGoods2RefundmentCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
