//
//  JCModel_empDataBBase.m
//
//  Created by   on 2019/1/14
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_empDataBBase.h"
#import "JCModel_empDataBData.h"


NSString *const kJCModel_empDataBBaseResult = @"result";
NSString *const kJCModel_empDataBBaseNum = @"num";
NSString *const kJCModel_empDataBBaseCode = @"code";
NSString *const kJCModel_empDataBBaseMsg = @"msg";
NSString *const kJCModel_empDataBBaseData = @"data";


@interface JCModel_empDataBBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_empDataBBase

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
            self.result = [self objectOrNilForKey:kJCModel_empDataBBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_empDataBBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_empDataBBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_empDataBBaseMsg fromDictionary:dict];
            self.data = [JCModel_empDataBData modelObjectWithDictionary:[dict objectForKey:kJCModel_empDataBBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_empDataBBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_empDataBBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_empDataBBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_empDataBBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_empDataBBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_empDataBBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_empDataBBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_empDataBBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_empDataBBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_empDataBBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_empDataBBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_empDataBBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_empDataBBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_empDataBBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_empDataBBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_empDataBBase *copy = [[JCModel_empDataBBase alloc] init];
    
    
    
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
