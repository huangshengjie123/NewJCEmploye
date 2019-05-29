//
//  JCModel_NewSellOrderUpModelPCosts.m
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellOrderUpModelPCosts.h"


NSString *const kJCModel_NewSellOrderUpModelPCostsNum = @"num";
NSString *const kJCModel_NewSellOrderUpModelPCostsItem = @"item";


@interface JCModel_NewSellOrderUpModelPCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellOrderUpModelPCosts

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
            self.num = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelPCostsNum fromDictionary:dict];
            self.item = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelPCostsItem fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.num forKey:kJCModel_NewSellOrderUpModelPCostsNum];
    [mutableDict setValue:self.item forKey:kJCModel_NewSellOrderUpModelPCostsItem];

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

    self.num = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelPCostsNum];
    self.item = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelPCostsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_num forKey:kJCModel_NewSellOrderUpModelPCostsNum];
    [aCoder encodeObject:_item forKey:kJCModel_NewSellOrderUpModelPCostsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellOrderUpModelPCosts *copy = [[JCModel_NewSellOrderUpModelPCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = [self.num copyWithZone:zone];
        copy.item = [self.item copyWithZone:zone];
    }
    
    return copy;
}


@end
