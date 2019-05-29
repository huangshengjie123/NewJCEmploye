//
//  JCModel_AddressSelectedBase.m
//
//  Created by   on 2018/6/6
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AddressSelectedBase.h"
#import "JCModel_AddressSelectedData.h"


NSString *const kJCModel_AddressSelectedBaseResult = @"result";
NSString *const kJCModel_AddressSelectedBaseNum = @"num";
NSString *const kJCModel_AddressSelectedBaseCode = @"code";
NSString *const kJCModel_AddressSelectedBaseMsg = @"msg";
NSString *const kJCModel_AddressSelectedBaseData = @"data";


@interface JCModel_AddressSelectedBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AddressSelectedBase

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
            self.result = [self objectOrNilForKey:kJCModel_AddressSelectedBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_AddressSelectedBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_AddressSelectedBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_AddressSelectedBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_AddressSelectedData = [dict objectForKey:kJCModel_AddressSelectedBaseData];
    NSMutableArray *parsedJCModel_AddressSelectedData = [NSMutableArray array];
    
    if ([receivedJCModel_AddressSelectedData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_AddressSelectedData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_AddressSelectedData addObject:[JCModel_AddressSelectedData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_AddressSelectedData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_AddressSelectedData addObject:[JCModel_AddressSelectedData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_AddressSelectedData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_AddressSelectedData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_AddressSelectedBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_AddressSelectedBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_AddressSelectedBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_AddressSelectedBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_AddressSelectedBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_AddressSelectedBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_AddressSelectedBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_AddressSelectedBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_AddressSelectedBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_AddressSelectedBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_AddressSelectedBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AddressSelectedBase *copy = [[JCModel_AddressSelectedBase alloc] init];
    
    
    
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
