//
//  JCModel_ReceivableOrderData.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderData.h"
#import "JCModel_ReceivableOrderPageProperties.h"
#import "JCModel_ReceivableOrderList.h"


NSString *const kJCModel_ReceivableOrderDataPageProperties = @"pageProperties";
NSString *const kJCModel_ReceivableOrderDataList = @"list";


@interface JCModel_ReceivableOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderData

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
            self.pageProperties = [JCModel_ReceivableOrderPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_ReceivableOrderDataPageProperties]];
    NSObject *receivedJCModel_ReceivableOrderList = [dict objectForKey:kJCModel_ReceivableOrderDataList];
    NSMutableArray *parsedJCModel_ReceivableOrderList = [NSMutableArray array];
    
    if ([receivedJCModel_ReceivableOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReceivableOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReceivableOrderList addObject:[JCModel_ReceivableOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReceivableOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReceivableOrderList addObject:[JCModel_ReceivableOrderList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReceivableOrderList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_ReceivableOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_ReceivableOrderDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_ReceivableOrderDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_ReceivableOrderDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_ReceivableOrderDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderData *copy = [[JCModel_ReceivableOrderData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
