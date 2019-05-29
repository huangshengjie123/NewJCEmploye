//
//  JCModel_ReceivableOrderOrderPresents.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderOrderPresents.h"


NSString *const kJCModel_ReceivableOrderOrderPresentsNum = @"num";
NSString *const kJCModel_ReceivableOrderOrderPresentsId = @"id";
NSString *const kJCModel_ReceivableOrderOrderPresentsItem = @"item";
NSString *const kJCModel_ReceivableOrderOrderPresentsName = @"name";


@interface JCModel_ReceivableOrderOrderPresents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderOrderPresents

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
            self.num = [[self objectOrNilForKey:kJCModel_ReceivableOrderOrderPresentsNum fromDictionary:dict] doubleValue];
            self.orderPresentsIdentifier = [self objectOrNilForKey:kJCModel_ReceivableOrderOrderPresentsId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_ReceivableOrderOrderPresentsItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_ReceivableOrderOrderPresentsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_ReceivableOrderOrderPresentsNum];
    [mutableDict setValue:self.orderPresentsIdentifier forKey:kJCModel_ReceivableOrderOrderPresentsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_ReceivableOrderOrderPresentsItem];
    [mutableDict setValue:self.name forKey:kJCModel_ReceivableOrderOrderPresentsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderOrderPresentsNum];
    self.orderPresentsIdentifier = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderOrderPresentsId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderOrderPresentsItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderOrderPresentsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_ReceivableOrderOrderPresentsNum];
    [aCoder encodeObject:_orderPresentsIdentifier forKey:kJCModel_ReceivableOrderOrderPresentsId];
    [aCoder encodeDouble:_item forKey:kJCModel_ReceivableOrderOrderPresentsItem];
    [aCoder encodeObject:_name forKey:kJCModel_ReceivableOrderOrderPresentsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderOrderPresents *copy = [[JCModel_ReceivableOrderOrderPresents alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.orderPresentsIdentifier = [self.orderPresentsIdentifier copyWithZone:zone];
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
