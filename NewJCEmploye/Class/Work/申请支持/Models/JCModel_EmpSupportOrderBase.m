//
//  JCModel_EmpSupportOrderBase.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderBase.h"
#import "JCModel_EmpSupportOrderData.h"


NSString *const kJCModel_EmpSupportOrderBaseResult = @"result";
NSString *const kJCModel_EmpSupportOrderBaseNum = @"num";
NSString *const kJCModel_EmpSupportOrderBaseCode = @"code";
NSString *const kJCModel_EmpSupportOrderBaseMsg = @"msg";
NSString *const kJCModel_EmpSupportOrderBaseData = @"data";


@interface JCModel_EmpSupportOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_EmpSupportOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_EmpSupportOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_EmpSupportOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_EmpSupportOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_EmpSupportOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_EmpSupportOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_EmpSupportOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_EmpSupportOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_EmpSupportOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_EmpSupportOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_EmpSupportOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_EmpSupportOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_EmpSupportOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_EmpSupportOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderBase *copy = [[JCModel_EmpSupportOrderBase alloc] init];
    
    
    
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
