//
//  JCModel_GetCustmerBase.m
//
//  Created by   on 2019/2/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetCustmerBase.h"
#import "JCModel_GetCustmerData.h"


NSString *const kJCModel_GetCustmerBaseResult = @"result";
NSString *const kJCModel_GetCustmerBaseNum = @"num";
NSString *const kJCModel_GetCustmerBaseCode = @"code";
NSString *const kJCModel_GetCustmerBaseMsg = @"msg";
NSString *const kJCModel_GetCustmerBaseData = @"data";


@interface JCModel_GetCustmerBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetCustmerBase

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
            self.result = [self objectOrNilForKey:kJCModel_GetCustmerBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_GetCustmerBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_GetCustmerBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_GetCustmerBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_GetCustmerData = [dict objectForKey:kJCModel_GetCustmerBaseData];
    NSMutableArray *parsedJCModel_GetCustmerData = [NSMutableArray array];
    
    if ([receivedJCModel_GetCustmerData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GetCustmerData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GetCustmerData addObject:[JCModel_GetCustmerData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GetCustmerData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GetCustmerData addObject:[JCModel_GetCustmerData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GetCustmerData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_GetCustmerData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_GetCustmerBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_GetCustmerBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_GetCustmerBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_GetCustmerBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_GetCustmerBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_GetCustmerBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_GetCustmerBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_GetCustmerBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_GetCustmerBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_GetCustmerBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_GetCustmerBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_GetCustmerBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_GetCustmerBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_GetCustmerBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_GetCustmerBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetCustmerBase *copy = [[JCModel_GetCustmerBase alloc] init];
    
    
    
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
