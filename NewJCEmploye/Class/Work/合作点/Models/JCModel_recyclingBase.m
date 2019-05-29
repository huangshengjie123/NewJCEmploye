//
//  JCModel_recyclingBase.m
//
//  Created by   on 2019/1/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_recyclingBase.h"
#import "JCModel_recyclingData.h"


NSString *const kJCModel_recyclingBaseResult = @"result";
NSString *const kJCModel_recyclingBaseNum = @"num";
NSString *const kJCModel_recyclingBaseCode = @"code";
NSString *const kJCModel_recyclingBaseMsg = @"msg";
NSString *const kJCModel_recyclingBaseData = @"data";


@interface JCModel_recyclingBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_recyclingBase

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
            self.result = [self objectOrNilForKey:kJCModel_recyclingBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_recyclingBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_recyclingBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_recyclingBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_recyclingData = [dict objectForKey:kJCModel_recyclingBaseData];
    NSMutableArray *parsedJCModel_recyclingData = [NSMutableArray array];
    
    if ([receivedJCModel_recyclingData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_recyclingData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_recyclingData addObject:[JCModel_recyclingData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_recyclingData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_recyclingData addObject:[JCModel_recyclingData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_recyclingData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_recyclingData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_recyclingBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_recyclingBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_recyclingBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_recyclingBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_recyclingBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_recyclingBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_recyclingBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_recyclingBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_recyclingBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_recyclingBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_recyclingBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_recyclingBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_recyclingBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_recyclingBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_recyclingBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_recyclingBase *copy = [[JCModel_recyclingBase alloc] init];
    
    
    
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
