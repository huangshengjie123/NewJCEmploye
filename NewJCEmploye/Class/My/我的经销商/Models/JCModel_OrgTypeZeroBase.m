//
//  JCModel_OrgTypeZeroBase.m
//
//  Created by   on 2018/9/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OrgTypeZeroBase.h"
#import "JCModel_OrgTypeZeroData.h"


NSString *const kJCModel_OrgTypeZeroBaseResult = @"result";
NSString *const kJCModel_OrgTypeZeroBaseNum = @"num";
NSString *const kJCModel_OrgTypeZeroBaseCode = @"code";
NSString *const kJCModel_OrgTypeZeroBaseMsg = @"msg";
NSString *const kJCModel_OrgTypeZeroBaseData = @"data";


@interface JCModel_OrgTypeZeroBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OrgTypeZeroBase

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
            self.result = [self objectOrNilForKey:kJCModel_OrgTypeZeroBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_OrgTypeZeroBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_OrgTypeZeroBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_OrgTypeZeroBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_OrgTypeZeroData = [dict objectForKey:kJCModel_OrgTypeZeroBaseData];
    NSMutableArray *parsedJCModel_OrgTypeZeroData = [NSMutableArray array];
    
    if ([receivedJCModel_OrgTypeZeroData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_OrgTypeZeroData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_OrgTypeZeroData addObject:[JCModel_OrgTypeZeroData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_OrgTypeZeroData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_OrgTypeZeroData addObject:[JCModel_OrgTypeZeroData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_OrgTypeZeroData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_OrgTypeZeroData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_OrgTypeZeroBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_OrgTypeZeroBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_OrgTypeZeroBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_OrgTypeZeroBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_OrgTypeZeroBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_OrgTypeZeroBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_OrgTypeZeroBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_OrgTypeZeroBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_OrgTypeZeroBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_OrgTypeZeroBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_OrgTypeZeroBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OrgTypeZeroBase *copy = [[JCModel_OrgTypeZeroBase alloc] init];
    
    
    
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
