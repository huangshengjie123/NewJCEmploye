//
//  JCModel_BacklogBase.m
//
//  Created by   on 2018/12/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BacklogBase.h"
#import "JCModel_BacklogData.h"


NSString *const kJCModel_BacklogBaseResult = @"result";
NSString *const kJCModel_BacklogBaseNum = @"num";
NSString *const kJCModel_BacklogBaseCode = @"code";
NSString *const kJCModel_BacklogBaseMsg = @"msg";
NSString *const kJCModel_BacklogBaseData = @"data";


@interface JCModel_BacklogBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BacklogBase

@synthesize result = _result;
@synthesize num = _num;
@synthesize code = _code;
@synthesize msg = _msg;
@synthesize data = _data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.result = [self objectOrNilForKey:kJCModel_BacklogBaseResult fromDictionary:dict];
        self.num = [self objectOrNilForKey:kJCModel_BacklogBaseNum fromDictionary:dict];
        self.code = [self objectOrNilForKey:kJCModel_BacklogBaseCode fromDictionary:dict];
        self.msg = [self objectOrNilForKey:kJCModel_BacklogBaseMsg fromDictionary:dict];
        NSObject *receivedJCModel_BacklogData = [dict objectForKey:kJCModel_BacklogBaseData];
        NSMutableArray *parsedJCModel_BacklogData = [NSMutableArray array];
        
        if ([receivedJCModel_BacklogData isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedJCModel_BacklogData)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedJCModel_BacklogData addObject:[JCModel_BacklogData modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedJCModel_BacklogData isKindOfClass:[NSDictionary class]])
        {
            [parsedJCModel_BacklogData addObject:[JCModel_BacklogData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_BacklogData]];
        }
        
        self.data = [NSArray arrayWithArray:parsedJCModel_BacklogData];
    
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_BacklogBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_BacklogBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_BacklogBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_BacklogBaseMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data)
    {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)])
        {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else
        {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_BacklogBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_BacklogBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_BacklogBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_BacklogBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_BacklogBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_BacklogBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_BacklogBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_BacklogBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_BacklogBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_BacklogBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_BacklogBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_BacklogBase *copy = [[JCModel_BacklogBase alloc] init];
    if (copy)
    {
        copy.result = [self.result copyWithZone:zone];
        copy.num = (id)[self.num copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = (id)[self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
