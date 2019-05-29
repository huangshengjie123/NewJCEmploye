//
//  JCModel_MyFranchiserGrantOrdersBase.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersBase.h"
#import "JCModel_MyFranchiserGrantOrdersData.h"


NSString *const kJCModel_MyFranchiserGrantOrdersBaseResult = @"result";
NSString *const kJCModel_MyFranchiserGrantOrdersBaseNum = @"num";
NSString *const kJCModel_MyFranchiserGrantOrdersBaseCode = @"code";
NSString *const kJCModel_MyFranchiserGrantOrdersBaseMsg = @"msg";
NSString *const kJCModel_MyFranchiserGrantOrdersBaseData = @"data";


@interface JCModel_MyFranchiserGrantOrdersBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersBase

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
            self.result = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersBaseResult fromDictionary:dict];
            self.num = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersBaseNum fromDictionary:dict];
            self.code = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersBaseCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersBaseMsg fromDictionary:dict];
            self.data = [JCModel_MyFranchiserGrantOrdersData modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_MyFranchiserGrantOrdersBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_MyFranchiserGrantOrdersBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_MyFranchiserGrantOrdersBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_MyFranchiserGrantOrdersBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersBaseData];

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

    self.result = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kJCModel_MyFranchiserGrantOrdersBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_MyFranchiserGrantOrdersBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_MyFranchiserGrantOrdersBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_MyFranchiserGrantOrdersBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_MyFranchiserGrantOrdersBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersBase *copy = [[JCModel_MyFranchiserGrantOrdersBase alloc] init];
    
    
    
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
