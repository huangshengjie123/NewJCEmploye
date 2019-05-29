//
//  JCModel_ReturnVisitCustomerDetail.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitCustomerDetail.h"


NSString *const kJCModel_ReturnVisitCustomerDetailId = @"id";
NSString *const kJCModel_ReturnVisitCustomerDetailDescription = @"description";
NSString *const kJCModel_ReturnVisitCustomerDetailPhone = @"phone";
NSString *const kJCModel_ReturnVisitCustomerDetailSex = @"sex";
NSString *const kJCModel_ReturnVisitCustomerDetailMobile = @"mobile";
NSString *const kJCModel_ReturnVisitCustomerDetailCompany = @"company";
NSString *const kJCModel_ReturnVisitCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_ReturnVisitCustomerDetailIncome = @"income";
NSString *const kJCModel_ReturnVisitCustomerDetailBirthday = @"birthday";
NSString *const kJCModel_ReturnVisitCustomerDetailQq = @"qq";
NSString *const kJCModel_ReturnVisitCustomerDetailEmail = @"email";
NSString *const kJCModel_ReturnVisitCustomerDetailInterest = @"interest";


@interface JCModel_ReturnVisitCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitCustomerDetail

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
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailId fromDictionary:dict] doubleValue];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailDescription fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailSex fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailMobile fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailCompany fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailWeChat fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailIncome fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailBirthday fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailQq fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailEmail fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_ReturnVisitCustomerDetailId];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_ReturnVisitCustomerDetailDescription];
    [mutableDict setValue:self.phone forKey:kJCModel_ReturnVisitCustomerDetailPhone];
    [mutableDict setValue:self.sex forKey:kJCModel_ReturnVisitCustomerDetailSex];
    [mutableDict setValue:self.mobile forKey:kJCModel_ReturnVisitCustomerDetailMobile];
    [mutableDict setValue:self.company forKey:kJCModel_ReturnVisitCustomerDetailCompany];
    [mutableDict setValue:self.weChat forKey:kJCModel_ReturnVisitCustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCModel_ReturnVisitCustomerDetailIncome];
    [mutableDict setValue:self.birthday forKey:kJCModel_ReturnVisitCustomerDetailBirthday];
    [mutableDict setValue:self.qq forKey:kJCModel_ReturnVisitCustomerDetailQq];
    [mutableDict setValue:self.email forKey:kJCModel_ReturnVisitCustomerDetailEmail];
    [mutableDict setValue:self.interest forKey:kJCModel_ReturnVisitCustomerDetailInterest];

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

    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitCustomerDetailId];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailDescription];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailSex];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailMobile];
    self.company = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailCompany];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailIncome];
    self.birthday = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailBirthday];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailQq];
    self.email = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailEmail];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_ReturnVisitCustomerDetailId];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_ReturnVisitCustomerDetailDescription];
    [aCoder encodeObject:_phone forKey:kJCModel_ReturnVisitCustomerDetailPhone];
    [aCoder encodeObject:_sex forKey:kJCModel_ReturnVisitCustomerDetailSex];
    [aCoder encodeObject:_mobile forKey:kJCModel_ReturnVisitCustomerDetailMobile];
    [aCoder encodeObject:_company forKey:kJCModel_ReturnVisitCustomerDetailCompany];
    [aCoder encodeObject:_weChat forKey:kJCModel_ReturnVisitCustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCModel_ReturnVisitCustomerDetailIncome];
    [aCoder encodeObject:_birthday forKey:kJCModel_ReturnVisitCustomerDetailBirthday];
    [aCoder encodeObject:_qq forKey:kJCModel_ReturnVisitCustomerDetailQq];
    [aCoder encodeObject:_email forKey:kJCModel_ReturnVisitCustomerDetailEmail];
    [aCoder encodeObject:_interest forKey:kJCModel_ReturnVisitCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitCustomerDetail *copy = [[JCModel_ReturnVisitCustomerDetail alloc] init];
    
    
    
    if (copy) {

        copy.customerDetailIdentifier = self.customerDetailIdentifier;
        copy.customerDetailDescription = [self.customerDetailDescription copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
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
