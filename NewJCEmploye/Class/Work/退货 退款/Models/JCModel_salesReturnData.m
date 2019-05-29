//
//  JCModel_salesReturnData.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnData.h"
#import "JCModel_salesReturnPageProperties.h"
#import "JCModel_salesReturnList.h"


NSString *const kJCModel_salesReturnDataPageProperties = @"pageProperties";
NSString *const kJCModel_salesReturnDataList = @"list";


@interface JCModel_salesReturnData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnData

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
            self.pageProperties = [JCModel_salesReturnPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_salesReturnDataPageProperties]];
    NSObject *receivedJCModel_salesReturnList = [dict objectForKey:kJCModel_salesReturnDataList];
    NSMutableArray *parsedJCModel_salesReturnList = [NSMutableArray array];
    
    if ([receivedJCModel_salesReturnList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_salesReturnList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_salesReturnList addObject:[JCModel_salesReturnList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_salesReturnList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_salesReturnList addObject:[JCModel_salesReturnList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_salesReturnList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_salesReturnList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_salesReturnDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_salesReturnDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_salesReturnDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_salesReturnDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_salesReturnDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_salesReturnDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnData *copy = [[JCModel_salesReturnData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
