//
//  JCModel_newMessageData.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newMessageData.h"
#import "JCModel_newMessagePageProperties.h"
#import "JCModel_newMessageList.h"


NSString *const kJCModel_newMessageDataPageProperties = @"pageProperties";
NSString *const kJCModel_newMessageDataList = @"list";


@interface JCModel_newMessageData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newMessageData

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
            self.pageProperties = [JCModel_newMessagePageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_newMessageDataPageProperties]];
    NSObject *receivedJCModel_newMessageList = [dict objectForKey:kJCModel_newMessageDataList];
    NSMutableArray *parsedJCModel_newMessageList = [NSMutableArray array];
    
    if ([receivedJCModel_newMessageList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_newMessageList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_newMessageList addObject:[JCModel_newMessageList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_newMessageList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_newMessageList addObject:[JCModel_newMessageList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_newMessageList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_newMessageList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_newMessageDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_newMessageDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_newMessageDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_newMessageDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_newMessageDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_newMessageDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newMessageData *copy = [[JCModel_newMessageData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
