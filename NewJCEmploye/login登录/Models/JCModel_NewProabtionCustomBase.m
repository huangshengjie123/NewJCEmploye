//
//  JCModel_NewProabtionCustomBase.m
//
//  Created by   on 2019/2/15
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProabtionCustomBase.h"
#import "JCModel_NewProabtionCustomData.h"


NSString *const kJCModel_NewProabtionCustomBaseResult = @"result";
NSString *const kJCModel_NewProabtionCustomBaseNum = @"num";
NSString *const kJCModel_NewProabtionCustomBaseCode = @"code";
NSString *const kJCModel_NewProabtionCustomBaseMsg = @"msg";
NSString *const kJCModel_NewProabtionCustomBaseData = @"data";


@interface JCModel_NewProabtionCustomBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProabtionCustomBase

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
            self.result = [self objectOrNilForKey:kJCModel_NewProabtionCustomBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_NewProabtionCustomBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_NewProabtionCustomBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_NewProabtionCustomBaseMsg fromDictionary:dict];
            self.data = [JCModel_NewProabtionCustomData modelObjectWithDictionary:[dict objectForKey:kJCModel_NewProabtionCustomBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_NewProabtionCustomBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_NewProabtionCustomBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_NewProabtionCustomBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_NewProabtionCustomBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_NewProabtionCustomBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_NewProabtionCustomBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_NewProabtionCustomBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_NewProabtionCustomBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_NewProabtionCustomBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_NewProabtionCustomBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_NewProabtionCustomBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProabtionCustomBase *copy = [[JCModel_NewProabtionCustomBase alloc] init];
    
    
    
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
