//
//  JCModel_BulletinBase.m
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BulletinBase.h"
#import "JCModel_BulletinData.h"


NSString *const kJCModel_BulletinBaseResult = @"result";
NSString *const kJCModel_BulletinBaseNum = @"num";
NSString *const kJCModel_BulletinBaseCode = @"code";
NSString *const kJCModel_BulletinBaseMsg = @"msg";
NSString *const kJCModel_BulletinBaseData = @"data";


@interface JCModel_BulletinBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BulletinBase

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
            self.result = [self objectOrNilForKey:kJCModel_BulletinBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_BulletinBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_BulletinBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_BulletinBaseMsg fromDictionary:dict];
            self.data = [JCModel_BulletinData modelObjectWithDictionary:[dict objectForKey:kJCModel_BulletinBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_BulletinBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_BulletinBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_BulletinBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_BulletinBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_BulletinBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_BulletinBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_BulletinBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_BulletinBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_BulletinBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_BulletinBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_BulletinBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_BulletinBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_BulletinBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_BulletinBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_BulletinBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BulletinBase *copy = [[JCModel_BulletinBase alloc] init];
    
    
    
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
