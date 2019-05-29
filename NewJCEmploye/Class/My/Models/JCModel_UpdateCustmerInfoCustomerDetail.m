//
//  JCModel_UpdateCustmerInfoCustomerDetail.m
//
//  Created by   on 2018/8/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UpdateCustmerInfoCustomerDetail.h"


NSString *const kJCModel_UpdateCustmerInfoCustomerDetailQq = @"qq";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailMobile = @"mobile";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailIncome = @"income";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailCompany = @"company";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailEmail = @"email";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailDescription = @"description";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailSex = @"sex";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailInterest = @"interest";
NSString *const kJCModel_UpdateCustmerInfoCustomerDetailAreaId = @"areaId";

@interface JCModel_UpdateCustmerInfoCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UpdateCustmerInfoCustomerDetail

@synthesize qq = _qq;
@synthesize mobile = _mobile;
@synthesize weChat = _weChat;
@synthesize income = _income;
@synthesize company = _company;
@synthesize email = _email;
@synthesize customerDetailDescription = _customerDetailDescription;
@synthesize sex = _sex;
@synthesize interest = _interest;
@synthesize areaId = _areaId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.qq = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailQq fromDictionary:dict];
        self.mobile = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailMobile fromDictionary:dict];
        self.weChat = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailWeChat fromDictionary:dict];
        self.income = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailIncome fromDictionary:dict];
        self.company = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailCompany fromDictionary:dict];
        self.email = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailEmail fromDictionary:dict];
        self.customerDetailDescription = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailDescription fromDictionary:dict];
        self.sex = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailSex fromDictionary:dict];
        self.interest = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailInterest fromDictionary:dict];
        self.areaId = [self objectOrNilForKey:kJCModel_UpdateCustmerInfoCustomerDetailAreaId fromDictionary:dict];
        
        

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_UpdateCustmerInfoCustomerDetailQq];
    [mutableDict setValue:self.mobile forKey:kJCModel_UpdateCustmerInfoCustomerDetailMobile];
    [mutableDict setValue:self.weChat forKey:kJCModel_UpdateCustmerInfoCustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCModel_UpdateCustmerInfoCustomerDetailIncome];
    [mutableDict setValue:self.company forKey:kJCModel_UpdateCustmerInfoCustomerDetailCompany];
    [mutableDict setValue:self.email forKey:kJCModel_UpdateCustmerInfoCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_UpdateCustmerInfoCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_UpdateCustmerInfoCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_UpdateCustmerInfoCustomerDetailInterest];
    [mutableDict setValue:self.areaId forKey:kJCModel_UpdateCustmerInfoCustomerDetailAreaId];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailQq];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailMobile];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailIncome];
    self.company = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailCompany];
    self.email = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailInterest];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_UpdateCustmerInfoCustomerDetailAreaId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_UpdateCustmerInfoCustomerDetailQq];
    [aCoder encodeObject:_mobile forKey:kJCModel_UpdateCustmerInfoCustomerDetailMobile];
    [aCoder encodeObject:_weChat forKey:kJCModel_UpdateCustmerInfoCustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCModel_UpdateCustmerInfoCustomerDetailIncome];
    [aCoder encodeObject:_company forKey:kJCModel_UpdateCustmerInfoCustomerDetailCompany];
    [aCoder encodeObject:_email forKey:kJCModel_UpdateCustmerInfoCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_UpdateCustmerInfoCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_UpdateCustmerInfoCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_UpdateCustmerInfoCustomerDetailInterest];
    [aCoder encodeObject:_areaId forKey:kJCModel_UpdateCustmerInfoCustomerDetailAreaId];
    
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UpdateCustmerInfoCustomerDetail *copy = [[JCModel_UpdateCustmerInfoCustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.qq = [self.qq copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        
    }
    
    return copy;
}


@end
