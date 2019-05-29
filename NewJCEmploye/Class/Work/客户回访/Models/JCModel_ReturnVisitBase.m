//
//  JCModel_ReturnVisitBase.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitBase.h"
#import "JCModel_ReturnVisitData.h"


NSString *const kJCModel_ReturnVisitBaseResult = @"result";
NSString *const kJCModel_ReturnVisitBaseNum = @"num";
NSString *const kJCModel_ReturnVisitBaseCode = @"code";
NSString *const kJCModel_ReturnVisitBaseMsg = @"msg";
NSString *const kJCModel_ReturnVisitBaseData = @"data";


@interface JCModel_ReturnVisitBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitBase

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
            self.result = [self objectOrNilForKey:kJCModel_ReturnVisitBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ReturnVisitBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ReturnVisitBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ReturnVisitBaseMsg fromDictionary:dict];
            self.data = [JCModel_ReturnVisitData modelObjectWithDictionary:[dict objectForKey:kJCModel_ReturnVisitBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ReturnVisitBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ReturnVisitBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ReturnVisitBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ReturnVisitBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_ReturnVisitBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ReturnVisitBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ReturnVisitBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ReturnVisitBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ReturnVisitBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ReturnVisitBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitBase *copy = [[JCModel_ReturnVisitBase alloc] init];
    
    
    
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
