//
//  JCModel_DistributionBase.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionBase.h"
#import "JCModel_DistributionData.h"


NSString *const kJCModel_DistributionBaseResult = @"result";
NSString *const kJCModel_DistributionBaseNum = @"num";
NSString *const kJCModel_DistributionBaseCode = @"code";
NSString *const kJCModel_DistributionBaseMsg = @"msg";
NSString *const kJCModel_DistributionBaseData = @"data";


@interface JCModel_DistributionBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionBase

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
            self.result = [self objectOrNilForKey:kJCModel_DistributionBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_DistributionBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_DistributionBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_DistributionBaseMsg fromDictionary:dict];
            self.data = [JCModel_DistributionData modelObjectWithDictionary:[dict objectForKey:kJCModel_DistributionBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_DistributionBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_DistributionBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_DistributionBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_DistributionBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_DistributionBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_DistributionBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_DistributionBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_DistributionBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_DistributionBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_DistributionBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_DistributionBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_DistributionBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_DistributionBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_DistributionBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_DistributionBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionBase *copy = [[JCModel_DistributionBase alloc] init];
    
    
    
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
