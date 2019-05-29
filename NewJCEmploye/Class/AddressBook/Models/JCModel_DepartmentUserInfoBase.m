//
//  JCModel_DepartmentUserInfoBase.m
//
//  Created by   on 2018/4/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentUserInfoBase.h"
#import "JCModel_DepartmentUserInfoData.h"


NSString *const kJCModel_DepartmentUserInfoBaseResult = @"result";
NSString *const kJCModel_DepartmentUserInfoBaseNum = @"num";
NSString *const kJCModel_DepartmentUserInfoBaseCode = @"code";
NSString *const kJCModel_DepartmentUserInfoBaseMsg = @"msg";
NSString *const kJCModel_DepartmentUserInfoBaseData = @"data";


@interface JCModel_DepartmentUserInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentUserInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_DepartmentUserInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_DepartmentUserInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_DepartmentUserInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_DepartmentUserInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_DepartmentUserInfoData = [dict objectForKey:kJCModel_DepartmentUserInfoBaseData];
    NSMutableArray *parsedJCModel_DepartmentUserInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_DepartmentUserInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DepartmentUserInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DepartmentUserInfoData addObject:[JCModel_DepartmentUserInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DepartmentUserInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DepartmentUserInfoData addObject:[JCModel_DepartmentUserInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DepartmentUserInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_DepartmentUserInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_DepartmentUserInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_DepartmentUserInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_DepartmentUserInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_DepartmentUserInfoBaseMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_DepartmentUserInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_DepartmentUserInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_DepartmentUserInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_DepartmentUserInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_DepartmentUserInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_DepartmentUserInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_DepartmentUserInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentUserInfoBase *copy = [[JCModel_DepartmentUserInfoBase alloc] init];
    
    
    
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
