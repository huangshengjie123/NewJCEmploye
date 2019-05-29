//
//  JCModel_PurchasersData.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PurchasersData.h"
#import "JCModel_PurchasersPageProperties.h"
#import "JCModel_PurchasersList.h"


NSString *const kJCModel_PurchasersDataPageProperties = @"pageProperties";
NSString *const kJCModel_PurchasersDataList = @"list";


@interface JCModel_PurchasersData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PurchasersData

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
            self.pageProperties = [JCModel_PurchasersPageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_PurchasersDataPageProperties]];
    NSObject *receivedJCModel_PurchasersList = [dict objectForKey:kJCModel_PurchasersDataList];
    NSMutableArray *parsedJCModel_PurchasersList = [NSMutableArray array];
    
    if ([receivedJCModel_PurchasersList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_PurchasersList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_PurchasersList addObject:[JCModel_PurchasersList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_PurchasersList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_PurchasersList addObject:[JCModel_PurchasersList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_PurchasersList]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_PurchasersList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_PurchasersDataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_PurchasersDataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_PurchasersDataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_PurchasersDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_PurchasersDataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_PurchasersDataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PurchasersData *copy = [[JCModel_PurchasersData alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
