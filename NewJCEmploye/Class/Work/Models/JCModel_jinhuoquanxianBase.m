//
//  JCModel_jinhuoquanxianBase.m
//
//  Created by   on 2018/10/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_jinhuoquanxianBase.h"
#import "JCModel_jinhuoquanxianData.h"


NSString *const kJCModel_jinhuoquanxianBaseResult = @"result";
NSString *const kJCModel_jinhuoquanxianBaseNum = @"num";
NSString *const kJCModel_jinhuoquanxianBaseCode = @"code";
NSString *const kJCModel_jinhuoquanxianBaseMsg = @"msg";
NSString *const kJCModel_jinhuoquanxianBaseData = @"data";


@interface JCModel_jinhuoquanxianBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_jinhuoquanxianBase

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
            self.result = [self objectOrNilForKey:kJCModel_jinhuoquanxianBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_jinhuoquanxianBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_jinhuoquanxianBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_jinhuoquanxianBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_jinhuoquanxianData = [dict objectForKey:kJCModel_jinhuoquanxianBaseData];
    NSMutableArray *parsedJCModel_jinhuoquanxianData = [NSMutableArray array];
    
    if ([receivedJCModel_jinhuoquanxianData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_jinhuoquanxianData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_jinhuoquanxianData addObject:[JCModel_jinhuoquanxianData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_jinhuoquanxianData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_jinhuoquanxianData addObject:[JCModel_jinhuoquanxianData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_jinhuoquanxianData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_jinhuoquanxianData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_jinhuoquanxianBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_jinhuoquanxianBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_jinhuoquanxianBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_jinhuoquanxianBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_jinhuoquanxianBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_jinhuoquanxianBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_jinhuoquanxianBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_jinhuoquanxianBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_jinhuoquanxianBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_jinhuoquanxianBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_jinhuoquanxianBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_jinhuoquanxianBase *copy = [[JCModel_jinhuoquanxianBase alloc] init];
    
    
    
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
