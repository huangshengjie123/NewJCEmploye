//
//  JCModel_message2Data.m
//
//  Created by   on 2019/3/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_message2Data.h"
#import "JCModel_message2List.h"


NSString *const kJCModel_message2DataPageProperties = @"pageProperties";
NSString *const kJCModel_message2DataList = @"list";


@interface JCModel_message2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_message2Data

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
            self.pageProperties = [self objectOrNilForKey:kJCModel_message2DataPageProperties fromDictionary:dict];
    NSObject *receivedJCModel_message2List = [dict objectForKey:kJCModel_message2DataList];
    NSMutableArray *parsedJCModel_message2List = [NSMutableArray array];
    
    if ([receivedJCModel_message2List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_message2List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_message2List addObject:[JCModel_message2List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_message2List isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_message2List addObject:[JCModel_message2List modelObjectWithDictionary:(NSDictionary *)receivedJCModel_message2List]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_message2List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageProperties forKey:kJCModel_message2DataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_message2DataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_message2DataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_message2DataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_message2DataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_message2DataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_message2Data *copy = [[JCModel_message2Data alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
