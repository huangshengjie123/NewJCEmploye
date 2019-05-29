//
//  JCModel_RecordsConsumptionBase.m
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_RecordsConsumptionBase.h"
#import "JCModel_RecordsConsumptionData.h"


NSString *const kJCModel_RecordsConsumptionBaseResult = @"result";
NSString *const kJCModel_RecordsConsumptionBaseNum = @"num";
NSString *const kJCModel_RecordsConsumptionBaseCode = @"code";
NSString *const kJCModel_RecordsConsumptionBaseMsg = @"msg";
NSString *const kJCModel_RecordsConsumptionBaseData = @"data";


@interface JCModel_RecordsConsumptionBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_RecordsConsumptionBase

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
            self.result = [self objectOrNilForKey:kJCModel_RecordsConsumptionBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_RecordsConsumptionBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_RecordsConsumptionBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_RecordsConsumptionBaseMsg fromDictionary:dict];
            self.data = [JCModel_RecordsConsumptionData modelObjectWithDictionary:[dict objectForKey:kJCModel_RecordsConsumptionBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_RecordsConsumptionBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_RecordsConsumptionBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_RecordsConsumptionBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_RecordsConsumptionBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_RecordsConsumptionBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_RecordsConsumptionBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_RecordsConsumptionBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_RecordsConsumptionBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_RecordsConsumptionBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_RecordsConsumptionBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_RecordsConsumptionBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_RecordsConsumptionBase *copy = [[JCModel_RecordsConsumptionBase alloc] init];
    
    
    
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
