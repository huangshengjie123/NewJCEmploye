//
//  JCModel_SellOrderBase.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderBase.h"
#import "JCModel_SellOrderData.h"


NSString *const kJCModel_SellOrderBaseResult = @"result";
NSString *const kJCModel_SellOrderBaseNum = @"num";
NSString *const kJCModel_SellOrderBaseCode = @"code";
NSString *const kJCModel_SellOrderBaseMsg = @"msg";
NSString *const kJCModel_SellOrderBaseData = @"data";


@interface JCModel_SellOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_SellOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_SellOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_SellOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_SellOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_SellOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_SellOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_SellOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_SellOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_SellOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_SellOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_SellOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_SellOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_SellOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_SellOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_SellOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_SellOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_SellOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_SellOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_SellOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_SellOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_SellOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderBase *copy = [[JCModel_SellOrderBase alloc] init];
    
    
    
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
