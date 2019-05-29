//
//  JCModel_NewDistributionCarDetailsBase.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsBase.h"
#import "JCModel_NewDistributionCarDetailsData.h"


NSString *const kJCModel_NewDistributionCarDetailsBaseResult = @"result";
NSString *const kJCModel_NewDistributionCarDetailsBaseNum = @"num";
NSString *const kJCModel_NewDistributionCarDetailsBaseCode = @"code";
NSString *const kJCModel_NewDistributionCarDetailsBaseMsg = @"msg";
NSString *const kJCModel_NewDistributionCarDetailsBaseData = @"data";


@interface JCModel_NewDistributionCarDetailsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsBase

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
            self.result = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsBaseMsg fromDictionary:dict];
            self.data = [JCModel_NewDistributionCarDetailsData modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDistributionCarDetailsBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_NewDistributionCarDetailsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_NewDistributionCarDetailsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_NewDistributionCarDetailsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_NewDistributionCarDetailsBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_NewDistributionCarDetailsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_NewDistributionCarDetailsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_NewDistributionCarDetailsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_NewDistributionCarDetailsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_NewDistributionCarDetailsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_NewDistributionCarDetailsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsBase *copy = [[JCModel_NewDistributionCarDetailsBase alloc] init];
    
    
    
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
