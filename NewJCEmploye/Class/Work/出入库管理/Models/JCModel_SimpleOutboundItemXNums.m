//
//  JCModel_SimpleOutboundItemXNums.m
//
//  Created by   on 2018/7/7
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SimpleOutboundItemXNums.h"


NSString *const kJCModel_SimpleOutboundItemXNumsNum = @"num";
NSString *const kJCModel_SimpleOutboundItemXNumsName = @"name";
NSString *const kJCModel_SimpleOutboundItemXNumsItem = @"item";


@interface JCModel_SimpleOutboundItemXNums ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SimpleOutboundItemXNums

@synthesize num = _num;
@synthesize name = _name;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_SimpleOutboundItemXNumsNum fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_SimpleOutboundItemXNumsName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_SimpleOutboundItemXNumsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_SimpleOutboundItemXNumsNum];
    [mutableDict setValue:self.name forKey:kJCModel_SimpleOutboundItemXNumsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_SimpleOutboundItemXNumsItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_SimpleOutboundItemXNumsNum];
    self.name = [aDecoder decodeObjectForKey:kJCModel_SimpleOutboundItemXNumsName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_SimpleOutboundItemXNumsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_SimpleOutboundItemXNumsNum];
    [aCoder encodeObject:_name forKey:kJCModel_SimpleOutboundItemXNumsName];
    [aCoder encodeDouble:_item forKey:kJCModel_SimpleOutboundItemXNumsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SimpleOutboundItemXNums *copy = [[JCModel_SimpleOutboundItemXNums alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.name = [self.name copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
