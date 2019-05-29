//
//  JCModel_LoginBase.m
//
//  Created by   on 2018/4/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_LoginBase.h"


NSString *const kJCModel_LoginBaseMsg = @"msg";
NSString *const kJCModel_LoginBaseResult = @"result";
NSString *const kJCModel_LoginBaseCode = @"code";


@interface JCModel_LoginBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_LoginBase

@synthesize msg = _msg;
@synthesize result = _result;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kJCModel_LoginBaseMsg fromDictionary:dict];
            self.result = [self objectOrNilForKey:kJCModel_LoginBaseResult fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_LoginBaseCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kJCModel_LoginBaseMsg];
    [mutableDict setValue:self.result forKey:kJCModel_LoginBaseResult];
    [mutableDict setValue:self.code forKey:kJCModel_LoginBaseCode];

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

    self.msg = [aDecoder decodeObjectForKey:kJCModel_LoginBaseMsg];
    self.result = [aDecoder decodeObjectForKey:kJCModel_LoginBaseResult];
    self.code = [aDecoder decodeObjectForKey:kJCModel_LoginBaseCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kJCModel_LoginBaseMsg];
    [aCoder encodeObject:_result forKey:kJCModel_LoginBaseResult];
    [aCoder encodeObject:_code forKey:kJCModel_LoginBaseCode];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_LoginBase *copy = [[JCModel_LoginBase alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.result = [self.result copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
