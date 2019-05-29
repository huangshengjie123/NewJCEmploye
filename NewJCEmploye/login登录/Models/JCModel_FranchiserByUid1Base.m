//
//  JCModel_FranchiserByUid1Base.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FranchiserByUid1Base.h"
#import "JCModel_FranchiserByUid1Data.h"


NSString *const kJCModel_FranchiserByUid1BaseResult = @"result";
NSString *const kJCModel_FranchiserByUid1BaseNum = @"num";
NSString *const kJCModel_FranchiserByUid1BaseCode = @"code";
NSString *const kJCModel_FranchiserByUid1BaseMsg = @"msg";
NSString *const kJCModel_FranchiserByUid1BaseData = @"data";


@interface JCModel_FranchiserByUid1Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FranchiserByUid1Base

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
            self.result = [self objectOrNilForKey:kJCModel_FranchiserByUid1BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_FranchiserByUid1BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_FranchiserByUid1BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_FranchiserByUid1BaseMsg fromDictionary:dict];
            self.data = [JCModel_FranchiserByUid1Data modelObjectWithDictionary:[dict objectForKey:kJCModel_FranchiserByUid1BaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_FranchiserByUid1BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_FranchiserByUid1BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_FranchiserByUid1BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_FranchiserByUid1BaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_FranchiserByUid1BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_FranchiserByUid1BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_FranchiserByUid1BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_FranchiserByUid1BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_FranchiserByUid1BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_FranchiserByUid1BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_FranchiserByUid1BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FranchiserByUid1Base *copy = [[JCModel_FranchiserByUid1Base alloc] init];
    
    
    
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
