//
//  JCModel_inventoryWarningBase.m
//  NewJCEmploye
//
//  Created by 张晓光 on 2019/5/23.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCModel_inventoryWarningBase.h"
#import "JCModel_inventoryWarningData.h"


NSString *const kJCModel_inventoryWarningBaseResult = @"result";
NSString *const kJCModel_inventoryWarningBaseNum = @"num";
NSString *const kJCModel_inventoryWarningBaseCode = @"code";
NSString *const kJCModel_inventoryWarningBaseMsg = @"msg";
NSString *const kJCModel_inventoryWarningBaseData = @"data";


@interface JCModel_inventoryWarningBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inventoryWarningBase

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
        self.result = [self objectOrNilForKey:kJCModel_inventoryWarningBaseResult fromDictionary:dict];
        self.num = [self objectOrNilForKey:kJCModel_inventoryWarningBaseNum fromDictionary:dict];
        self.code = [self objectOrNilForKey:kJCModel_inventoryWarningBaseCode fromDictionary:dict];
        self.msg = [self objectOrNilForKey:kJCModel_inventoryWarningBaseMsg fromDictionary:dict];
        self.data = [JCModel_inventoryWarningData modelObjectWithDictionary:[dict objectForKey:kJCModel_inventoryWarningBaseData]];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kJCModel_inventoryWarningBaseResult];
    [mutableDict setValue:self.num forKey:kJCModel_inventoryWarningBaseNum];
    [mutableDict setValue:self.code forKey:kJCModel_inventoryWarningBaseCode];
    [mutableDict setValue:self.msg forKey:kJCModel_inventoryWarningBaseMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJCModel_inventoryWarningBaseData];
    
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
    
    self.result = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningBaseResult];
    self.num = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningBaseNum];
    self.code = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningBaseCode];
    self.msg = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningBaseMsg];
    self.data = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_result forKey:kJCModel_inventoryWarningBaseResult];
    [aCoder encodeObject:_num forKey:kJCModel_inventoryWarningBaseNum];
    [aCoder encodeObject:_code forKey:kJCModel_inventoryWarningBaseCode];
    [aCoder encodeObject:_msg forKey:kJCModel_inventoryWarningBaseMsg];
    [aCoder encodeObject:_data forKey:kJCModel_inventoryWarningBaseData];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inventoryWarningBase *copy = [[JCModel_inventoryWarningBase alloc] init];
    
    
    
    if (copy) {
        
        copy.result = [self.result copyWithZone:zone];
        copy.num = (id)[self.num copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = (id)[self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}
@end
