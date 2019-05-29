//
//  JCModel_WorkLogData.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogData.h"
#import "JCModel_WorkLogPageProperties.h"
#import "JCModel_WorkLogList.h"


NSString *const kJCModel_WorkLogDataPageProperties = @"pageProperties";
NSString *const kJCModel_WorkLogDataList = @"list";


@interface JCModel_WorkLogData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogData

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
            self.pageProperties = [JCModel_WorkLogPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_WorkLogDataPageProperties]];
    NSObject *receivedJCModel_WorkLogList = [dict objectForKey:kJCModel_WorkLogDataList];
    NSMutableArray *parsedJCModel_WorkLogList = [NSMutableArray array];
    
    if ([receivedJCModel_WorkLogList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WorkLogList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WorkLogList addObject:[JCModel_WorkLogList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WorkLogList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WorkLogList addObject:[JCModel_WorkLogList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WorkLogList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_WorkLogList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_WorkLogDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_WorkLogDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_WorkLogDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_WorkLogDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_WorkLogDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_WorkLogDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogData *copy = [[JCModel_WorkLogData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
