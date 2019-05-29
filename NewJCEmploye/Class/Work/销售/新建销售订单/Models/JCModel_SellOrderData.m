//
//  JCModel_SellOrderData.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderData.h"
#import "JCModel_SellOrderPageProperties.h"
#import "JCModel_SellOrderList.h"


NSString *const kJCModel_SellOrderDataPageProperties = @"pageProperties";
NSString *const kJCModel_SellOrderDataList = @"list";


@interface JCModel_SellOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderData

@synthesize pageProperties = _pageProperties;
@synthesize list = _list;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pageProperties = [JCModel_SellOrderPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_SellOrderDataPageProperties]];
    NSObject *receivedJCModel_SellOrderList = [dict objectForKey:kJCModel_SellOrderDataList];
    NSMutableArray *parsedJCModel_SellOrderList = [NSMutableArray array];
    
    if ([receivedJCModel_SellOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SellOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SellOrderList addObject:[JCModel_SellOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SellOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SellOrderList addObject:[JCModel_SellOrderList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SellOrderList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_SellOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_SellOrderDataPageProperties];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_SellOrderDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_SellOrderDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_SellOrderDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_SellOrderDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_SellOrderDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderData *copy = [[JCModel_SellOrderData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
