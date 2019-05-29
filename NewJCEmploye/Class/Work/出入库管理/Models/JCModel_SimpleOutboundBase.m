//
//  JCModel_SimpleOutboundBase.m
//
//  Created by   on 2018/7/7
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SimpleOutboundBase.h"
#import "JCModel_SimpleOutboundItemXNums.h"


NSString *const kJCModel_SimpleOutboundBaseStoreHouseId = @"storeHouseId";
NSString *const kJCModel_SimpleOutboundBaseDistributor = @"distributor";
NSString *const kJCModel_SimpleOutboundBaseItemXNums = @"itemXNums";


@interface JCModel_SimpleOutboundBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SimpleOutboundBase

@synthesize storeHouseId = _storeHouseId;
@synthesize distributor = _distributor;
@synthesize itemXNums = _itemXNums;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storeHouseId = [[self objectOrNilForKey:kJCModel_SimpleOutboundBaseStoreHouseId fromDictionary:dict] doubleValue];
            self.distributor = [[self objectOrNilForKey:kJCModel_SimpleOutboundBaseDistributor fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_SimpleOutboundItemXNums = [dict objectForKey:kJCModel_SimpleOutboundBaseItemXNums];
    NSMutableArray *parsedJCModel_SimpleOutboundItemXNums = [NSMutableArray array];
    
    if ([receivedJCModel_SimpleOutboundItemXNums isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SimpleOutboundItemXNums) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SimpleOutboundItemXNums addObject:[JCModel_SimpleOutboundItemXNums modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SimpleOutboundItemXNums isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SimpleOutboundItemXNums addObject:[JCModel_SimpleOutboundItemXNums modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SimpleOutboundItemXNums]];
    }

    self.itemXNums = [NSArray arrayWithArray:parsedJCModel_SimpleOutboundItemXNums];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouseId] forKey:kJCModel_SimpleOutboundBaseStoreHouseId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.distributor] forKey:kJCModel_SimpleOutboundBaseDistributor];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemXNums] forKey:kJCModel_SimpleOutboundBaseItemXNums];

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

    self.storeHouseId = [aDecoder decodeDoubleForKey:kJCModel_SimpleOutboundBaseStoreHouseId];
    self.distributor = [aDecoder decodeDoubleForKey:kJCModel_SimpleOutboundBaseDistributor];
    self.itemXNums = [aDecoder decodeObjectForKey:kJCModel_SimpleOutboundBaseItemXNums];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_storeHouseId forKey:kJCModel_SimpleOutboundBaseStoreHouseId];
    [aCoder encodeDouble:_distributor forKey:kJCModel_SimpleOutboundBaseDistributor];
    [aCoder encodeObject:_itemXNums forKey:kJCModel_SimpleOutboundBaseItemXNums];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SimpleOutboundBase *copy = [[JCModel_SimpleOutboundBase alloc] init];
    
    
    
    if (copy) {

        copy.storeHouseId = self.storeHouseId;
        copy.distributor = self.distributor;
        copy.itemXNums = [self.itemXNums copyWithZone:zone];
    }
    
    return copy;
}


@end
