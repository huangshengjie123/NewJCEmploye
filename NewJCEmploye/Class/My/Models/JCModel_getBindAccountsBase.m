//
//  JCModel_getBindAccountsBase.m
//
//  Created by   on 2018/12/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getBindAccountsBase.h"
#import "JCModel_getBindAccountsData.h"


NSString *const kJCModel_getBindAccountsBaseResult = @"result";
NSString *const kJCModel_getBindAccountsBaseNum = @"num";
NSString *const kJCModel_getBindAccountsBaseCode = @"code";
NSString *const kJCModel_getBindAccountsBaseMsg = @"msg";
NSString *const kJCModel_getBindAccountsBaseData = @"data";


@interface JCModel_getBindAccountsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getBindAccountsBase

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
            self.result = [self objectOrNilForKey:kJCModel_getBindAccountsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_getBindAccountsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_getBindAccountsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_getBindAccountsBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_getBindAccountsData = [dict objectForKey:kJCModel_getBindAccountsBaseData];
    NSMutableArray *parsedJCModel_getBindAccountsData = [NSMutableArray array];
    
    if ([receivedJCModel_getBindAccountsData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_getBindAccountsData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_getBindAccountsData addObject:[JCModel_getBindAccountsData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_getBindAccountsData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_getBindAccountsData addObject:[JCModel_getBindAccountsData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_getBindAccountsData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_getBindAccountsData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_getBindAccountsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_getBindAccountsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_getBindAccountsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_getBindAccountsBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_getBindAccountsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_getBindAccountsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_getBindAccountsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_getBindAccountsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_getBindAccountsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_getBindAccountsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getBindAccountsBase *copy = [[JCModel_getBindAccountsBase alloc] init];
    
    
    
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
