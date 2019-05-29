//
//  JCModel_franchiserBase.m
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserBase.h"
#import "JCModel_franchiserData.h"


NSString *const kJCModel_franchiserBaseResult = @"result";
NSString *const kJCModel_franchiserBaseNum = @"num";
NSString *const kJCModel_franchiserBaseCode = @"code";
NSString *const kJCModel_franchiserBaseMsg = @"msg";
NSString *const kJCModel_franchiserBaseData = @"data";


@interface JCModel_franchiserBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserBase

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
            self.result = [self objectOrNilForKey:kJCModel_franchiserBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_franchiserBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_franchiserBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_franchiserBaseMsg fromDictionary:dict];
            self.data = [JCModel_franchiserData modelObjectWithDictionary:[dict objectForKey:kJCModel_franchiserBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_franchiserBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_franchiserBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_franchiserBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_franchiserBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_franchiserBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_franchiserBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_franchiserBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_franchiserBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_franchiserBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_franchiserBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_franchiserBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_franchiserBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_franchiserBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_franchiserBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_franchiserBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserBase *copy = [[JCModel_franchiserBase alloc] init];
    
    
    
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
