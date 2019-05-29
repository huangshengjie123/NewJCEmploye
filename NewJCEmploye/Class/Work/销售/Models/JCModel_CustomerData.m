//
//  JCModel_CustomerData.m
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CustomerData.h"
#import "JCModel_CustomerPageProperties.h"
#import "JCModel_CustomerList.h"


NSString *const kJCModel_CustomerDataPageProperties = @"pageProperties";
NSString *const kJCModel_CustomerDataList = @"list";


@interface JCModel_CustomerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CustomerData

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
            self.pageProperties = [JCModel_CustomerPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_CustomerDataPageProperties]];
    NSObject *receivedJCModel_CustomerList = [dict objectForKey:kJCModel_CustomerDataList];
    NSMutableArray *parsedJCModel_CustomerList = [NSMutableArray array];
    
    if ([receivedJCModel_CustomerList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CustomerList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CustomerList addObject:[JCModel_CustomerList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CustomerList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CustomerList addObject:[JCModel_CustomerList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CustomerList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_CustomerList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_CustomerDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_CustomerDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_CustomerDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_CustomerDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_CustomerDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_CustomerDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CustomerData *copy = [[JCModel_CustomerData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
