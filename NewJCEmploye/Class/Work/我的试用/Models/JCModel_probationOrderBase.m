//
//  JCModel_probationOrderBase.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderBase.h"
#import "JCModel_probationOrderData.h"


NSString *const kJCModel_probationOrderBaseResult = @"result";
NSString *const kJCModel_probationOrderBaseNum = @"num";
NSString *const kJCModel_probationOrderBaseCode = @"code";
NSString *const kJCModel_probationOrderBaseMsg = @"msg";
NSString *const kJCModel_probationOrderBaseData = @"data";


@interface JCModel_probationOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_probationOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_probationOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_probationOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_probationOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_probationOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_probationOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_probationOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_probationOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_probationOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_probationOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_probationOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_probationOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_probationOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_probationOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_probationOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_probationOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_probationOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_probationOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_probationOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_probationOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_probationOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderBase *copy = [[JCModel_probationOrderBase alloc] init];
    
    
    
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
