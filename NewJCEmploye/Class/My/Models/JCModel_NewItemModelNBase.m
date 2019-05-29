//
//  JCModel_NewItemModelNBase.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewItemModelNBase.h"
#import "JCModel_NewItemModelNData.h"


NSString *const kJCModel_NewItemModelNBaseResult = @"result";
NSString *const kJCModel_NewItemModelNBaseNum = @"num";
NSString *const kJCModel_NewItemModelNBaseCode = @"code";
NSString *const kJCModel_NewItemModelNBaseMsg = @"msg";
NSString *const kJCModel_NewItemModelNBaseData = @"data";


@interface JCModel_NewItemModelNBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewItemModelNBase

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
            self.result = [self objectOrNilForKey:kJCModel_NewItemModelNBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_NewItemModelNBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_NewItemModelNBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_NewItemModelNBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_NewItemModelNData = [dict objectForKey:kJCModel_NewItemModelNBaseData];
    NSMutableArray *parsedJCModel_NewItemModelNData = [NSMutableArray array];
    
    if ([receivedJCModel_NewItemModelNData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewItemModelNData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewItemModelNData addObject:[JCModel_NewItemModelNData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewItemModelNData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewItemModelNData addObject:[JCModel_NewItemModelNData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewItemModelNData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_NewItemModelNData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_NewItemModelNBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_NewItemModelNBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_NewItemModelNBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_NewItemModelNBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_NewItemModelNBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_NewItemModelNBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_NewItemModelNBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_NewItemModelNBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_NewItemModelNBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_NewItemModelNBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewItemModelNBase *copy = [[JCModel_NewItemModelNBase alloc] init];
    
    
    
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
