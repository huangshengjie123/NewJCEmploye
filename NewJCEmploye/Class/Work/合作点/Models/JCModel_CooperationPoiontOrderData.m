//
//  JCModel_CooperationPoiontOrderData.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderData.h"
#import "JCModel_CooperationPoiontOrderPageProperties.h"
#import "JCModel_CooperationPoiontOrderList.h"


NSString *const kJCModel_CooperationPoiontOrderDataPageProperties = @"pageProperties";
NSString *const kJCModel_CooperationPoiontOrderDataList = @"list";


@interface JCModel_CooperationPoiontOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderData

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
            self.pageProperties = [JCModel_CooperationPoiontOrderPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationPoiontOrderDataPageProperties]];
    NSObject *receivedJCModel_CooperationPoiontOrderList = [dict objectForKey:kJCModel_CooperationPoiontOrderDataList];
    NSMutableArray *parsedJCModel_CooperationPoiontOrderList = [NSMutableArray array];
    
    if ([receivedJCModel_CooperationPoiontOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CooperationPoiontOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CooperationPoiontOrderList addObject:[JCModel_CooperationPoiontOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CooperationPoiontOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CooperationPoiontOrderList addObject:[JCModel_CooperationPoiontOrderList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CooperationPoiontOrderList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_CooperationPoiontOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_CooperationPoiontOrderDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_CooperationPoiontOrderDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_CooperationPoiontOrderDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_CooperationPoiontOrderDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderData *copy = [[JCModel_CooperationPoiontOrderData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
