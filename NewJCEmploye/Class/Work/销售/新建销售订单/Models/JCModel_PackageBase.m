//
//  JCModel_PackageBase.m
//
//  Created by   on 2018/6/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PackageBase.h"
#import "JCModel_PackageData.h"


NSString *const kJCModel_PackageBaseResult = @"result";
NSString *const kJCModel_PackageBaseNum = @"num";
NSString *const kJCModel_PackageBaseCode = @"code";
NSString *const kJCModel_PackageBaseMsg = @"msg";
NSString *const kJCModel_PackageBaseData = @"data";


@interface JCModel_PackageBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PackageBase

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
            self.result = [self objectOrNilForKey:kJCModel_PackageBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_PackageBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_PackageBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_PackageBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_PackageData = [dict objectForKey:kJCModel_PackageBaseData];
    NSMutableArray *parsedJCModel_PackageData = [NSMutableArray array];
    
    if ([receivedJCModel_PackageData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_PackageData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_PackageData addObject:[JCModel_PackageData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_PackageData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_PackageData addObject:[JCModel_PackageData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_PackageData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_PackageData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_PackageBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_PackageBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_PackageBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_PackageBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_PackageBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_PackageBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_PackageBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_PackageBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_PackageBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_PackageBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_PackageBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_PackageBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_PackageBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_PackageBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_PackageBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PackageBase *copy = [[JCModel_PackageBase alloc] init];
    
    
    
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
