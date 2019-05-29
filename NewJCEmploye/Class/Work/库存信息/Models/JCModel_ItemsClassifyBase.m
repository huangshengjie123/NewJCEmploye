//
//  JCModel_ItemsClassifyBase.m
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsClassifyBase.h"
#import "JCModel_ItemsClassifyData.h"


NSString *const kJCModel_ItemsClassifyBaseResult = @"result";
NSString *const kJCModel_ItemsClassifyBaseNum = @"num";
NSString *const kJCModel_ItemsClassifyBaseCode = @"code";
NSString *const kJCModel_ItemsClassifyBaseMsg = @"msg";
NSString *const kJCModel_ItemsClassifyBaseData = @"data";


@interface JCModel_ItemsClassifyBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsClassifyBase

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
            self.result = [self objectOrNilForKey:kJCModel_ItemsClassifyBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ItemsClassifyBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ItemsClassifyBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ItemsClassifyBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_ItemsClassifyData = [dict objectForKey:kJCModel_ItemsClassifyBaseData];
    NSMutableArray *parsedJCModel_ItemsClassifyData = [NSMutableArray array];
    
    if ([receivedJCModel_ItemsClassifyData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ItemsClassifyData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ItemsClassifyData addObject:[JCModel_ItemsClassifyData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ItemsClassifyData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ItemsClassifyData addObject:[JCModel_ItemsClassifyData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ItemsClassifyData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_ItemsClassifyData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ItemsClassifyBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ItemsClassifyBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ItemsClassifyBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ItemsClassifyBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_ItemsClassifyBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ItemsClassifyBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ItemsClassifyBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ItemsClassifyBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ItemsClassifyBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ItemsClassifyBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ItemsClassifyBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsClassifyBase *copy = [[JCModel_ItemsClassifyBase alloc] init];
    
    
    
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
