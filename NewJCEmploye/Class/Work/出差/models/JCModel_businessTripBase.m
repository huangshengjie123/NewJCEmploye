//
//  JCModel_businessTripBase.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_businessTripBase.h"
#import "JCModel_businessTripData.h"


NSString *const kJCModel_businessTripBaseResult = @"result";
NSString *const kJCModel_businessTripBaseNum = @"num";
NSString *const kJCModel_businessTripBaseCode = @"code";
NSString *const kJCModel_businessTripBaseMsg = @"msg";
NSString *const kJCModel_businessTripBaseData = @"data";


@interface JCModel_businessTripBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_businessTripBase

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
            self.result = [self objectOrNilForKey:kJCModel_businessTripBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_businessTripBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_businessTripBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_businessTripBaseMsg fromDictionary:dict];
            self.data = [JCModel_businessTripData modelObjectWithDictionary:[dict objectForKey:kJCModel_businessTripBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_businessTripBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_businessTripBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_businessTripBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_businessTripBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_businessTripBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_businessTripBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_businessTripBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_businessTripBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_businessTripBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_businessTripBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_businessTripBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_businessTripBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_businessTripBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_businessTripBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_businessTripBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_businessTripBase *copy = [[JCModel_businessTripBase alloc] init];
    
    
    
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
