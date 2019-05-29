//
//  JCModel_ProabtionCustomData.m
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ProabtionCustomData.h"
#import "JCModel_ProabtionCustomPageProperties.h"
#import "JCModel_ProabtionCustomList.h"


NSString *const kJCModel_ProabtionCustomDataPageProperties = @"pageProperties";
NSString *const kJCModel_ProabtionCustomDataList = @"list";


@interface JCModel_ProabtionCustomData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ProabtionCustomData

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
            self.pageProperties = [JCModel_ProabtionCustomPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_ProabtionCustomDataPageProperties]];
    NSObject *receivedJCModel_ProabtionCustomList = [dict objectForKey:kJCModel_ProabtionCustomDataList];
    NSMutableArray *parsedJCModel_ProabtionCustomList = [NSMutableArray array];
    
    if ([receivedJCModel_ProabtionCustomList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ProabtionCustomList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ProabtionCustomList addObject:[JCModel_ProabtionCustomList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ProabtionCustomList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ProabtionCustomList addObject:[JCModel_ProabtionCustomList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ProabtionCustomList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_ProabtionCustomList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_ProabtionCustomDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_ProabtionCustomDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_ProabtionCustomDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_ProabtionCustomDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ProabtionCustomData *copy = [[JCModel_ProabtionCustomData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
