//
//  JCModel_CreatCustomerCustomerDetail.m
//
//  Created by   on 2019/1/2
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomerCustomerDetail.h"


NSString *const kJCModel_CreatCustomerCustomerDetailQq = @"qq";
NSString *const kJCModel_CreatCustomerCustomerDetailPhone = @"phone";
NSString *const kJCModel_CreatCustomerCustomerDetailMobile = @"mobile";
NSString *const kJCModel_CreatCustomerCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_CreatCustomerCustomerDetailIncome = @"income";
NSString *const kJCModel_CreatCustomerCustomerDetailCompany = @"company";
NSString *const kJCModel_CreatCustomerCustomerDetailBirthday = @"birthday";
NSString *const kJCModel_CreatCustomerCustomerDetailEmail = @"email";
NSString *const kJCModel_CreatCustomerCustomerDetailDescription = @"description";
NSString *const kJCModel_CreatCustomerCustomerDetailSex = @"sex";
NSString *const kJCModel_CreatCustomerCustomerDetailInterest = @"interest";


@interface JCModel_CreatCustomerCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomerCustomerDetail

@synthesize qq = _qq;
@synthesize phone = _phone;
@synthesize mobile = _mobile;
@synthesize weChat = _weChat;
@synthesize income = _income;
@synthesize company = _company;
@synthesize birthday = _birthday;
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
            self.qq = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailMobile fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailWeChat fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailIncome fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailCompany fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailBirthday fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_CreatCustomerCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_CreatCustomerCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_CreatCustomerCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_CreatCustomerCustomerDetailMobile];
    [mutableDict setValue:self.weChat forKey:kJCModel_CreatCustomerCustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCModel_CreatCustomerCustomerDetailIncome];
    [mutableDict setValue:self.company forKey:kJCModel_CreatCustomerCustomerDetailCompany];
    [mutableDict setValue:self.birthday forKey:kJCModel_CreatCustomerCustomerDetailBirthday];
    [mutableDict setValue:self.email forKey:kJCModel_CreatCustomerCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_CreatCustomerCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_CreatCustomerCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_CreatCustomerCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailMobile];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailIncome];
    self.company = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailCompany];
    self.birthday = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailBirthday];
    self.email = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_CreatCustomerCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_CreatCustomerCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_CreatCustomerCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_CreatCustomerCustomerDetailMobile];
    [aCoder encodeObject:_weChat forKey:kJCModel_CreatCustomerCustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCModel_CreatCustomerCustomerDetailIncome];
    [aCoder encodeObject:_company forKey:kJCModel_CreatCustomerCustomerDetailCompany];
    [aCoder encodeObject:_birthday forKey:kJCModel_CreatCustomerCustomerDetailBirthday];
    [aCoder encodeObject:_email forKey:kJCModel_CreatCustomerCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_CreatCustomerCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_CreatCustomerCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_CreatCustomerCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomerCustomerDetail *copy = [[JCModel_CreatCustomerCustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.qq = [self.qq copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.birthday = [self.birthday copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
    }
    
    return copy;
}


@end
