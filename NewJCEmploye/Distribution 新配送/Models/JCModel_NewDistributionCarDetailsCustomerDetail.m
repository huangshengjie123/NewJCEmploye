//
//  JCModel_NewDistributionCarDetailsCustomerDetail.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsCustomerDetail.h"


NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailQq = @"qq";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailPhone = @"phone";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailMobile = @"mobile";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailId = @"id";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailCompany = @"company";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailIncome = @"income";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailEmail = @"email";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailDescription = @"description";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailSex = @"sex";
NSString *const kJCModel_NewDistributionCarDetailsCustomerDetailInterest = @"interest";


@interface JCModel_NewDistributionCarDetailsCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_NewDistributionCarDetailsCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_NewDistributionCarDetailsCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_NewDistributionCarDetailsCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_NewDistributionCarDetailsCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_NewDistributionCarDetailsCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_NewDistributionCarDetailsCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_NewDistributionCarDetailsCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_NewDistributionCarDetailsCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_NewDistributionCarDetailsCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_NewDistributionCarDetailsCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_NewDistributionCarDetailsCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_NewDistributionCarDetailsCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_NewDistributionCarDetailsCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_NewDistributionCarDetailsCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_NewDistributionCarDetailsCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_NewDistributionCarDetailsCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_NewDistributionCarDetailsCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_NewDistributionCarDetailsCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_NewDistributionCarDetailsCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_NewDistributionCarDetailsCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_NewDistributionCarDetailsCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_NewDistributionCarDetailsCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsCustomerDetail *copy = [[JCModel_NewDistributionCarDetailsCustomerDetail alloc] init];
    
    
    
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
