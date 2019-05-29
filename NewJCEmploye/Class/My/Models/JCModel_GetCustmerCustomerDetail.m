//
//  JCModel_GetCustmerCustomerDetail.m
//
//  Created by   on 2019/2/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetCustmerCustomerDetail.h"


NSString *const kJCModel_GetCustmerCustomerDetailId = @"id";
NSString *const kJCModel_GetCustmerCustomerDetailDescription = @"description";
NSString *const kJCModel_GetCustmerCustomerDetailPhone = @"phone";
NSString *const kJCModel_GetCustmerCustomerDetailSex = @"sex";
NSString *const kJCModel_GetCustmerCustomerDetailMobile = @"mobile";
NSString *const kJCModel_GetCustmerCustomerDetailCompany = @"company";
NSString *const kJCModel_GetCustmerCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_GetCustmerCustomerDetailIncome = @"income";
NSString *const kJCModel_GetCustmerCustomerDetailBirthday = @"birthday";
NSString *const kJCModel_GetCustmerCustomerDetailQq = @"qq";
NSString *const kJCModel_GetCustmerCustomerDetailEmail = @"email";
NSString *const kJCModel_GetCustmerCustomerDetailInterest = @"interest";


@interface JCModel_GetCustmerCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetCustmerCustomerDetail

@synthesize customerDetailIdentifier = _customerDetailIdentifier;
@synthesize customerDetailDescription = _customerDetailDescription;
@synthesize phone = _phone;
@synthesize sex = _sex;
@synthesize mobile = _mobile;
@synthesize company = _company;
@synthesize weChat = _weChat;
@synthesize income = _income;
@synthesize birthday = _birthday;
@synthesize qq = _qq;
@synthesize email = _email;
@synthesize interest = _interest;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailId fromDictionary:dict] doubleValue];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailDescription fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailPhone fromDictionary:dict];
            self.sex = [[self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailSex fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailMobile fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailCompany fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailWeChat fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailIncome fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailBirthday fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailQq fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailEmail fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_GetCustmerCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_GetCustmerCustomerDetailId];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_GetCustmerCustomerDetailDescription];
    [mutableDict setValue:self.phone forKey:kJCModel_GetCustmerCustomerDetailPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kJCModel_GetCustmerCustomerDetailSex];
    [mutableDict setValue:self.mobile forKey:kJCModel_GetCustmerCustomerDetailMobile];
    [mutableDict setValue:self.company forKey:kJCModel_GetCustmerCustomerDetailCompany];
    [mutableDict setValue:self.weChat forKey:kJCModel_GetCustmerCustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCModel_GetCustmerCustomerDetailIncome];
    [mutableDict setValue:self.birthday forKey:kJCModel_GetCustmerCustomerDetailBirthday];
    [mutableDict setValue:self.qq forKey:kJCModel_GetCustmerCustomerDetailQq];
    [mutableDict setValue:self.email forKey:kJCModel_GetCustmerCustomerDetailEmail];
    [mutableDict setValue:self.interest forKey:kJCModel_GetCustmerCustomerDetailInterest];

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

    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerCustomerDetailId];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailDescription];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailPhone];
    self.sex = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerCustomerDetailSex];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailMobile];
    self.company = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailCompany];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailIncome];
    self.birthday = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailBirthday];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailQq];
    self.email = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailEmail];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_GetCustmerCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_GetCustmerCustomerDetailId];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_GetCustmerCustomerDetailDescription];
    [aCoder encodeObject:_phone forKey:kJCModel_GetCustmerCustomerDetailPhone];
    [aCoder encodeDouble:_sex forKey:kJCModel_GetCustmerCustomerDetailSex];
    [aCoder encodeObject:_mobile forKey:kJCModel_GetCustmerCustomerDetailMobile];
    [aCoder encodeObject:_company forKey:kJCModel_GetCustmerCustomerDetailCompany];
    [aCoder encodeObject:_weChat forKey:kJCModel_GetCustmerCustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCModel_GetCustmerCustomerDetailIncome];
    [aCoder encodeObject:_birthday forKey:kJCModel_GetCustmerCustomerDetailBirthday];
    [aCoder encodeObject:_qq forKey:kJCModel_GetCustmerCustomerDetailQq];
    [aCoder encodeObject:_email forKey:kJCModel_GetCustmerCustomerDetailEmail];
    [aCoder encodeObject:_interest forKey:kJCModel_GetCustmerCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetCustmerCustomerDetail *copy = [[JCModel_GetCustmerCustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.customerDetailIdentifier = self.customerDetailIdentifier;
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.sex = self.sex;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.birthday = [self.birthday copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
    }
    
    return copy;
}


@end
