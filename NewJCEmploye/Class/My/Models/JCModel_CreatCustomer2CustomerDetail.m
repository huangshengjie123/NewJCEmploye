//
//  JCModel_CreatCustomer2CustomerDetail.m
//
//  Created by   on 2019/1/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CreatCustomer2CustomerDetail.h"


NSString *const kJCModel_CreatCustomer2CustomerDetailQq = @"qq";
NSString *const kJCModel_CreatCustomer2CustomerDetailPhone = @"phone";
NSString *const kJCModel_CreatCustomer2CustomerDetailMobile = @"mobile";
NSString *const kJCModel_CreatCustomer2CustomerDetailWeChat = @"weChat";
NSString *const kJCModel_CreatCustomer2CustomerDetailIncome = @"income";
NSString *const kJCModel_CreatCustomer2CustomerDetailCompany = @"company";
NSString *const kJCModel_CreatCustomer2CustomerDetailEmail = @"email";
NSString *const kJCModel_CreatCustomer2CustomerDetailDescription = @"description";
NSString *const kJCModel_CreatCustomer2CustomerDetailSex = @"sex";
NSString *const kJCModel_CreatCustomer2CustomerDetailInterest = @"interest";
NSString *const kJCModel_CreatCustomer2CustomerDetailBirthday = @"birthday";


@interface JCModel_CreatCustomer2CustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CreatCustomer2CustomerDetail

@synthesize qq = _qq;
@synthesize phone = _phone;
@synthesize mobile = _mobile;
@synthesize weChat = _weChat;
@synthesize income = _income;
@synthesize company = _company;
@synthesize email = _email;
@synthesize birthday = _birthday;

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
            self.qq = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailMobile fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailWeChat fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailIncome fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailCompany fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailInterest fromDictionary:dict];
        self.birthday = [self objectOrNilForKey:kJCModel_CreatCustomer2CustomerDetailBirthday fromDictionary:dict];


    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_CreatCustomer2CustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_CreatCustomer2CustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_CreatCustomer2CustomerDetailMobile];
    [mutableDict setValue:self.weChat forKey:kJCModel_CreatCustomer2CustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCModel_CreatCustomer2CustomerDetailIncome];
    [mutableDict setValue:self.company forKey:kJCModel_CreatCustomer2CustomerDetailCompany];
    [mutableDict setValue:self.email forKey:kJCModel_CreatCustomer2CustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_CreatCustomer2CustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_CreatCustomer2CustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_CreatCustomer2CustomerDetailInterest];
    [mutableDict setValue:self.birthday forKey:kJCModel_CreatCustomer2CustomerDetailBirthday];


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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailMobile];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailIncome];
    self.company = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailCompany];
    self.email = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailInterest];
    self.birthday = [aDecoder decodeObjectForKey:kJCModel_CreatCustomer2CustomerDetailBirthday];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_CreatCustomer2CustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_CreatCustomer2CustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_CreatCustomer2CustomerDetailMobile];
    [aCoder encodeObject:_weChat forKey:kJCModel_CreatCustomer2CustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCModel_CreatCustomer2CustomerDetailIncome];
    [aCoder encodeObject:_company forKey:kJCModel_CreatCustomer2CustomerDetailCompany];
    [aCoder encodeObject:_email forKey:kJCModel_CreatCustomer2CustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_CreatCustomer2CustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_CreatCustomer2CustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_CreatCustomer2CustomerDetailInterest];
    [aCoder encodeObject:_birthday forKey:kJCModel_CreatCustomer2CustomerDetailBirthday];

}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CreatCustomer2CustomerDetail *copy = [[JCModel_CreatCustomer2CustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.qq = [self.qq copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
        copy.birthday = [self.birthday copyWithZone:zone];

    }
    
    return copy;
}


@end
