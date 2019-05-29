//
//  JCModel_ReadWarningData.m
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWarningData.h"
#import "JCModel_ReadWarningPageProperties.h"
#import "JCModel_ReadWarningList.h"


NSString *const kJCModel_ReadWarningDataPageProperties = @"pageProperties";
NSString *const kJCModel_ReadWarningDataList = @"list";


@interface JCModel_ReadWarningData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWarningData

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
            self.pageProperties = [JCModel_ReadWarningPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_ReadWarningDataPageProperties]];
    NSObject *receivedJCModel_ReadWarningList = [dict objectForKey:kJCModel_ReadWarningDataList];
    NSMutableArray *parsedJCModel_ReadWarningList = [NSMutableArray array];
    
    if ([receivedJCModel_ReadWarningList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReadWarningList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReadWarningList addObject:[JCModel_ReadWarningList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReadWarningList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReadWarningList addObject:[JCModel_ReadWarningList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReadWarningList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_ReadWarningList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_ReadWarningDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_ReadWarningDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_ReadWarningDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_ReadWarningDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_ReadWarningDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_ReadWarningDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWarningData *copy = [[JCModel_ReadWarningData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
