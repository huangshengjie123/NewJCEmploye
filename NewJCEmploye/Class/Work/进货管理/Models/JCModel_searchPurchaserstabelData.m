//
//  JCModel_searchPurchaserstabelData.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelData.h"
#import "JCModel_searchPurchaserstabelPageProperties.h"
#import "JCModel_searchPurchaserstabelList.h"


NSString *const kJCModel_searchPurchaserstabelDataPageProperties = @"pageProperties";
NSString *const kJCModel_searchPurchaserstabelDataList = @"list";


@interface JCModel_searchPurchaserstabelData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelData

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
            self.pageProperties = [JCModel_searchPurchaserstabelPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_searchPurchaserstabelDataPageProperties]];
    NSObject *receivedJCModel_searchPurchaserstabelList = [dict objectForKey:kJCModel_searchPurchaserstabelDataList];
    NSMutableArray *parsedJCModel_searchPurchaserstabelList = [NSMutableArray array];
    
    if ([receivedJCModel_searchPurchaserstabelList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_searchPurchaserstabelList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_searchPurchaserstabelList addObject:[JCModel_searchPurchaserstabelList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_searchPurchaserstabelList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_searchPurchaserstabelList addObject:[JCModel_searchPurchaserstabelList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_searchPurchaserstabelList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_searchPurchaserstabelList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_searchPurchaserstabelDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_searchPurchaserstabelDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_searchPurchaserstabelDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_searchPurchaserstabelDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelData *copy = [[JCModel_searchPurchaserstabelData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
