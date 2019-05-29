//
//  JCModel_refundData3Data.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3Data.h"
#import "JCModel_refundData3PageProperties.h"
#import "JCModel_refundData3List.h"


NSString *const kJCModel_refundData3DataPageProperties = @"pageProperties";
NSString *const kJCModel_refundData3DataList = @"list";


@interface JCModel_refundData3Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3Data

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
            self.pageProperties = [JCModel_refundData3PageProperties modelObjectWithDictionary:[dict objectForKey:kJCModel_refundData3DataPageProperties]];
    NSObject *receivedJCModel_refundData3List = [dict objectForKey:kJCModel_refundData3DataList];
    NSMutableArray *parsedJCModel_refundData3List = [NSMutableArray array];
    
    if ([receivedJCModel_refundData3List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_refundData3List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_refundData3List addObject:[JCModel_refundData3List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_refundData3List isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_refundData3List addObject:[JCModel_refundData3List modelObjectWithDictionary:(NSDictionary *)receivedJCModel_refundData3List]];
    }

    self.list = [NSArray arrayWithArray:parsedJCModel_refundData3List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageProperties dictionaryRepresentation] forKey:kJCModel_refundData3DataPageProperties];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kJCModel_refundData3DataList];

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

    self.pageProperties = [aDecoder decodeObjectForKey:kJCModel_refundData3DataPageProperties];
    self.list = [aDecoder decodeObjectForKey:kJCModel_refundData3DataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageProperties forKey:kJCModel_refundData3DataPageProperties];
    [aCoder encodeObject:_list forKey:kJCModel_refundData3DataList];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3Data *copy = [[JCModel_refundData3Data alloc] init];
    
    
    
    if (copy) {

        copy.pageProperties = [self.pageProperties copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
