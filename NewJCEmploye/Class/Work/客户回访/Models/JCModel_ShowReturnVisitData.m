//
//  JCModel_ShowReturnVisitData.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitData.h"
#import "JCModel_ShowReturnVisitPageProperties.h"
#import "JCModel_ShowReturnVisitList.h"


NSString *const kJCModel_ShowReturnVisitDataPageProperties = @"pageProperties";
NSString *const kJCModel_ShowReturnVisitDataList = @"list";


@interface JCModel_ShowReturnVisitData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitData

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
            self.pageProperties = [JCModel_ShowReturnVisitPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_ShowReturnVisitDataPageProperties]];
    NSObject *receivedJCModel_ShowReturnVisitList = [dict objectForKey:kJCModel_ShowReturnVisitDataList];
    NSMutableArray *parsedJCModel_ShowReturnVisitList = [NSMutableArray array];
    
    if ([receivedJCModel_ShowReturnVisitList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ShowReturnVisitList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ShowReturnVisitList addObject:[JCModel_ShowReturnVisitList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ShowReturnVisitList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ShowReturnVisitList addObject:[JCModel_ShowReturnVisitList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ShowReturnVisitList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_ShowReturnVisitList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_ShowReturnVisitDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_ShowReturnVisitDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_ShowReturnVisitDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_ShowReturnVisitDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitData *copy = [[JCModel_ShowReturnVisitData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
