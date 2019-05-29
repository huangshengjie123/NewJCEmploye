//
//  JCModel_BulletinData.m
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BulletinData.h"
#import "JCModel_BulletinPageProperties.h"
#import "JCModel_BulletinList.h"


NSString *const kJCModel_BulletinDataPageProperties = @"pageProperties";
NSString *const kJCModel_BulletinDataList = @"list";


@interface JCModel_BulletinData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BulletinData

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
            self.pageProperties = [JCModel_BulletinPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_BulletinDataPageProperties]];
    NSObject *receivedJCModel_BulletinList = [dict objectForKey:kJCModel_BulletinDataList];
    NSMutableArray *parsedJCModel_BulletinList = [NSMutableArray array];
    
    if ([receivedJCModel_BulletinList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_BulletinList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_BulletinList addObject:[JCModel_BulletinList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_BulletinList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_BulletinList addObject:[JCModel_BulletinList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_BulletinList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_BulletinList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_BulletinDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_BulletinDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_BulletinDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_BulletinDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_BulletinDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_BulletinDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BulletinData *copy = [[JCModel_BulletinData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
