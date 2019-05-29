//
//  JCModel_employeeInfoBase.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_employeeInfoBase.h"
#import "JCModel_employeeInfoData.h"


NSString *const kJCModel_employeeInfoBaseResult = @"result";
NSString *const kJCModel_employeeInfoBaseNum = @"num";
NSString *const kJCModel_employeeInfoBaseCode = @"code";
NSString *const kJCModel_employeeInfoBaseMsg = @"msg";
NSString *const kJCModel_employeeInfoBaseData = @"data";


@interface JCModel_employeeInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_employeeInfoBase

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
            self.result = [self objectOrNilForKey:kJCModel_employeeInfoBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_employeeInfoBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_employeeInfoBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_employeeInfoBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_employeeInfoData = [dict objectForKey:kJCModel_employeeInfoBaseData];
    NSMutableArray *parsedJCModel_employeeInfoData = [NSMutableArray array];
    
    if ([receivedJCModel_employeeInfoData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_employeeInfoData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_employeeInfoData addObject:[JCModel_employeeInfoData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_employeeInfoData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_employeeInfoData addObject:[JCModel_employeeInfoData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_employeeInfoData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_employeeInfoData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_employeeInfoBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_employeeInfoBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_employeeInfoBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_employeeInfoBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_employeeInfoBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_employeeInfoBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_employeeInfoBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_employeeInfoBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_employeeInfoBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_employeeInfoBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_employeeInfoBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_employeeInfoBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_employeeInfoBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_employeeInfoBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_employeeInfoBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_employeeInfoBase *copy = [[JCModel_employeeInfoBase alloc] init];
    
    
    
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
