//
//  JCModel_searchDetailsOutputFBase.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFBase.h"
#import "JCModel_searchDetailsOutputFData.h"


NSString *const kJCModel_searchDetailsOutputFBaseResult = @"result";
NSString *const kJCModel_searchDetailsOutputFBaseNum = @"num";
NSString *const kJCModel_searchDetailsOutputFBaseCode = @"code";
NSString *const kJCModel_searchDetailsOutputFBaseMsg = @"msg";
NSString *const kJCModel_searchDetailsOutputFBaseData = @"data";


@interface JCModel_searchDetailsOutputFBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFBase

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
            self.result = [self objectOrNilForKey:kJCModel_searchDetailsOutputFBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_searchDetailsOutputFBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_searchDetailsOutputFBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_searchDetailsOutputFBaseMsg fromDictionary:dict];
            self.data = [JCModel_searchDetailsOutputFData modelObjectWithDictionary:[dict objectForKey:kJCModel_searchDetailsOutputFBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_searchDetailsOutputFBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_searchDetailsOutputFBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_searchDetailsOutputFBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_searchDetailsOutputFBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_searchDetailsOutputFBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_searchDetailsOutputFBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_searchDetailsOutputFBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_searchDetailsOutputFBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_searchDetailsOutputFBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_searchDetailsOutputFBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFBase *copy = [[JCModel_searchDetailsOutputFBase alloc] init];
    
    
    
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
