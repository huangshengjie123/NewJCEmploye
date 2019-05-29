//
//  JCModel_DonationRecordsBase.m
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DonationRecordsBase.h"
#import "JCModel_DonationRecordsData.h"


NSString *const kJCModel_DonationRecordsBaseResult = @"result";
NSString *const kJCModel_DonationRecordsBaseNum = @"num";
NSString *const kJCModel_DonationRecordsBaseCode = @"code";
NSString *const kJCModel_DonationRecordsBaseMsg = @"msg";
NSString *const kJCModel_DonationRecordsBaseData = @"data";


@interface JCModel_DonationRecordsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DonationRecordsBase

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
            self.result = [self objectOrNilForKey:kJCModel_DonationRecordsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_DonationRecordsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_DonationRecordsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_DonationRecordsBaseMsg fromDictionary:dict];
            self.data = [JCModel_DonationRecordsData modelObjectWithDictionary:[dict objectForKey:kJCModel_DonationRecordsBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_DonationRecordsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_DonationRecordsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_DonationRecordsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_DonationRecordsBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_DonationRecordsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_DonationRecordsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_DonationRecordsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_DonationRecordsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_DonationRecordsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_DonationRecordsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DonationRecordsBase *copy = [[JCModel_DonationRecordsBase alloc] init];
    
    
    
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
