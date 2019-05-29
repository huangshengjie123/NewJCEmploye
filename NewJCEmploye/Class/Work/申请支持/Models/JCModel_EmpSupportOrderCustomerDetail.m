//
//  JCModel_EmpSupportOrderCustomerDetail.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderCustomerDetail.h"


NSString *const kJCModel_EmpSupportOrderCustomerDetailQq = @"qq";
NSString *const kJCModel_EmpSupportOrderCustomerDetailPhone = @"phone";
NSString *const kJCModel_EmpSupportOrderCustomerDetailMobile = @"mobile";
NSString *const kJCModel_EmpSupportOrderCustomerDetailId = @"id";
NSString *const kJCModel_EmpSupportOrderCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_EmpSupportOrderCustomerDetailCompany = @"company";
NSString *const kJCModel_EmpSupportOrderCustomerDetailIncome = @"income";
NSString *const kJCModel_EmpSupportOrderCustomerDetailEmail = @"email";
NSString *const kJCModel_EmpSupportOrderCustomerDetailDescription = @"description";
NSString *const kJCModel_EmpSupportOrderCustomerDetailSex = @"sex";
NSString *const kJCModel_EmpSupportOrderCustomerDetailInterest = @"interest";


@interface JCModel_EmpSupportOrderCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderCustomerDetail

@synthesize qq = _qq;
@synthesize phone = _phone;
@synthesize mobile = _mobile;
@synthesize customerDetailIdentifier = _customerDetailIdentifier;
@synthesize weChat = _weChat;
@synthesize company = _company;
@synthesize income = _income;
@synthesize email = _email;
@synthesize customerDetailDescription = _customerDetailDescription;
@synthesize sex = _sex;
@synthesize interest = _interest;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qq = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_EmpSupportOrderCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_EmpSupportOrderCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpSupportOrderCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_EmpSupportOrderCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_EmpSupportOrderCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_EmpSupportOrderCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_EmpSupportOrderCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_EmpSupportOrderCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_EmpSupportOrderCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_EmpSupportOrderCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_EmpSupportOrderCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_EmpSupportOrderCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_EmpSupportOrderCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_EmpSupportOrderCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_EmpSupportOrderCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_EmpSupportOrderCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_EmpSupportOrderCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_EmpSupportOrderCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_EmpSupportOrderCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_EmpSupportOrderCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_EmpSupportOrderCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_EmpSupportOrderCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_EmpSupportOrderCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderCustomerDetail *copy = [[JCModel_EmpSupportOrderCustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.qq = [self.qq copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.customerDetailIdentifier = self.customerDetailIdentifier;
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
    }
    
    return copy;
}


@end
