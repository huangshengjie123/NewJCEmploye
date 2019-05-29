//
//  JCModel_probationOrderData.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderData.h"
#import "JCModel_probationOrderPageProperties.h"
#import "JCModel_probationOrderList.h"


NSString *const kJCModel_probationOrderDataPageProperties = @"pageProperties";
NSString *const kJCModel_probationOrderDataList = @"list";


@interface JCModel_probationOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderData

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
            self.pageProperties = [JCModel_probationOrderPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_probationOrderDataPageProperties]];
    NSObject *receivedJCModel_probationOrderList = [dict objectForKey:kJCModel_probationOrderDataList];
    NSMutableArray *parsedJCModel_probationOrderList = [NSMutableArray array];
    
    if ([receivedJCModel_probationOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_probationOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_probationOrderList addObject:[JCModel_probationOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_probationOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_probationOrderList addObject:[JCModel_probationOrderList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_probationOrderList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_probationOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_probationOrderDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_probationOrderDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_probationOrderDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_probationOrderDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_probationOrderDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_probationOrderDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderData *copy = [[JCModel_probationOrderData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
