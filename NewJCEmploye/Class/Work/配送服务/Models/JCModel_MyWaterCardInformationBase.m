//
//  JCModel_MyWaterCardInformationBase.m
//
//  Created by   on 2018/7/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyWaterCardInformationBase.h"
#import "JCModel_MyWaterCardInformationData.h"


NSString *const kJCModel_MyWaterCardInformationBaseResult = @"result";
NSString *const kJCModel_MyWaterCardInformationBaseNum = @"num";
NSString *const kJCModel_MyWaterCardInformationBaseCode = @"code";
NSString *const kJCModel_MyWaterCardInformationBaseMsg = @"msg";
NSString *const kJCModel_MyWaterCardInformationBaseData = @"data";


@interface JCModel_MyWaterCardInformationBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyWaterCardInformationBase

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
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.result = [self objectOrNilForKey:kJCModel_MyWaterCardInformationBaseResult fromDictionary:dict];
        self.num = [self objectOrNilForKey:kJCModel_MyWaterCardInformationBaseNum fromDictionary:dict];
        self.code = [self objectOrNilForKey:kJCModel_MyWaterCardInformationBaseCode fromDictionary:dict];
        self.msg = [self objectOrNilForKey:kJCModel_MyWaterCardInformationBaseMsg fromDictionary:dict];
        NSObject *receivedJCModel_MyWaterCardInformationData = [dict objectForKey:kJCModel_MyWaterCardInformationBaseData];
        NSMutableArray *parsedJCModel_MyWaterCardInformationData = [NSMutableArray array];
        
        if ([receivedJCModel_MyWaterCardInformationData isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedJCModel_MyWaterCardInformationData)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedJCModel_MyWaterCardInformationData addObject:[JCModel_MyWaterCardInformationData modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedJCModel_MyWaterCardInformationData isKindOfClass:[NSDictionary class]])
        {
            [parsedJCModel_MyWaterCardInformationData addObject:[JCModel_MyWaterCardInformationData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyWaterCardInformationData]];
        }
        
        self.data = [NSArray arrayWithArray:parsedJCModel_MyWaterCardInformationData];
        
    }
    
    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_MyWaterCardInformationBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_MyWaterCardInformationBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_MyWaterCardInformationBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_MyWaterCardInformationBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_MyWaterCardInformationBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_MyWaterCardInformationBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_MyWaterCardInformationBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_MyWaterCardInformationBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_MyWaterCardInformationBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_MyWaterCardInformationBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyWaterCardInformationBase *copy = [[JCModel_MyWaterCardInformationBase alloc] init];
    
    
    
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
