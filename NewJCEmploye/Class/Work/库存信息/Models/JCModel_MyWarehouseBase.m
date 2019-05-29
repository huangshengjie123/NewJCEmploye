//
//  JCModel_MyWarehouseBase.m
//
//  Created by   on 2018/5/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyWarehouseBase.h"
#import "JCModel_MyWarehouseData.h"


NSString *const kJCModel_MyWarehouseBaseResult = @"result";
NSString *const kJCModel_MyWarehouseBaseNum = @"num";
NSString *const kJCModel_MyWarehouseBaseCode = @"code";
NSString *const kJCModel_MyWarehouseBaseMsg = @"msg";
NSString *const kJCModel_MyWarehouseBaseData = @"data";


@interface JCModel_MyWarehouseBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyWarehouseBase

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
            self.result = [self objectOrNilForKey:kJCModel_MyWarehouseBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_MyWarehouseBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_MyWarehouseBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_MyWarehouseBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_MyWarehouseData = [dict objectForKey:kJCModel_MyWarehouseBaseData];
    NSMutableArray *parsedJCModel_MyWarehouseData = [NSMutableArray array];
    
    if ([receivedJCModel_MyWarehouseData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyWarehouseData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyWarehouseData addObject:[JCModel_MyWarehouseData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyWarehouseData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyWarehouseData addObject:[JCModel_MyWarehouseData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyWarehouseData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_MyWarehouseData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_MyWarehouseBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_MyWarehouseBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_MyWarehouseBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_MyWarehouseBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_MyWarehouseBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_MyWarehouseBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_MyWarehouseBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_MyWarehouseBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_MyWarehouseBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_MyWarehouseBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_MyWarehouseBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyWarehouseBase *copy = [[JCModel_MyWarehouseBase alloc] init];
    
    
    
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
