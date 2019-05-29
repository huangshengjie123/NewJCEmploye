//
//  JCmodel_StroeHouseItemsBase.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsBase.h"
#import "JCmodel_StroeHouseItemsData.h"


NSString *const kJCmodel_StroeHouseItemsBaseResult = @"result";
NSString *const kJCmodel_StroeHouseItemsBaseNum = @"num";
NSString *const kJCmodel_StroeHouseItemsBaseCode = @"code";
NSString *const kJCmodel_StroeHouseItemsBaseMsg = @"msg";
NSString *const kJCmodel_StroeHouseItemsBaseData = @"data";


@interface JCmodel_StroeHouseItemsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsBase

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
            self.result = [self objectOrNilForKey:kJCmodel_StroeHouseItemsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCmodel_StroeHouseItemsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCmodel_StroeHouseItemsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCmodel_StroeHouseItemsBaseMsg fromDictionary:dict];
            self.data = [JCmodel_StroeHouseItemsData modelObjectWithDictionary:[dict objectForKey:kJCmodel_StroeHouseItemsBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCmodel_StroeHouseItemsBaseResult];
    [mutableDict setValue:self.num forKey:kJCmodel_StroeHouseItemsBaseNum];
    [mutableDict setValue:self.code forKey:kJCmodel_StroeHouseItemsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCmodel_StroeHouseItemsBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCmodel_StroeHouseItemsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCmodel_StroeHouseItemsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCmodel_StroeHouseItemsBaseResult];
    [aCoder encodeObject:_num forKey:kJCmodel_StroeHouseItemsBaseNum];
    [aCoder encodeObject:_code forKey:kJCmodel_StroeHouseItemsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCmodel_StroeHouseItemsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCmodel_StroeHouseItemsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsBase *copy = [[JCmodel_StroeHouseItemsBase alloc] init];
    
    
    
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
