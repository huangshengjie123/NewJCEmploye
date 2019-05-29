//
//  JCModel_OtherIncomeData.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomeData.h"
#import "JCModel_OtherIncomePageProperties.h"
#import "JCModel_OtherIncomeList.h"


NSString *const kJCModel_OtherIncomeDataPageProperties = @"pageProperties";
NSString *const kJCModel_OtherIncomeDataList = @"list";


@interface JCModel_OtherIncomeData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomeData

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
            self.pageProperties = [JCModel_OtherIncomePageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_OtherIncomeDataPageProperties]];
    NSObject *receivedJCModel_OtherIncomeList = [dict objectForKey:kJCModel_OtherIncomeDataList];
    NSMutableArray *parsedJCModel_OtherIncomeList = [NSMutableArray array];
    
    if ([receivedJCModel_OtherIncomeList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_OtherIncomeList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_OtherIncomeList addObject:[JCModel_OtherIncomeList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_OtherIncomeList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_OtherIncomeList addObject:[JCModel_OtherIncomeList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_OtherIncomeList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_OtherIncomeList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_OtherIncomeDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_OtherIncomeDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_OtherIncomeDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_OtherIncomeDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomeData *copy = [[JCModel_OtherIncomeData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
