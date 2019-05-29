//
//  JCModel_NewProabtionCustomData.m
//
//  Created by   on 2019/2/15
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProabtionCustomData.h"
#import "JCModel_NewProabtionCustomPageProperties.h"
#import "JCModel_NewProabtionCustomList.h"


NSString *const kJCModel_NewProabtionCustomDataPageProperties = @"pageProperties";
NSString *const kJCModel_NewProabtionCustomDataList = @"list";


@interface JCModel_NewProabtionCustomData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProabtionCustomData

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
            self.pageProperties = [JCModel_NewProabtionCustomPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_NewProabtionCustomDataPageProperties]];
    NSObject *receivedJCModel_NewProabtionCustomList = [dict objectForKey:kJCModel_NewProabtionCustomDataList];
    NSMutableArray *parsedJCModel_NewProabtionCustomList = [NSMutableArray array];
    
    if ([receivedJCModel_NewProabtionCustomList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewProabtionCustomList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewProabtionCustomList addObject:[JCModel_NewProabtionCustomList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewProabtionCustomList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewProabtionCustomList addObject:[JCModel_NewProabtionCustomList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewProabtionCustomList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_NewProabtionCustomList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_NewProabtionCustomDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_NewProabtionCustomDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_NewProabtionCustomDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_NewProabtionCustomDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProabtionCustomData *copy = [[JCModel_NewProabtionCustomData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
