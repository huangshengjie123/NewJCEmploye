//
//  JCModel_EmpSupportOrderData.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderData.h"
#import "JCModel_EmpSupportOrderPageProperties.h"
#import "JCModel_EmpSupportOrderList.h"


NSString *const kJCModel_EmpSupportOrderDataPageProperties = @"pageProperties";
NSString *const kJCModel_EmpSupportOrderDataList = @"list";


@interface JCModel_EmpSupportOrderData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderData

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
            self.pageProperties = [JCModel_EmpSupportOrderPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderDataPageProperties]];
    NSObject *receivedJCModel_EmpSupportOrderList = [dict objectForKey:kJCModel_EmpSupportOrderDataList];
    NSMutableArray *parsedJCModel_EmpSupportOrderList = [NSMutableArray array];
    
    if ([receivedJCModel_EmpSupportOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_EmpSupportOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_EmpSupportOrderList addObject:[JCModel_EmpSupportOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_EmpSupportOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_EmpSupportOrderList addObject:[JCModel_EmpSupportOrderList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_EmpSupportOrderList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_EmpSupportOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_EmpSupportOrderDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_EmpSupportOrderDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_EmpSupportOrderDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderData *copy = [[JCModel_EmpSupportOrderData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
