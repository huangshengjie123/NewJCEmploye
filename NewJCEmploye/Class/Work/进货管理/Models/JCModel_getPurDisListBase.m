//
//  JCModel_getPurDisListBase.m
//
//  Created by   on 2018/9/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getPurDisListBase.h"
#import "JCModel_getPurDisListData.h"


NSString *const kJCModel_getPurDisListBaseResult = @"result";
NSString *const kJCModel_getPurDisListBaseNum = @"num";
NSString *const kJCModel_getPurDisListBaseCode = @"code";
NSString *const kJCModel_getPurDisListBaseMsg = @"msg";
NSString *const kJCModel_getPurDisListBaseData = @"data";


@interface JCModel_getPurDisListBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getPurDisListBase

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
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.result = [self objectOrNilForKey:kJCModel_getPurDisListBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_getPurDisListBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_getPurDisListBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_getPurDisListBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_getPurDisListData = [dict objectForKey:kJCModel_getPurDisListBaseData];
    NSMutableArray *parsedJCModel_getPurDisListData = [NSMutableArray array];
    
    if ([receivedJCModel_getPurDisListData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_getPurDisListData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_getPurDisListData addObject:[JCModel_getPurDisListData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_getPurDisListData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_getPurDisListData addObject:[JCModel_getPurDisListData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_getPurDisListData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_getPurDisListData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_getPurDisListBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_getPurDisListBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_getPurDisListBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_getPurDisListBaseMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_getPurDisListBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_getPurDisListBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_getPurDisListBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_getPurDisListBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_getPurDisListBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_getPurDisListBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_getPurDisListBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_getPurDisListBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_getPurDisListBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_getPurDisListBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_getPurDisListBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getPurDisListBase *copy = [[JCModel_getPurDisListBase alloc] init];
    
    
    
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
