//
//  JCModel_SellOrderOrderPresents.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderOrderPresents.h"


NSString *const kJCModel_SellOrderOrderPresentsNum = @"num";
NSString *const kJCModel_SellOrderOrderPresentsId = @"id";
NSString *const kJCModel_SellOrderOrderPresentsItem = @"item";
NSString *const kJCModel_SellOrderOrderPresentsName = @"name";


@interface JCModel_SellOrderOrderPresents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderOrderPresents

@synthesize num = _num;
@synthesize orderPresentsIdentifier = _orderPresentsIdentifier;
@synthesize item = _item;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_SellOrderOrderPresentsNum fromDictionary:dict] doubleValue];
            self.orderPresentsIdentifier = [self objectOrNilForKey:kJCModel_SellOrderOrderPresentsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_SellOrderOrderPresentsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_SellOrderOrderPresentsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_SellOrderOrderPresentsNum];
    [mutableDict setValue:self.orderPresentsIdentifier forKey:kJCModel_SellOrderOrderPresentsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_SellOrderOrderPresentsItem];
    [mutableDict setValue:self.name forKey:kJCModel_SellOrderOrderPresentsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_SellOrderOrderPresentsNum];
    self.orderPresentsIdentifier = [aDecoder decodeObjectForKey:kJCModel_SellOrderOrderPresentsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_SellOrderOrderPresentsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_SellOrderOrderPresentsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_SellOrderOrderPresentsNum];
    [aCoder encodeObject:_orderPresentsIdentifier forKey:kJCModel_SellOrderOrderPresentsId];
    [aCoder encodeDouble:_item forKey:kJCModel_SellOrderOrderPresentsItem];
    [aCoder encodeObject:_name forKey:kJCModel_SellOrderOrderPresentsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderOrderPresents *copy = [[JCModel_SellOrderOrderPresents alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.orderPresentsIdentifier = [self.orderPresentsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
