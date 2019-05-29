//
//  JCModel_ItemsBase.m
//
//  Created by   on 2018/5/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ItemsBase.h"
#import "JCModel_ItemsData.h"


NSString *const kJCModel_ItemsBaseResult = @"result";
NSString *const kJCModel_ItemsBaseNum = @"num";
NSString *const kJCModel_ItemsBaseCode = @"code";
NSString *const kJCModel_ItemsBaseMsg = @"msg";
NSString *const kJCModel_ItemsBaseData = @"data";


@interface JCModel_ItemsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ItemsBase

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
            self.result = [self objectOrNilForKey:kJCModel_ItemsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ItemsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ItemsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ItemsBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_ItemsData = [dict objectForKey:kJCModel_ItemsBaseData];
    NSMutableArray *parsedJCModel_ItemsData = [NSMutableArray array];
    
    if ([receivedJCModel_ItemsData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ItemsData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ItemsData addObject:[JCModel_ItemsData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ItemsData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ItemsData addObject:[JCModel_ItemsData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ItemsData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_ItemsData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ItemsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ItemsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ItemsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ItemsBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_ItemsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ItemsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ItemsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ItemsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ItemsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ItemsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ItemsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ItemsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ItemsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ItemsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ItemsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ItemsBase *copy = [[JCModel_ItemsBase alloc] init];
    
    
    
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
