//
//  JCModel_InAndOutBase.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutBase.h"
#import "JCModel_InAndOutData.h"


NSString *const kJCModel_InAndOutBaseResult = @"result";
NSString *const kJCModel_InAndOutBaseNum = @"num";
NSString *const kJCModel_InAndOutBaseCode = @"code";
NSString *const kJCModel_InAndOutBaseMsg = @"msg";
NSString *const kJCModel_InAndOutBaseData = @"data";


@interface JCModel_InAndOutBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutBase

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
            self.result = [self objectOrNilForKey:kJCModel_InAndOutBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_InAndOutBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_InAndOutBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_InAndOutBaseMsg fromDictionary:dict];
            self.data = [JCModel_InAndOutData modelObjectWithDictionary:[dict objectForKey:kJCModel_InAndOutBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_InAndOutBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_InAndOutBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_InAndOutBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_InAndOutBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_InAndOutBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_InAndOutBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_InAndOutBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_InAndOutBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_InAndOutBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_InAndOutBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_InAndOutBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_InAndOutBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_InAndOutBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_InAndOutBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_InAndOutBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutBase *copy = [[JCModel_InAndOutBase alloc] init];
    
    
    
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
