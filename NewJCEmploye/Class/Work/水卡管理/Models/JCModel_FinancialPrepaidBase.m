//
//  JCModel_FinancialPrepaidBase.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinancialPrepaidBase.h"
#import "JCModel_FinancialPrepaidItemXNums.h"


NSString *const kJCModel_FinancialPrepaidBasePurid = @"purid";
NSString *const kJCModel_FinancialPrepaidBaseWaterCardId = @"waterCardId";
NSString *const kJCModel_FinancialPrepaidBaseItemXNums = @"itemXNums";


@interface JCModel_FinancialPrepaidBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinancialPrepaidBase

@synthesize purid = _purid;
@synthesize waterCardId = _waterCardId;
@synthesize itemXNums = _itemXNums;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.purid = [self objectOrNilForKey:kJCModel_FinancialPrepaidBasePurid fromDictionary:dict];
            self.waterCardId = [self objectOrNilForKey:kJCModel_FinancialPrepaidBaseWaterCardId fromDictionary:dict];
    NSObject *receivedJCModel_FinancialPrepaidItemXNums = [dict objectForKey:kJCModel_FinancialPrepaidBaseItemXNums];
    NSMutableArray *parsedJCModel_FinancialPrepaidItemXNums = [NSMutableArray array];
    
    if ([receivedJCModel_FinancialPrepaidItemXNums isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_FinancialPrepaidItemXNums) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_FinancialPrepaidItemXNums addObject:[JCModel_FinancialPrepaidItemXNums modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_FinancialPrepaidItemXNums isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_FinancialPrepaidItemXNums addObject:[JCModel_FinancialPrepaidItemXNums modelObjectWithDictionary:(NSDictionary *)receivedJCModel_FinancialPrepaidItemXNums]];
    }

    self.itemXNums = [NSArray arrayWithArray:parsedJCModel_FinancialPrepaidItemXNums];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.purid forKey:kJCModel_FinancialPrepaidBasePurid];
    [mutableDict setValue:self.waterCardId forKey:kJCModel_FinancialPrepaidBaseWaterCardId];
    NSMutableArray *tempArrayForItemXNums = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.itemXNums) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemXNums addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemXNums addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemXNums] forKey:kJCModel_FinancialPrepaidBaseItemXNums];

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

    self.purid = [aDecoder decodeObjectForKey:kJCModel_FinancialPrepaidBasePurid];
    self.waterCardId = [aDecoder decodeObjectForKey:kJCModel_FinancialPrepaidBaseWaterCardId];
    self.itemXNums = [aDecoder decodeObjectForKey:kJCModel_FinancialPrepaidBaseItemXNums];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_purid forKey:kJCModel_FinancialPrepaidBasePurid];
    [aCoder encodeObject:_waterCardId forKey:kJCModel_FinancialPrepaidBaseWaterCardId];
    [aCoder encodeObject:_itemXNums forKey:kJCModel_FinancialPrepaidBaseItemXNums];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinancialPrepaidBase *copy = [[JCModel_FinancialPrepaidBase alloc] init];
    
    
    
    if (copy) {

        copy.purid = [self.purid copyWithZone:zone];
        copy.waterCardId = [self.waterCardId copyWithZone:zone];
        copy.itemXNums = [self.itemXNums copyWithZone:zone];
    }
    
    return copy;
}


@end
