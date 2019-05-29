//
//  JCModel_WorkGroupData.m
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkGroupData.h"
#import "JCModel_WorkGroupList.h"


NSString *const kJCModel_WorkGroupDataPageProperties = @"pageProperties";
NSString *const kJCModel_WorkGroupDataList = @"list";


@interface JCModel_WorkGroupData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkGroupData

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
            self.pageProperties = [self objectOrNilForKey:kJCModel_WorkGroupDataPageProperties fromDictionary:dict];
    NSObject *receivedJCModel_WorkGroupList = [dict objectForKey:kJCModel_WorkGroupDataList];
    NSMutableArray *parsedJCModel_WorkGroupList = [NSMutableArray array];
    
    if ([receivedJCModel_WorkGroupList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WorkGroupList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WorkGroupList addObject:[JCModel_WorkGroupList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WorkGroupList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WorkGroupList addObject:[JCModel_WorkGroupList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WorkGroupList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_WorkGroupList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageProperties forKey:kJCModel_WorkGroupDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_WorkGroupDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_WorkGroupDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_WorkGroupDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_WorkGroupDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_WorkGroupDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkGroupData *copy = [[JCModel_WorkGroupData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
