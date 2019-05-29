//
//  JCModel_InterstIncomeBase.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeBase.h"
#import "JCModel_InterstIncomeData.h"


NSString *const kJCModel_InterstIncomeBaseResult = @"result";
NSString *const kJCModel_InterstIncomeBaseNum = @"num";
NSString *const kJCModel_InterstIncomeBaseCode = @"code";
NSString *const kJCModel_InterstIncomeBaseMsg = @"msg";
NSString *const kJCModel_InterstIncomeBaseData = @"data";


@interface JCModel_InterstIncomeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeBase

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
            self.result = [self objectOrNilForKey:kJCModel_InterstIncomeBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_InterstIncomeBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_InterstIncomeBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_InterstIncomeBaseMsg fromDictionary:dict];
            self.data = [JCModel_InterstIncomeData modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_InterstIncomeBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_InterstIncomeBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_InterstIncomeBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_InterstIncomeBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_InterstIncomeBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_InterstIncomeBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_InterstIncomeBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_InterstIncomeBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_InterstIncomeBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_InterstIncomeBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeBase *copy = [[JCModel_InterstIncomeBase alloc] init];
    
    
    
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
