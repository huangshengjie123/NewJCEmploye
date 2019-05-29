//
//  JCModel_ReadWarningBase.m
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWarningBase.h"
#import "JCModel_ReadWarningData.h"


NSString *const kJCModel_ReadWarningBaseResult = @"result";
NSString *const kJCModel_ReadWarningBaseNum = @"num";
NSString *const kJCModel_ReadWarningBaseCode = @"code";
NSString *const kJCModel_ReadWarningBaseMsg = @"msg";
NSString *const kJCModel_ReadWarningBaseData = @"data";


@interface JCModel_ReadWarningBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWarningBase

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
            self.result = [self objectOrNilForKey:kJCModel_ReadWarningBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ReadWarningBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ReadWarningBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ReadWarningBaseMsg fromDictionary:dict];
            self.data = [JCModel_ReadWarningData modelObjectWithDictionary:[dict objectForKey:kJCModel_ReadWarningBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ReadWarningBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ReadWarningBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ReadWarningBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ReadWarningBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_ReadWarningBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ReadWarningBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ReadWarningBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ReadWarningBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ReadWarningBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ReadWarningBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ReadWarningBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ReadWarningBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ReadWarningBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ReadWarningBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ReadWarningBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWarningBase *copy = [[JCModel_ReadWarningBase alloc] init];
    
    
    
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
