//
//  JCModel_watercardRecordsBase.m
//
//  Created by   on 2018/10/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_watercardRecordsBase.h"
#import "JCModel_watercardRecordsData.h"


NSString *const kJCModel_watercardRecordsBaseResult = @"result";
NSString *const kJCModel_watercardRecordsBaseNum = @"num";
NSString *const kJCModel_watercardRecordsBaseCode = @"code";
NSString *const kJCModel_watercardRecordsBaseMsg = @"msg";
NSString *const kJCModel_watercardRecordsBaseData = @"data";


@interface JCModel_watercardRecordsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_watercardRecordsBase

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
            self.result = [self objectOrNilForKey:kJCModel_watercardRecordsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_watercardRecordsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_watercardRecordsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_watercardRecordsBaseMsg fromDictionary:dict];
            self.data = [JCModel_watercardRecordsData modelObjectWithDictionary:[dict objectForKey:kJCModel_watercardRecordsBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_watercardRecordsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_watercardRecordsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_watercardRecordsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_watercardRecordsBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_watercardRecordsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_watercardRecordsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_watercardRecordsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_watercardRecordsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_watercardRecordsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_watercardRecordsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_watercardRecordsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_watercardRecordsBase *copy = [[JCModel_watercardRecordsBase alloc] init];
    
    
    
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
