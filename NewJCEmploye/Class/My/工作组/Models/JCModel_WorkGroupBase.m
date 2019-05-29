//
//  JCModel_WorkGroupBase.m
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkGroupBase.h"
#import "JCModel_WorkGroupData.h"


NSString *const kJCModel_WorkGroupBaseResult = @"result";
NSString *const kJCModel_WorkGroupBaseNum = @"num";
NSString *const kJCModel_WorkGroupBaseCode = @"code";
NSString *const kJCModel_WorkGroupBaseMsg = @"msg";
NSString *const kJCModel_WorkGroupBaseData = @"data";


@interface JCModel_WorkGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkGroupBase

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
            self.result = [self objectOrNilForKey:kJCModel_WorkGroupBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_WorkGroupBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_WorkGroupBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_WorkGroupBaseMsg fromDictionary:dict];
            self.data = [JCModel_WorkGroupData modelObjectWithDictionary:[dict objectForKey:kJCModel_WorkGroupBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_WorkGroupBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_WorkGroupBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_WorkGroupBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_WorkGroupBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_WorkGroupBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_WorkGroupBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_WorkGroupBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_WorkGroupBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_WorkGroupBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_WorkGroupBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_WorkGroupBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_WorkGroupBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_WorkGroupBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_WorkGroupBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_WorkGroupBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkGroupBase *copy = [[JCModel_WorkGroupBase alloc] init];
    
    
    
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
