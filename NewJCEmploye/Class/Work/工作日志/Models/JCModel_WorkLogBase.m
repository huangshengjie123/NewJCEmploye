//
//  JCModel_WorkLogBase.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogBase.h"
#import "JCModel_WorkLogData.h"


NSString *const kJCModel_WorkLogBaseResult = @"result";
NSString *const kJCModel_WorkLogBaseNum = @"num";
NSString *const kJCModel_WorkLogBaseCode = @"code";
NSString *const kJCModel_WorkLogBaseMsg = @"msg";
NSString *const kJCModel_WorkLogBaseData = @"data";


@interface JCModel_WorkLogBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogBase

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
            self.result = [self objectOrNilForKey:kJCModel_WorkLogBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WorkLogBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_WorkLogBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_WorkLogBaseMsg fromDictionary:dict];
            self.data = [JCModel_WorkLogData modelObjectWithDictionary:[dict objectForKey:kJCModel_WorkLogBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_WorkLogBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_WorkLogBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_WorkLogBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_WorkLogBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_WorkLogBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_WorkLogBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WorkLogBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_WorkLogBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_WorkLogBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_WorkLogBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_WorkLogBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_WorkLogBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_WorkLogBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_WorkLogBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_WorkLogBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogBase *copy = [[JCModel_WorkLogBase alloc] init];
    
    
    
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
