//
//  JCmodel_StroeHouseItemsData.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsData.h"
#import "JCmodel_StroeHouseItemsPageProperties.h"
#import "JCmodel_StroeHouseItemsList.h"


NSString *const kJCmodel_StroeHouseItemsDataPageProperties = @"pageProperties";
NSString *const kJCmodel_StroeHouseItemsDataList = @"list";


@interface JCmodel_StroeHouseItemsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsData

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
            self.pageProperties = [JCmodel_StroeHouseItemsPageProperties modelObjectWithDictionary:[dict objectForKey:kJCmodel_StroeHouseItemsDataPageProperties]];
    NSObject *receivedJCmodel_StroeHouseItemsList = [dict objectForKey:kJCmodel_StroeHouseItemsDataList];
    NSMutableArray *parsedJCmodel_StroeHouseItemsList = [NSMutableArray array];
    
    if ([receivedJCmodel_StroeHouseItemsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCmodel_StroeHouseItemsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCmodel_StroeHouseItemsList addObject:[JCmodel_StroeHouseItemsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCmodel_StroeHouseItemsList isKindOfClass:[NSDictionary class]]) {
       [parsedJCmodel_StroeHouseItemsList addObject:[JCmodel_StroeHouseItemsList modelObjectWithDictionary:(NSDictionary *)receivedJCmodel_StroeHouseItemsList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCmodel_StroeHouseItemsList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCmodel_StroeHouseItemsDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCmodel_StroeHouseItemsDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCmodel_StroeHouseItemsDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCmodel_StroeHouseItemsDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsData *copy = [[JCmodel_StroeHouseItemsData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
