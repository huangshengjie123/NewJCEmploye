//
//  JCModel_ShowReturnVisitBase.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitBase.h"
#import "JCModel_ShowReturnVisitData.h"


NSString *const kJCModel_ShowReturnVisitBaseResult = @"result";
NSString *const kJCModel_ShowReturnVisitBaseNum = @"num";
NSString *const kJCModel_ShowReturnVisitBaseCode = @"code";
NSString *const kJCModel_ShowReturnVisitBaseMsg = @"msg";
NSString *const kJCModel_ShowReturnVisitBaseData = @"data";


@interface JCModel_ShowReturnVisitBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitBase

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
            self.result = [self objectOrNilForKey:kJCModel_ShowReturnVisitBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_ShowReturnVisitBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_ShowReturnVisitBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_ShowReturnVisitBaseMsg fromDictionary:dict];
            self.data = [JCModel_ShowReturnVisitData modelObjectWithDictionary:[dict objectForKey:kJCModel_ShowReturnVisitBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_ShowReturnVisitBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_ShowReturnVisitBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_ShowReturnVisitBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_ShowReturnVisitBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_ShowReturnVisitBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_ShowReturnVisitBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_ShowReturnVisitBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_ShowReturnVisitBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_ShowReturnVisitBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_ShowReturnVisitBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitBase *copy = [[JCModel_ShowReturnVisitBase alloc] init];
    
    
    
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
