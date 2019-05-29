//
//  JCModel_inOutRewriteItems.m
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inOutRewriteItems.h"


NSString *const kJCModel_inOutRewriteItemsNum = @"num";
NSString *const kJCModel_inOutRewriteItemsItem = @"item";
NSString *const kJCModel_inOutRewriteItemsTest = @"test";


@interface JCModel_inOutRewriteItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inOutRewriteItems

@synthesize num = _num;
@synthesize item = _item;
@synthesize test = _test;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_inOutRewriteItemsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_inOutRewriteItemsItem fromDictionary:dict] doubleValue];
            self.test = [self objectOrNilForKey:kJCModel_inOutRewriteItemsTest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_inOutRewriteItemsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_inOutRewriteItemsItem];
    [mutableDict setValue:self.test forKey:kJCModel_inOutRewriteItemsTest];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_inOutRewriteItemsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_inOutRewriteItemsItem];
    self.test = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteItemsTest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_inOutRewriteItemsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_inOutRewriteItemsItem];
    [aCoder encodeObject:_test forKey:kJCModel_inOutRewriteItemsTest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inOutRewriteItems *copy = [[JCModel_inOutRewriteItems alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
        copy.test = [self.test copyWithZone:zone];
    }
    
    return copy;
}


@end
