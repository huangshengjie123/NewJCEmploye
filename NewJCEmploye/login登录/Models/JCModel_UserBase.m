//
//  JCModel_UserBase.m
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UserBase.h"
#import "JCModel_UserData.h"


NSString *const kJCModel_UserBaseResult = @"result";
NSString *const kJCModel_UserBaseNum = @"num";
NSString *const kJCModel_UserBaseCode = @"code";
NSString *const kJCModel_UserBaseMsg = @"msg";
NSString *const kJCModel_UserBaseData = @"data";


@interface JCModel_UserBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UserBase

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
            self.result = [self objectOrNilForKey:kJCModel_UserBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_UserBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_UserBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_UserBaseMsg fromDictionary:dict];
            self.data = [JCModel_UserData modelObjectWithDictionary:[dict objectForKey:kJCModel_UserBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_UserBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_UserBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_UserBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_UserBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_UserBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_UserBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_UserBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_UserBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_UserBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_UserBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_UserBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_UserBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_UserBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_UserBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_UserBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UserBase *copy = [[JCModel_UserBase alloc] init];
    
    
    
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
