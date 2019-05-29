//
//  JCModel_CooperationPoiontOrderBase.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderBase.h"
#import "JCModel_CooperationPoiontOrderData.h"


NSString *const kJCModel_CooperationPoiontOrderBaseResult = @"result";
NSString *const kJCModel_CooperationPoiontOrderBaseNum = @"num";
NSString *const kJCModel_CooperationPoiontOrderBaseCode = @"code";
NSString *const kJCModel_CooperationPoiontOrderBaseMsg = @"msg";
NSString *const kJCModel_CooperationPoiontOrderBaseData = @"data";


@interface JCModel_CooperationPoiontOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderBase

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
            self.result = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderBaseMsg fromDictionary:dict];
            self.data = [JCModel_CooperationPoiontOrderData modelObjectWithDictionary:[dict objectForKey:kJCModel_CooperationPoiontOrderBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_CooperationPoiontOrderBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_CooperationPoiontOrderBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_CooperationPoiontOrderBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_CooperationPoiontOrderBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_CooperationPoiontOrderBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_CooperationPoiontOrderBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_CooperationPoiontOrderBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_CooperationPoiontOrderBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_CooperationPoiontOrderBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_CooperationPoiontOrderBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderBase *copy = [[JCModel_CooperationPoiontOrderBase alloc] init];
    
    
    
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
