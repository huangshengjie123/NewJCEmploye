//
//  JCmodel_newCustomer2Data.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2Data.h"
#import "JCmodel_newCustomer2PageProperties.h"
#import "JCmodel_newCustomer2List.h"


NSString *const kJCmodel_newCustomer2DataPageProperties = @"pageProperties";
NSString *const kJCmodel_newCustomer2DataList = @"list";


@interface JCmodel_newCustomer2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2Data

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
            self.pageProperties = [JCmodel_newCustomer2PageProperties modelObjectWithDictionary:[dict objectForKey:kJCmodel_newCustomer2DataPageProperties]];
    NSObject *receivedJCmodel_newCustomer2List = [dict objectForKey:kJCmodel_newCustomer2DataList];
    NSMutableArray *parsedJCmodel_newCustomer2List = [NSMutableArray array];
    
    if ([receivedJCmodel_newCustomer2List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCmodel_newCustomer2List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCmodel_newCustomer2List addObject:[JCmodel_newCustomer2List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCmodel_newCustomer2List isKindOfClass:[NSDictionary class]]) {
       [parsedJCmodel_newCustomer2List addObject:[JCmodel_newCustomer2List modelObjectWithDictionary:(NSDictionary *)receivedJCmodel_newCustomer2List]];
    }

    self.list = [NSArray arrayWithArray:parsedJCmodel_newCustomer2List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCmodel_newCustomer2DataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCmodel_newCustomer2DataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2DataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2DataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCmodel_newCustomer2DataPageProperties];
    [aCoder encodeObject:_list forKey:kJCmodel_newCustomer2DataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2Data *copy = [[JCmodel_newCustomer2Data alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
