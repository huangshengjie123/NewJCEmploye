//
//  Model_LoginBase.m
//
//  Created by   on 2018/1/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "Model_LoginBase.h"


NSString *const kModel_LoginBaseResult = @"result";
NSString *const kModel_LoginBaseMsg = @"msg";
NSString *const kModel_LoginBaseCode = @"code";


@interface Model_LoginBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Model_LoginBase

@synthesize result = _result;
@synthesize msg = _msg;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.result = [self objectOrNilForKey:kModel_LoginBaseResult fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kModel_LoginBaseMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kModel_LoginBaseCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kModel_LoginBaseResult];
    [mutableDict setValue:self.msg forKey:kModel_LoginBaseMsg];
    [mutableDict setValue:self.code forKey:kModel_LoginBaseCode];

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

    self.result = [aDecoder decodeObjectForKey:kModel_LoginBaseResult];
    self.msg = [aDecoder decodeObjectForKey:kModel_LoginBaseMsg];
    self.code = [aDecoder decodeObjectForKey:kModel_LoginBaseCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kModel_LoginBaseResult];
    [aCoder encodeObject:_msg forKey:kModel_LoginBaseMsg];
    [aCoder encodeObject:_code forKey:kModel_LoginBaseCode];
}

- (id)copyWithZone:(NSZone *)zone {
    Model_LoginBase *copy = [[Model_LoginBase alloc] init];
    
    
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
