//
//  JCModel_NewDostribution1Data.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1Data.h"
#import "JCModel_NewDostribution1PageProperties.h"
#import "JCModel_NewDostribution1List.h"


NSString *const kJCModel_NewDostribution1DataPageProperties = @"pageProperties";
NSString *const kJCModel_NewDostribution1DataList = @"list";


@interface JCModel_NewDostribution1Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1Data

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
            self.pageProperties = [JCModel_NewDostribution1PageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDostribution1DataPageProperties]];
    NSObject *receivedJCModel_NewDostribution1List = [dict objectForKey:kJCModel_NewDostribution1DataList];
    NSMutableArray *parsedJCModel_NewDostribution1List = [NSMutableArray array];
    
    if ([receivedJCModel_NewDostribution1List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDostribution1List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDostribution1List addObject:[JCModel_NewDostribution1List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDostribution1List isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDostribution1List addObject:[JCModel_NewDostribution1List modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDostribution1List]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_NewDostribution1List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_NewDostribution1DataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_NewDostribution1DataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1DataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1DataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_NewDostribution1DataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_NewDostribution1DataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1Data *copy = [[JCModel_NewDostribution1Data alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
