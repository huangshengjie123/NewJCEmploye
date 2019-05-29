//
//  JCModel_FinancialPrepaidItemXNums.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinancialPrepaidItemXNums.h"


NSString *const kJCModel_FinancialPrepaidItemXNumsNum = @"num";
NSString *const kJCModel_FinancialPrepaidItemXNumsItem = @"item";


@interface JCModel_FinancialPrepaidItemXNums ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinancialPrepaidItemXNums

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
            self.num = [[self objectOrNilForKey:kJCModel_FinancialPrepaidItemXNumsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_FinancialPrepaidItemXNumsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_FinancialPrepaidItemXNumsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_FinancialPrepaidItemXNumsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_FinancialPrepaidItemXNumsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_FinancialPrepaidItemXNumsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_FinancialPrepaidItemXNumsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_FinancialPrepaidItemXNumsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinancialPrepaidItemXNums *copy = [[JCModel_FinancialPrepaidItemXNums alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
