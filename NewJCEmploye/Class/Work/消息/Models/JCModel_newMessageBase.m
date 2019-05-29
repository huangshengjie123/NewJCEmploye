//
//  JCModel_newMessageBase.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newMessageBase.h"
#import "JCModel_newMessageData.h"


NSString *const kJCModel_newMessageBaseResult = @"result";
NSString *const kJCModel_newMessageBaseNum = @"num";
NSString *const kJCModel_newMessageBaseCode = @"code";
NSString *const kJCModel_newMessageBaseMsg = @"msg";
NSString *const kJCModel_newMessageBaseData = @"data";


@interface JCModel_newMessageBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newMessageBase

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
            self.result = [self objectOrNilForKey:kJCModel_newMessageBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_newMessageBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_newMessageBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_newMessageBaseMsg fromDictionary:dict];
            self.data = [JCModel_newMessageData modelObjectWithDictionary:[dict objectForKey:kJCModel_newMessageBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_newMessageBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_newMessageBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_newMessageBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_newMessageBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_newMessageBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_newMessageBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_newMessageBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_newMessageBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_newMessageBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_newMessageBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_newMessageBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_newMessageBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_newMessageBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_newMessageBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_newMessageBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newMessageBase *copy = [[JCModel_newMessageBase alloc] init];
    
    
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.num = (id)[self.num copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = (id)[self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
