//
//  JCModel_CooperationBase.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationBase.h"
#import "JCModel_CooperationData.h"


NSString *const kJCModel_CooperationBaseResult = @"result";
NSString *const kJCModel_CooperationBaseNum = @"num";
NSString *const kJCModel_CooperationBaseCode = @"code";
NSString *const kJCModel_CooperationBaseMsg = @"msg";
NSString *const kJCModel_CooperationBaseData = @"data";


@interface JCModel_CooperationBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationBase

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
            self.result = [self objectOrNilForKey:kJCModel_CooperationBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_CooperationBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_CooperationBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_CooperationBaseMsg fromDictionary:dict];
            self.data = [JCModel_CooperationData modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_CooperationBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_CooperationBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_CooperationBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_CooperationBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_CooperationBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_CooperationBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_CooperationBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_CooperationBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_CooperationBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_CooperationBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_CooperationBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_CooperationBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_CooperationBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_CooperationBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_CooperationBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationBase *copy = [[JCModel_CooperationBase alloc] init];
    
    
    
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
