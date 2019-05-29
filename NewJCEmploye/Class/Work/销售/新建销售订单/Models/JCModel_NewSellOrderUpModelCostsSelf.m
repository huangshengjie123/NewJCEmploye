//
//  JCModel_NewSellOrderUpModelCostsSelf.m
//
//  Created by   on 2018/7/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellOrderUpModelCostsSelf.h"


NSString *const kJCModel_NewSellOrderUpModelCostsSelfNum = @"num";
NSString *const kJCModel_NewSellOrderUpModelCostsSelfItem = @"item";


@interface JCModel_NewSellOrderUpModelCostsSelf ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellOrderUpModelCostsSelf

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
            self.num = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelCostsSelfNum fromDictionary:dict];
            self.item = [self objectOrNilForKey:kJCModel_NewSellOrderUpModelCostsSelfItem fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.num forKey:kJCModel_NewSellOrderUpModelCostsSelfNum];
    [mutableDict setValue:self.item forKey:kJCModel_NewSellOrderUpModelCostsSelfItem];

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

    self.num = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelCostsSelfNum];
    self.item = [aDecoder decodeObjectForKey:kJCModel_NewSellOrderUpModelCostsSelfItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_num forKey:kJCModel_NewSellOrderUpModelCostsSelfNum];
    [aCoder encodeObject:_item forKey:kJCModel_NewSellOrderUpModelCostsSelfItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellOrderUpModelCostsSelf *copy = [[JCModel_NewSellOrderUpModelCostsSelf alloc] init];
    
    
    
    if (copy) {

        copy.num = [self.num copyWithZone:zone];
        copy.item = [self.item copyWithZone:zone];
    }
    
    return copy;
}


@end
