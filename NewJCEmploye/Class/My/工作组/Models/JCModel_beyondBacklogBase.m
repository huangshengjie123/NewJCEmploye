//
//  JCModel_beyondBacklogBase.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_beyondBacklogBase.h"
#import "JCModel_beyondBacklogData.h"


NSString *const kJCModel_beyondBacklogBaseResult = @"result";
NSString *const kJCModel_beyondBacklogBaseNum = @"num";
NSString *const kJCModel_beyondBacklogBaseCode = @"code";
NSString *const kJCModel_beyondBacklogBaseMsg = @"msg";
NSString *const kJCModel_beyondBacklogBaseData = @"data";


@interface JCModel_beyondBacklogBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_beyondBacklogBase

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
            self.result = [self objectOrNilForKey:kJCModel_beyondBacklogBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_beyondBacklogBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_beyondBacklogBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_beyondBacklogBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_beyondBacklogData = [dict objectForKey:kJCModel_beyondBacklogBaseData];
    NSMutableArray *parsedJCModel_beyondBacklogData = [NSMutableArray array];
    
    if ([receivedJCModel_beyondBacklogData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_beyondBacklogData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_beyondBacklogData addObject:[JCModel_beyondBacklogData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_beyondBacklogData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_beyondBacklogData addObject:[JCModel_beyondBacklogData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_beyondBacklogData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_beyondBacklogData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_beyondBacklogBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_beyondBacklogBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_beyondBacklogBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_beyondBacklogBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_beyondBacklogBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_beyondBacklogBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_beyondBacklogBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_beyondBacklogBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_beyondBacklogBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_beyondBacklogBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_beyondBacklogBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_beyondBacklogBase *copy = [[JCModel_beyondBacklogBase alloc] init];
    
    
    
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
