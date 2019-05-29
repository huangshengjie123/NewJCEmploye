//
//  JCModel_NewDealerSaleOrderPresents.m
//
//  Created by   on 2018/9/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDealerSaleOrderPresents.h"


NSString *const kJCModel_NewDealerSaleOrderPresentsNum = @"num";
NSString *const kJCModel_NewDealerSaleOrderPresentsItem = @"item";


@interface JCModel_NewDealerSaleOrderPresents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDealerSaleOrderPresents

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
            self.num = [[self objectOrNilForKey:kJCModel_NewDealerSaleOrderPresentsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_NewDealerSaleOrderPresentsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_NewDealerSaleOrderPresentsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_NewDealerSaleOrderPresentsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_NewDealerSaleOrderPresentsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_NewDealerSaleOrderPresentsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_NewDealerSaleOrderPresentsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_NewDealerSaleOrderPresentsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDealerSaleOrderPresents *copy = [[JCModel_NewDealerSaleOrderPresents alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
    }
    
    return copy;
}


@end
