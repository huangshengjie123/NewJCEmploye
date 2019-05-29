//
//  JCModel_OtherIncomeBase.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomeBase.h"
#import "JCModel_OtherIncomeData.h"


NSString *const kJCModel_OtherIncomeBaseResult = @"result";
NSString *const kJCModel_OtherIncomeBaseNum = @"num";
NSString *const kJCModel_OtherIncomeBaseCode = @"code";
NSString *const kJCModel_OtherIncomeBaseMsg = @"msg";
NSString *const kJCModel_OtherIncomeBaseData = @"data";


@interface JCModel_OtherIncomeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomeBase

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
            self.result = [self objectOrNilForKey:kJCModel_OtherIncomeBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_OtherIncomeBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_OtherIncomeBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_OtherIncomeBaseMsg fromDictionary:dict];
            self.data = [JCModel_OtherIncomeData modelObjectWithDictionary:[dict objectForKey:kJCModel_OtherIncomeBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_OtherIncomeBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_OtherIncomeBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_OtherIncomeBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_OtherIncomeBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_OtherIncomeBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_OtherIncomeBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_OtherIncomeBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_OtherIncomeBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_OtherIncomeBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_OtherIncomeBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomeBase *copy = [[JCModel_OtherIncomeBase alloc] init];
    
    
    
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
