//
//  JCModel_ShowReturnVisitCustomerDetail.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitCustomerDetail.h"


NSString *const kJCModel_ShowReturnVisitCustomerDetailQq = @"qq";
NSString *const kJCModel_ShowReturnVisitCustomerDetailPhone = @"phone";
NSString *const kJCModel_ShowReturnVisitCustomerDetailMobile = @"mobile";
NSString *const kJCModel_ShowReturnVisitCustomerDetailId = @"id";
NSString *const kJCModel_ShowReturnVisitCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_ShowReturnVisitCustomerDetailCompany = @"company";
NSString *const kJCModel_ShowReturnVisitCustomerDetailIncome = @"income";
NSString *const kJCModel_ShowReturnVisitCustomerDetailEmail = @"email";
NSString *const kJCModel_ShowReturnVisitCustomerDetailDescription = @"description";
NSString *const kJCModel_ShowReturnVisitCustomerDetailSex = @"sex";
NSString *const kJCModel_ShowReturnVisitCustomerDetailInterest = @"interest";


@interface JCModel_ShowReturnVisitCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_ShowReturnVisitCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_ShowReturnVisitCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_ShowReturnVisitCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_ShowReturnVisitCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_ShowReturnVisitCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_ShowReturnVisitCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_ShowReturnVisitCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_ShowReturnVisitCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_ShowReturnVisitCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_ShowReturnVisitCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_ShowReturnVisitCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_ShowReturnVisitCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_ShowReturnVisitCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_ShowReturnVisitCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_ShowReturnVisitCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_ShowReturnVisitCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_ShowReturnVisitCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_ShowReturnVisitCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_ShowReturnVisitCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_ShowReturnVisitCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_ShowReturnVisitCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_ShowReturnVisitCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitCustomerDetail *copy = [[JCModel_ShowReturnVisitCustomerDetail alloc] init];
    
    
    
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
