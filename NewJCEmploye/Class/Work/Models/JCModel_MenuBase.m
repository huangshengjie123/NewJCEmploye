//
//  JCModel_MenuBase.m
//
//  Created by   on 2018/5/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MenuBase.h"
#import "JCModel_MenuData.h"


NSString *const kJCModel_MenuBaseResult = @"result";
NSString *const kJCModel_MenuBaseNum = @"num";
NSString *const kJCModel_MenuBaseCode = @"code";
NSString *const kJCModel_MenuBaseMsg = @"msg";
NSString *const kJCModel_MenuBaseData = @"data";


@interface JCModel_MenuBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MenuBase

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
            self.result = [self objectOrNilForKey:kJCModel_MenuBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_MenuBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_MenuBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_MenuBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_MenuData = [dict objectForKey:kJCModel_MenuBaseData];
    NSMutableArray *parsedJCModel_MenuData = [NSMutableArray array];
    
    if ([receivedJCModel_MenuData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MenuData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MenuData addObject:[JCModel_MenuData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MenuData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MenuData addObject:[JCModel_MenuData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MenuData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_MenuData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_MenuBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_MenuBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_MenuBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_MenuBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_MenuBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_MenuBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_MenuBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_MenuBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_MenuBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_MenuBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_MenuBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_MenuBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_MenuBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_MenuBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_MenuBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MenuBase *copy = [[JCModel_MenuBase alloc] init];
    
    
    
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
