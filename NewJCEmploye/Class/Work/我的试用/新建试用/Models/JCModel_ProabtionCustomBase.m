//
//  JCModel_ProabtionCustomBase.m
//
//  Created by   on 2018/4/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ProabtionCustomBase.h"
#import "JCModel_ProabtionCustomData.h"


NSString *const kJCModel_ProabtionCustomBaseResult = @"result";
NSString *const kJCModel_ProabtionCustomBaseNum = @"num";
NSString *const kJCModel_ProabtionCustomBaseCode = @"code";
NSString *const kJCModel_ProabtionCustomBaseMsg = @"msg";
NSString *const kJCModel_ProabtionCustomBaseData = @"data";


@interface JCModel_ProabtionCustomBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ProabtionCustomBase

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
            self.result = [self objectOrNilForKey:kJCModel_ProabtionCustomBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ProabtionCustomBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ProabtionCustomBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ProabtionCustomBaseMsg fromDictionary:dict];
            self.data = [JCModel_ProabtionCustomData modelObjectWithDictionary:[dict objectForKey:kJCModel_ProabtionCustomBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ProabtionCustomBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ProabtionCustomBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ProabtionCustomBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ProabtionCustomBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_ProabtionCustomBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ProabtionCustomBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ProabtionCustomBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ProabtionCustomBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ProabtionCustomBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ProabtionCustomBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ProabtionCustomBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ProabtionCustomBase *copy = [[JCModel_ProabtionCustomBase alloc] init];
    
    
    
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
