//
//  JCModel_DepartmentBase.m
//
//  Created by   on 2018/4/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DepartmentBase.h"
#import "JCModel_DepartmentData.h"


NSString *const kJCModel_DepartmentBaseResult = @"result";
NSString *const kJCModel_DepartmentBaseNum    = @"num";
NSString *const kJCModel_DepartmentBaseCode   = @"code";
NSString *const kJCModel_DepartmentBaseMsg    = @"msg";
NSString *const kJCModel_DepartmentBaseData   = @"data";


@interface JCModel_DepartmentBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DepartmentBase

@synthesize result = _result;
@synthesize num    = _num;
@synthesize code   = _code;
@synthesize msg    = _msg;
@synthesize data   = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.result = [self objectOrNilForKey:kJCModel_DepartmentBaseResult fromDictionary:dict];
        self.num = [self objectOrNilForKey:kJCModel_DepartmentBaseNum fromDictionary:dict];
        self.code = [self objectOrNilForKey:kJCModel_DepartmentBaseCode fromDictionary:dict];
        self.msg = [self objectOrNilForKey:kJCModel_DepartmentBaseMsg fromDictionary:dict];
        
        
        NSObject *receivedJCModel_DepartmentData = [dict objectForKey:kJCModel_DepartmentBaseData];
        NSMutableArray *parsedJCModel_DepartmentData = [NSMutableArray array];
        
        if ([receivedJCModel_DepartmentData isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedJCModel_DepartmentData)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedJCModel_DepartmentData addObject:[JCModel_DepartmentData modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedJCModel_DepartmentData isKindOfClass:[NSDictionary class]])
        {
            [parsedJCModel_DepartmentData addObject:[JCModel_DepartmentData modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DepartmentData]];
        }
        
        self.data = [NSArray arrayWithArray:parsedJCModel_DepartmentData];
        
    }
    
    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_DepartmentBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_DepartmentBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_DepartmentBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_DepartmentBaseMsg];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data)
    {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)])
        {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else
        {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kJCModel_DepartmentBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_DepartmentBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_DepartmentBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_DepartmentBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_DepartmentBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_DepartmentBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_DepartmentBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_DepartmentBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_DepartmentBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_DepartmentBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_DepartmentBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_DepartmentBase *copy = [[JCModel_DepartmentBase alloc] init];
    if (copy)
    {
        copy.result = [self.result copyWithZone:zone];
        copy.num    = (id)[self.num copyWithZone:zone];
        copy.code   = [self.code copyWithZone:zone];
        copy.msg    = (id)[self.msg copyWithZone:zone];
        copy.data   = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
