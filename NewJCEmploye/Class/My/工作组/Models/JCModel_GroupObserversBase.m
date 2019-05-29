//
//  JCModel_GroupObserversBase.m
//
//  Created by   on 2018/12/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupObserversBase.h"
#import "JCModel_GroupObserversData.h"


NSString *const kJCModel_GroupObserversBaseResult = @"result";
NSString *const kJCModel_GroupObserversBaseNum = @"num";
NSString *const kJCModel_GroupObserversBaseCode = @"code";
NSString *const kJCModel_GroupObserversBaseMsg = @"msg";
NSString *const kJCModel_GroupObserversBaseData = @"data";


@interface JCModel_GroupObserversBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupObserversBase

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
            self.result = [self objectOrNilForKey:kJCModel_GroupObserversBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_GroupObserversBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_GroupObserversBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_GroupObserversBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_GroupObserversData = [dict objectForKey:kJCModel_GroupObserversBaseData];
    NSMutableArray *parsedJCModel_GroupObserversData = [NSMutableArray array];
    
    if ([receivedJCModel_GroupObserversData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GroupObserversData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GroupObserversData addObject:[JCModel_GroupObserversData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GroupObserversData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GroupObserversData addObject:[JCModel_GroupObserversData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GroupObserversData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_GroupObserversData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_GroupObserversBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_GroupObserversBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_GroupObserversBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_GroupObserversBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_GroupObserversBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_GroupObserversBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_GroupObserversBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_GroupObserversBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_GroupObserversBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_GroupObserversBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_GroupObserversBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_GroupObserversBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_GroupObserversBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_GroupObserversBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_GroupObserversBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupObserversBase *copy = [[JCModel_GroupObserversBase alloc] init];
    
    
    
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
