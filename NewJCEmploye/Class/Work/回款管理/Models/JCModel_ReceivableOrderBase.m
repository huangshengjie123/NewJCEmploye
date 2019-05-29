//
//  JCModel_ReceivableOrderBase.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderBase.h"
#import "JCModel_ReceivableOrderData.h"


NSString *const kJCModel_ReceivableOrderBaseResult = @"result";
NSString *const kJCModel_ReceivableOrderBaseNum = @"num";
NSString *const kJCModel_ReceivableOrderBaseCode = @"code";
NSString *const kJCModel_ReceivableOrderBaseMsg = @"msg";
NSString *const kJCModel_ReceivableOrderBaseData = @"data";


@interface JCModel_ReceivableOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_ReceivableOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ReceivableOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ReceivableOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ReceivableOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_ReceivableOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_ReceivableOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ReceivableOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ReceivableOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ReceivableOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ReceivableOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_ReceivableOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ReceivableOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ReceivableOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ReceivableOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ReceivableOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ReceivableOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderBase *copy = [[JCModel_ReceivableOrderBase alloc] init];
    
    
    
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
