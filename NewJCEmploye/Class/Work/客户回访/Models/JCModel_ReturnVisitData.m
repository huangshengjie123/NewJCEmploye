//
//  JCModel_ReturnVisitData.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitData.h"
#import "JCModel_ReturnVisitPageProperties.h"
#import "JCModel_ReturnVisitList.h"


NSString *const kJCModel_ReturnVisitDataPageProperties = @"pageProperties";
NSString *const kJCModel_ReturnVisitDataList = @"list";


@interface JCModel_ReturnVisitData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitData

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
            self.pageProperties = [JCModel_ReturnVisitPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_ReturnVisitDataPageProperties]];
    NSObject *receivedJCModel_ReturnVisitList = [dict objectForKey:kJCModel_ReturnVisitDataList];
    NSMutableArray *parsedJCModel_ReturnVisitList = [NSMutableArray array];
    
    if ([receivedJCModel_ReturnVisitList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReturnVisitList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReturnVisitList addObject:[JCModel_ReturnVisitList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReturnVisitList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReturnVisitList addObject:[JCModel_ReturnVisitList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReturnVisitList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_ReturnVisitList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_ReturnVisitDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_ReturnVisitDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_ReturnVisitDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_ReturnVisitDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitData *copy = [[JCModel_ReturnVisitData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
