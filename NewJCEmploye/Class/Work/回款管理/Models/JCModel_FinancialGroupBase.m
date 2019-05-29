//
//  JCModel_FinancialGroupBase.m
//
//  Created by   on 2018/6/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinancialGroupBase.h"
#import "JCModel_FinancialGroupData.h"


NSString *const kJCModel_FinancialGroupBaseResult = @"result";
NSString *const kJCModel_FinancialGroupBaseNum = @"num";
NSString *const kJCModel_FinancialGroupBaseCode = @"code";
NSString *const kJCModel_FinancialGroupBaseMsg = @"msg";
NSString *const kJCModel_FinancialGroupBaseData = @"data";


@interface JCModel_FinancialGroupBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinancialGroupBase

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
            self.result = [self objectOrNilForKey:kJCModel_FinancialGroupBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_FinancialGroupBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_FinancialGroupBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_FinancialGroupBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_FinancialGroupData = [dict objectForKey:kJCModel_FinancialGroupBaseData];
    NSMutableArray *parsedJCModel_FinancialGroupData = [NSMutableArray array];
    
    if ([receivedJCModel_FinancialGroupData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_FinancialGroupData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_FinancialGroupData addObject:[JCModel_FinancialGroupData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_FinancialGroupData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_FinancialGroupData addObject:[JCModel_FinancialGroupData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_FinancialGroupData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_FinancialGroupData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_FinancialGroupBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_FinancialGroupBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_FinancialGroupBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_FinancialGroupBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_FinancialGroupBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_FinancialGroupBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_FinancialGroupBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_FinancialGroupBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_FinancialGroupBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_FinancialGroupBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_FinancialGroupBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinancialGroupBase *copy = [[JCModel_FinancialGroupBase alloc] init];
    
    
    
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
