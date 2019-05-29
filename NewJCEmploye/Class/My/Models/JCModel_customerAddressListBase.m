//
//  JCModel_customerAddressListBase.m
//
//  Created by   on 2018/12/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_customerAddressListBase.h"
#import "JCModel_customerAddressListData.h"


NSString *const kJCModel_customerAddressListBaseResult = @"result";
NSString *const kJCModel_customerAddressListBaseNum = @"num";
NSString *const kJCModel_customerAddressListBaseCode = @"code";
NSString *const kJCModel_customerAddressListBaseMsg = @"msg";
NSString *const kJCModel_customerAddressListBaseData = @"data";


@interface JCModel_customerAddressListBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_customerAddressListBase

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
            self.result = [self objectOrNilForKey:kJCModel_customerAddressListBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_customerAddressListBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_customerAddressListBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_customerAddressListBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_customerAddressListData = [dict objectForKey:kJCModel_customerAddressListBaseData];
    NSMutableArray *parsedJCModel_customerAddressListData = [NSMutableArray array];
    
    if ([receivedJCModel_customerAddressListData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_customerAddressListData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_customerAddressListData addObject:[JCModel_customerAddressListData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_customerAddressListData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_customerAddressListData addObject:[JCModel_customerAddressListData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_customerAddressListData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_customerAddressListData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_customerAddressListBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_customerAddressListBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_customerAddressListBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_customerAddressListBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_customerAddressListBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_customerAddressListBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_customerAddressListBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_customerAddressListBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_customerAddressListBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_customerAddressListBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_customerAddressListBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_customerAddressListBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_customerAddressListBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_customerAddressListBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_customerAddressListBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_customerAddressListBase *copy = [[JCModel_customerAddressListBase alloc] init];
    
    
    
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
