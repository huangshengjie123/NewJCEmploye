//
//  JCModel_InAndOutData.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutData.h"
#import "JCModel_InAndOutPageProperties.h"
#import "JCModel_InAndOutList.h"


NSString *const kJCModel_InAndOutDataPageProperties = @"pageProperties";
NSString *const kJCModel_InAndOutDataList = @"list";


@interface JCModel_InAndOutData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutData

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
            self.pageProperties = [JCModel_InAndOutPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_InAndOutDataPageProperties]];
    NSObject *receivedJCModel_InAndOutList = [dict objectForKey:kJCModel_InAndOutDataList];
    NSMutableArray *parsedJCModel_InAndOutList = [NSMutableArray array];
    
    if ([receivedJCModel_InAndOutList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_InAndOutList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_InAndOutList addObject:[JCModel_InAndOutList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_InAndOutList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_InAndOutList addObject:[JCModel_InAndOutList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_InAndOutList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_InAndOutList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_InAndOutDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_InAndOutDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_InAndOutDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_InAndOutDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_InAndOutDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_InAndOutDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutData *copy = [[JCModel_InAndOutData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
