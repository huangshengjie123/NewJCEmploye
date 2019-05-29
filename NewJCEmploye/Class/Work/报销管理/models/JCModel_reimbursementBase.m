//
//  JCModel_reimbursementBase.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementBase.h"
#import "JCModel_reimbursementData.h"


NSString *const kJCModel_reimbursementBaseResult = @"result";
NSString *const kJCModel_reimbursementBaseNum = @"num";
NSString *const kJCModel_reimbursementBaseCode = @"code";
NSString *const kJCModel_reimbursementBaseMsg = @"msg";
NSString *const kJCModel_reimbursementBaseData = @"data";


@interface JCModel_reimbursementBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementBase

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
            self.result = [self objectOrNilForKey:kJCModel_reimbursementBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_reimbursementBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_reimbursementBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_reimbursementBaseMsg fromDictionary:dict];
            self.data = [JCModel_reimbursementData modelObjectWithDictionary:[dict objectForKey:kJCModel_reimbursementBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_reimbursementBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_reimbursementBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_reimbursementBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_reimbursementBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_reimbursementBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_reimbursementBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_reimbursementBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_reimbursementBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_reimbursementBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_reimbursementBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_reimbursementBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_reimbursementBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_reimbursementBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_reimbursementBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_reimbursementBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementBase *copy = [[JCModel_reimbursementBase alloc] init];
    
    
    
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
