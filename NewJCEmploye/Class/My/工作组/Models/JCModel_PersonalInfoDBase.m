//
//  JCModel_PersonalInfoDBase.m
//
//  Created by   on 2018/11/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PersonalInfoDBase.h"
#import "JCModel_PersonalInfoDData.h"


NSString *const kJCModel_PersonalInfoDBaseResult = @"result";
NSString *const kJCModel_PersonalInfoDBaseNum = @"num";
NSString *const kJCModel_PersonalInfoDBaseCode = @"code";
NSString *const kJCModel_PersonalInfoDBaseMsg = @"msg";
NSString *const kJCModel_PersonalInfoDBaseData = @"data";


@interface JCModel_PersonalInfoDBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PersonalInfoDBase

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
            self.result = [self objectOrNilForKey:kJCModel_PersonalInfoDBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_PersonalInfoDBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_PersonalInfoDBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_PersonalInfoDBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_PersonalInfoDData = [dict objectForKey:kJCModel_PersonalInfoDBaseData];
    NSMutableArray *parsedJCModel_PersonalInfoDData = [NSMutableArray array];
    
    if ([receivedJCModel_PersonalInfoDData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_PersonalInfoDData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_PersonalInfoDData addObject:[JCModel_PersonalInfoDData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_PersonalInfoDData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_PersonalInfoDData addObject:[JCModel_PersonalInfoDData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_PersonalInfoDData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_PersonalInfoDData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_PersonalInfoDBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_PersonalInfoDBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_PersonalInfoDBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_PersonalInfoDBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_PersonalInfoDBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_PersonalInfoDBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_PersonalInfoDBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_PersonalInfoDBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_PersonalInfoDBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_PersonalInfoDBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_PersonalInfoDBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PersonalInfoDBase *copy = [[JCModel_PersonalInfoDBase alloc] init];
    
    
    
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
