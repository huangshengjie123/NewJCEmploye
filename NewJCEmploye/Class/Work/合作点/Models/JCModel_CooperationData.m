//
//  JCModel_CooperationData.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationData.h"
#import "JCModel_CooperationPageProperties.h"
#import "JCModel_CooperationList.h"


NSString *const kJCModel_CooperationDataPageProperties = @"pageProperties";
NSString *const kJCModel_CooperationDataList = @"list";


@interface JCModel_CooperationData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationData

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
            self.pageProperties = [JCModel_CooperationPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationDataPageProperties]];
    NSObject *receivedJCModel_CooperationList = [dict objectForKey:kJCModel_CooperationDataList];
    NSMutableArray *parsedJCModel_CooperationList = [NSMutableArray array];
    
    if ([receivedJCModel_CooperationList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CooperationList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CooperationList addObject:[JCModel_CooperationList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CooperationList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CooperationList addObject:[JCModel_CooperationList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CooperationList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_CooperationList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_CooperationDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_CooperationDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_CooperationDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_CooperationDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_CooperationDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_CooperationDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationData *copy = [[JCModel_CooperationData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
