//
//  JCModel_franchiserItemsBase.m
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserItemsBase.h"
#import "JCModel_franchiserItemsData.h"


NSString *const kJCModel_franchiserItemsBaseResult = @"result";
NSString *const kJCModel_franchiserItemsBaseNum = @"num";
NSString *const kJCModel_franchiserItemsBaseCode = @"code";
NSString *const kJCModel_franchiserItemsBaseMsg = @"msg";
NSString *const kJCModel_franchiserItemsBaseData = @"data";


@interface JCModel_franchiserItemsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserItemsBase

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
            self.result = [self objectOrNilForKey:kJCModel_franchiserItemsBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_franchiserItemsBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_franchiserItemsBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_franchiserItemsBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_franchiserItemsData = [dict objectForKey:kJCModel_franchiserItemsBaseData];
    NSMutableArray *parsedJCModel_franchiserItemsData = [NSMutableArray array];
    
    if ([receivedJCModel_franchiserItemsData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_franchiserItemsData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_franchiserItemsData addObject:[JCModel_franchiserItemsData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_franchiserItemsData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_franchiserItemsData addObject:[JCModel_franchiserItemsData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_franchiserItemsData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_franchiserItemsData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_franchiserItemsBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_franchiserItemsBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_franchiserItemsBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_franchiserItemsBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_franchiserItemsBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_franchiserItemsBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_franchiserItemsBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_franchiserItemsBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_franchiserItemsBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_franchiserItemsBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_franchiserItemsBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserItemsBase *copy = [[JCModel_franchiserItemsBase alloc] init];
    
    
    
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
