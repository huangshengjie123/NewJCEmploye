//
//  JCModel_DistributionCustomerDetail.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionCustomerDetail.h"


NSString *const kJCModel_DistributionCustomerDetailQq = @"qq";
NSString *const kJCModel_DistributionCustomerDetailPhone = @"phone";
NSString *const kJCModel_DistributionCustomerDetailMobile = @"mobile";
NSString *const kJCModel_DistributionCustomerDetailId = @"id";
NSString *const kJCModel_DistributionCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_DistributionCustomerDetailCompany = @"company";
NSString *const kJCModel_DistributionCustomerDetailIncome = @"income";
NSString *const kJCModel_DistributionCustomerDetailEmail = @"email";
NSString *const kJCModel_DistributionCustomerDetailDescription = @"description";
NSString *const kJCModel_DistributionCustomerDetailSex = @"sex";
NSString *const kJCModel_DistributionCustomerDetailInterest = @"interest";


@interface JCModel_DistributionCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_DistributionCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_DistributionCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_DistributionCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_DistributionCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_DistributionCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_DistributionCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_DistributionCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_DistributionCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_DistributionCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_DistributionCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_DistributionCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_DistributionCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_DistributionCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_DistributionCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_DistributionCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_DistributionCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_DistributionCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_DistributionCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_DistributionCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_DistributionCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_DistributionCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_DistributionCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_DistributionCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_DistributionCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_DistributionCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionCustomerDetail *copy = [[JCModel_DistributionCustomerDetail alloc] init];
    
    
    
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
