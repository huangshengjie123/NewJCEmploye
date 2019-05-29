//
//  JCModel_GroupObservers2Base.m
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupObservers2Base.h"
#import "JCModel_GroupObservers2Data.h"


NSString *const kJCModel_GroupObservers2BaseResult = @"result";
NSString *const kJCModel_GroupObservers2BaseNum = @"num";
NSString *const kJCModel_GroupObservers2BaseCode = @"code";
NSString *const kJCModel_GroupObservers2BaseMsg = @"msg";
NSString *const kJCModel_GroupObservers2BaseData = @"data";


@interface JCModel_GroupObservers2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupObservers2Base

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
            self.result = [self objectOrNilForKey:kJCModel_GroupObservers2BaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_GroupObservers2BaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_GroupObservers2BaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_GroupObservers2BaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_GroupObservers2Data = [dict objectForKey:kJCModel_GroupObservers2BaseData];
    NSMutableArray *parsedJCModel_GroupObservers2Data = [NSMutableArray array];
    
    if ([receivedJCModel_GroupObservers2Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GroupObservers2Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GroupObservers2Data addObject:[JCModel_GroupObservers2Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GroupObservers2Data isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GroupObservers2Data addObject:[JCModel_GroupObservers2Data modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GroupObservers2Data]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_GroupObservers2Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_GroupObservers2BaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_GroupObservers2BaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_GroupObservers2BaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_GroupObservers2BaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_GroupObservers2BaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2BaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2BaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2BaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2BaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2BaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_GroupObservers2BaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_GroupObservers2BaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_GroupObservers2BaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_GroupObservers2BaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_GroupObservers2BaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupObservers2Base *copy = [[JCModel_GroupObservers2Base alloc] init];
    
    
    
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
