//
//  JCModel_getStoreHouseFacData.m
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseFacData.h"
#import "JCModel_getStoreHouseFacPageProperties.h"
#import "JCModel_getStoreHouseFacList.h"


NSString *const kJCModel_getStoreHouseFacDataPageProperties = @"pageProperties";
NSString *const kJCModel_getStoreHouseFacDataList = @"list";


@interface JCModel_getStoreHouseFacData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseFacData

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
            self.pageProperties = [JCModel_getStoreHouseFacPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_getStoreHouseFacDataPageProperties]];
    NSObject *receivedJCModel_getStoreHouseFacList = [dict objectForKey:kJCModel_getStoreHouseFacDataList];
    NSMutableArray *parsedJCModel_getStoreHouseFacList = [NSMutableArray array];
    
    if ([receivedJCModel_getStoreHouseFacList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_getStoreHouseFacList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_getStoreHouseFacList addObject:[JCModel_getStoreHouseFacList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_getStoreHouseFacList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_getStoreHouseFacList addObject:[JCModel_getStoreHouseFacList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_getStoreHouseFacList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_getStoreHouseFacList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_getStoreHouseFacDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_getStoreHouseFacDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_getStoreHouseFacDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_getStoreHouseFacDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_getStoreHouseFacDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseFacData *copy = [[JCModel_getStoreHouseFacData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
