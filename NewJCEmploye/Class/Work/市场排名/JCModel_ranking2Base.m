//
//  JCModel_ranking2Base.m
//
//  Created by   on 2019/3/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ranking2Base.h"
#import "JCModel_ranking2Data.h"


NSString *const kJCModel_ranking2BaseResult = @"result";
NSString *const kJCModel_ranking2BaseNum = @"num";
NSString *const kJCModel_ranking2BaseCode = @"code";
NSString *const kJCModel_ranking2BaseMsg = @"msg";
NSString *const kJCModel_ranking2BaseData = @"data";


@interface JCModel_ranking2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ranking2Base

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
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
            self.result = [self objectOrNilForKey:kJCModel_ranking2BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ranking2BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ranking2BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ranking2BaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_ranking2Data = [dict objectForKey:kJCModel_ranking2BaseData];
    NSMutableArray *parsedJCModel_ranking2Data = [NSMutableArray array];
    
    if ([receivedJCModel_ranking2Data isKindOfClass:[NSArray class]])
    {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ranking2Data)
        {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ranking2Data addObject:[JCModel_ranking2Data modelObjectWithDictionary:item]];
            }
       }
    }
    else if ([receivedJCModel_ranking2Data isKindOfClass:[NSDictionary class]])
    {
       [parsedJCModel_ranking2Data addObject:[JCModel_ranking2Data modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ranking2Data]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_ranking2Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ranking2BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ranking2BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ranking2BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ranking2BaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_ranking2BaseData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ranking2BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ranking2BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ranking2BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ranking2BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ranking2BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ranking2BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ranking2BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ranking2BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ranking2BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ranking2BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ranking2Base *copy = [[JCModel_ranking2Base alloc] init];
    
    
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
