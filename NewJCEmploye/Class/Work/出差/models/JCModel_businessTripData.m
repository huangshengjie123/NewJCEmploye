//
//  JCModel_businessTripData.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripData.h"
#import "JCModel_businessTripPageProperties.h"
#import "JCModel_businessTripList.h"


NSString *const kJCModel_businessTripDataPageProperties = @"pageProperties";
NSString *const kJCModel_businessTripDataList = @"list";


@interface JCModel_businessTripData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripData

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
            self.pageProperties = [JCModel_businessTripPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_businessTripDataPageProperties]];
    NSObject *receivedJCModel_businessTripList = [dict objectForKey:kJCModel_businessTripDataList];
    NSMutableArray *parsedJCModel_businessTripList = [NSMutableArray array];
    
    if ([receivedJCModel_businessTripList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_businessTripList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_businessTripList addObject:[JCModel_businessTripList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_businessTripList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_businessTripList addObject:[JCModel_businessTripList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_businessTripList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_businessTripList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_businessTripDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_businessTripDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_businessTripDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_businessTripDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_businessTripDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_businessTripDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_businessTripData *copy = [[JCModel_businessTripData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
