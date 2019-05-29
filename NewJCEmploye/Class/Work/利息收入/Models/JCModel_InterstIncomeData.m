//
//  JCModel_InterstIncomeData.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeData.h"
#import "JCModel_InterstIncomePageProperties.h"
#import "JCModel_InterstIncomeList.h"


NSString *const kJCModel_InterstIncomeDataPageProperties = @"pageProperties";
NSString *const kJCModel_InterstIncomeDataList = @"list";


@interface JCModel_InterstIncomeData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeData

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
            self.pageProperties = [JCModel_InterstIncomePageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeDataPageProperties]];
    NSObject *receivedJCModel_InterstIncomeList = [dict objectForKey:kJCModel_InterstIncomeDataList];
    NSMutableArray *parsedJCModel_InterstIncomeList = [NSMutableArray array];
    
    if ([receivedJCModel_InterstIncomeList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_InterstIncomeList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_InterstIncomeList addObject:[JCModel_InterstIncomeList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_InterstIncomeList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_InterstIncomeList addObject:[JCModel_InterstIncomeList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_InterstIncomeList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_InterstIncomeList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_InterstIncomeDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_InterstIncomeDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_InterstIncomeDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_InterstIncomeDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeData *copy = [[JCModel_InterstIncomeData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
