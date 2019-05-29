//
//  JCModel_AllOutInputOrderBase.m
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_AllOutInputOrderBase.h"
#import "JCModel_AllOutInputOrderData.h"


NSString *const kJCModel_AllOutInputOrderBaseResult = @"result";
NSString *const kJCModel_AllOutInputOrderBaseNum = @"num";
NSString *const kJCModel_AllOutInputOrderBaseCode = @"code";
NSString *const kJCModel_AllOutInputOrderBaseMsg = @"msg";
NSString *const kJCModel_AllOutInputOrderBaseData = @"data";


@interface JCModel_AllOutInputOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_AllOutInputOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_AllOutInputOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_AllOutInputOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_AllOutInputOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_AllOutInputOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_AllOutInputOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_AllOutInputOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_AllOutInputOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_AllOutInputOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_AllOutInputOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_AllOutInputOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_AllOutInputOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_AllOutInputOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_AllOutInputOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_AllOutInputOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_AllOutInputOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_AllOutInputOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_AllOutInputOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_AllOutInputOrderBase *copy = [[JCModel_AllOutInputOrderBase alloc] init];
    
    
    
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
