//
//  JCModel_MyFranchiserGrantOrdersData.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersData.h"
#import "JCModel_MyFranchiserGrantOrdersPageProperties.h"
#import "JCModel_MyFranchiserGrantOrdersList.h"


NSString *const kJCModel_MyFranchiserGrantOrdersDataPageProperties = @"pageProperties";
NSString *const kJCModel_MyFranchiserGrantOrdersDataList = @"list";


@interface JCModel_MyFranchiserGrantOrdersData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersData

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
            self.pageProperties = [JCModel_MyFranchiserGrantOrdersPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersDataPageProperties]];
    NSObject *receivedJCModel_MyFranchiserGrantOrdersList = [dict objectForKey:kJCModel_MyFranchiserGrantOrdersDataList];
    NSMutableArray *parsedJCModel_MyFranchiserGrantOrdersList = [NSMutableArray array];
    
    if ([receivedJCModel_MyFranchiserGrantOrdersList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyFranchiserGrantOrdersList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyFranchiserGrantOrdersList addObject:[JCModel_MyFranchiserGrantOrdersList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyFranchiserGrantOrdersList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyFranchiserGrantOrdersList addObject:[JCModel_MyFranchiserGrantOrdersList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyFranchiserGrantOrdersList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_MyFranchiserGrantOrdersList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_MyFranchiserGrantOrdersDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_MyFranchiserGrantOrdersDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_MyFranchiserGrantOrdersDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersData *copy = [[JCModel_MyFranchiserGrantOrdersData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
