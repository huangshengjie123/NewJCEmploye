//
//  JCModel_DepartmentCountBase.m
//
//  Created by   on 2018/4/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentCountBase.h"
#import "JCModel_DepartmentCountData.h"


NSString *const kJCModel_DepartmentCountBaseResult = @"result";
NSString *const kJCModel_DepartmentCountBaseNum = @"num";
NSString *const kJCModel_DepartmentCountBaseCode = @"code";
NSString *const kJCModel_DepartmentCountBaseMsg = @"msg";
NSString *const kJCModel_DepartmentCountBaseData = @"data";


@interface JCModel_DepartmentCountBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentCountBase

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
            self.result = [self objectOrNilForKey:kJCModel_DepartmentCountBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_DepartmentCountBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_DepartmentCountBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_DepartmentCountBaseMsg fromDictionary:dict];
    NSObject *receivedJCModel_DepartmentCountData = [dict objectForKey:kJCModel_DepartmentCountBaseData];
    NSMutableArray *parsedJCModel_DepartmentCountData = [NSMutableArray array];
    
    if ([receivedJCModel_DepartmentCountData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DepartmentCountData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DepartmentCountData addObject:[JCModel_DepartmentCountData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DepartmentCountData isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DepartmentCountData addObject:[JCModel_DepartmentCountData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DepartmentCountData]];
    }

    self.data = [NSArray arrayWithArray:parsedJCModel_DepartmentCountData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_DepartmentCountBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_DepartmentCountBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_DepartmentCountBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_DepartmentCountBaseMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_DepartmentCountBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_DepartmentCountBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_DepartmentCountBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_DepartmentCountBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_DepartmentCountBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_DepartmentCountBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_DepartmentCountBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DepartmentCountBase *copy = [[JCModel_DepartmentCountBase alloc] init];
    
    
    
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
