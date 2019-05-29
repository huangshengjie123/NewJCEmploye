//
//  JCModel_DistributionData.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionData.h"
#import "JCModel_DistributionPageProperties.h"
#import "JCModel_DistributionList.h"


NSString *const kJCModel_DistributionDataPageProperties = @"pageProperties";
NSString *const kJCModel_DistributionDataList = @"list";


@interface JCModel_DistributionData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionData

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
            self.pageProperties = [JCModel_DistributionPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_DistributionDataPageProperties]];
    NSObject *receivedJCModel_DistributionList = [dict objectForKey:kJCModel_DistributionDataList];
    NSMutableArray *parsedJCModel_DistributionList = [NSMutableArray array];
    
    if ([receivedJCModel_DistributionList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DistributionList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DistributionList addObject:[JCModel_DistributionList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DistributionList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DistributionList addObject:[JCModel_DistributionList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DistributionList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_DistributionList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_DistributionDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_DistributionDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_DistributionDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_DistributionDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_DistributionDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_DistributionDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionData *copy = [[JCModel_DistributionData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
