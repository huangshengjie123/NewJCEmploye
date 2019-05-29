//
//  JCModel_searchDetailsOutputFData.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFData.h"
#import "JCModel_searchDetailsOutputFPageProperties.h"
#import "JCModel_searchDetailsOutputFList.h"


NSString *const kJCModel_searchDetailsOutputFDataPageProperties = @"pageProperties";
NSString *const kJCModel_searchDetailsOutputFDataList = @"list";


@interface JCModel_searchDetailsOutputFData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFData

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
            self.pageProperties = [JCModel_searchDetailsOutputFPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_searchDetailsOutputFDataPageProperties]];
    NSObject *receivedJCModel_searchDetailsOutputFList = [dict objectForKey:kJCModel_searchDetailsOutputFDataList];
    NSMutableArray *parsedJCModel_searchDetailsOutputFList = [NSMutableArray array];
    
    if ([receivedJCModel_searchDetailsOutputFList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_searchDetailsOutputFList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_searchDetailsOutputFList addObject:[JCModel_searchDetailsOutputFList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_searchDetailsOutputFList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_searchDetailsOutputFList addObject:[JCModel_searchDetailsOutputFList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_searchDetailsOutputFList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_searchDetailsOutputFList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_searchDetailsOutputFDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_searchDetailsOutputFDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_searchDetailsOutputFDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_searchDetailsOutputFDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFData *copy = [[JCModel_searchDetailsOutputFData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
