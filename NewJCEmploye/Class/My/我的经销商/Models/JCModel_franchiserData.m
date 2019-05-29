//
//  JCModel_franchiserData.m
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserData.h"
#import "JCModel_franchiserPageProperties.h"
#import "JCModel_franchiserList.h"


NSString *const kJCModel_franchiserDataPageProperties = @"pageProperties";
NSString *const kJCModel_franchiserDataList = @"list";


@interface JCModel_franchiserData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserData

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
            self.pageProperties = [JCModel_franchiserPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_franchiserDataPageProperties]];
    NSObject *receivedJCModel_franchiserList = [dict objectForKey:kJCModel_franchiserDataList];
    NSMutableArray *parsedJCModel_franchiserList = [NSMutableArray array];
    
    if ([receivedJCModel_franchiserList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_franchiserList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_franchiserList addObject:[JCModel_franchiserList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_franchiserList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_franchiserList addObject:[JCModel_franchiserList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_franchiserList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_franchiserList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_franchiserDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_franchiserDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_franchiserDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_franchiserDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_franchiserDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_franchiserDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserData *copy = [[JCModel_franchiserData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
