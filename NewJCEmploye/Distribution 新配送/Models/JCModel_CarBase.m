//
//  JCModel_CarBase.m
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CarBase.h"
#import "JCModel_CarData.h"


NSString *const kJCModel_CarBaseResult = @"result";
NSString *const kJCModel_CarBaseNum = @"num";
NSString *const kJCModel_CarBaseCode = @"code";
NSString *const kJCModel_CarBaseMsg = @"msg";
NSString *const kJCModel_CarBaseData = @"data";


@interface JCModel_CarBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CarBase

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
            self.result = [self objectOrNilForKey:kJCModel_CarBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_CarBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_CarBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_CarBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_CarData = [dict objectForKey:kJCModel_CarBaseData];
    NSMutableArray *parsedJCModel_CarData = [NSMutableArray array];
    
    if ([receivedJCModel_CarData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CarData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CarData addObject:[JCModel_CarData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CarData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CarData addObject:[JCModel_CarData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CarData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_CarData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_CarBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_CarBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_CarBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_CarBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_CarBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_CarBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_CarBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_CarBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_CarBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_CarBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_CarBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_CarBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_CarBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_CarBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_CarBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CarBase *copy = [[JCModel_CarBase alloc] init];
    
    
    
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
