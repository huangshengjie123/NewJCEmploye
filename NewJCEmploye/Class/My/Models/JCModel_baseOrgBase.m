//
//  JCModel_baseOrgBase.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_baseOrgBase.h"
#import "JCModel_baseOrgData.h"


NSString *const kJCModel_baseOrgBaseResult = @"result";
NSString *const kJCModel_baseOrgBaseNum = @"num";
NSString *const kJCModel_baseOrgBaseCode = @"code";
NSString *const kJCModel_baseOrgBaseMsg = @"msg";
NSString *const kJCModel_baseOrgBaseData = @"data";


@interface JCModel_baseOrgBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_baseOrgBase

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
            self.result = [self objectOrNilForKey:kJCModel_baseOrgBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_baseOrgBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_baseOrgBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_baseOrgBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_baseOrgData = [dict objectForKey:kJCModel_baseOrgBaseData];
    NSMutableArray *parsedJCModel_baseOrgData = [NSMutableArray array];
    
    if ([receivedJCModel_baseOrgData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_baseOrgData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_baseOrgData addObject:[JCModel_baseOrgData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_baseOrgData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_baseOrgData addObject:[JCModel_baseOrgData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_baseOrgData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_baseOrgData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_baseOrgBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_baseOrgBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_baseOrgBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_baseOrgBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_baseOrgBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_baseOrgBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_baseOrgBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_baseOrgBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_baseOrgBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_baseOrgBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_baseOrgBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_baseOrgBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_baseOrgBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_baseOrgBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_baseOrgBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_baseOrgBase *copy = [[JCModel_baseOrgBase alloc] init];
    
    
    
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
