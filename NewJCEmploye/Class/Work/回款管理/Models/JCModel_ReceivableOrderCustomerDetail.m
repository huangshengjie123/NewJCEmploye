//
//  JCModel_ReceivableOrderCustomerDetail.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderCustomerDetail.h"


NSString *const kJCModel_ReceivableOrderCustomerDetailQq = @"qq";
NSString *const kJCModel_ReceivableOrderCustomerDetailPhone = @"phone";
NSString *const kJCModel_ReceivableOrderCustomerDetailMobile = @"mobile";
NSString *const kJCModel_ReceivableOrderCustomerDetailId = @"id";
NSString *const kJCModel_ReceivableOrderCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_ReceivableOrderCustomerDetailCompany = @"company";
NSString *const kJCModel_ReceivableOrderCustomerDetailIncome = @"income";
NSString *const kJCModel_ReceivableOrderCustomerDetailEmail = @"email";
NSString *const kJCModel_ReceivableOrderCustomerDetailDescription = @"description";
NSString *const kJCModel_ReceivableOrderCustomerDetailSex = @"sex";
NSString *const kJCModel_ReceivableOrderCustomerDetailInterest = @"interest";


@interface JCModel_ReceivableOrderCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_ReceivableOrderCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_ReceivableOrderCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_ReceivableOrderCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_ReceivableOrderCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_ReceivableOrderCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_ReceivableOrderCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_ReceivableOrderCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_ReceivableOrderCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_ReceivableOrderCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_ReceivableOrderCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_ReceivableOrderCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_ReceivableOrderCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_ReceivableOrderCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_ReceivableOrderCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_ReceivableOrderCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_ReceivableOrderCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_ReceivableOrderCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_ReceivableOrderCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_ReceivableOrderCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_ReceivableOrderCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_ReceivableOrderCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_ReceivableOrderCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderCustomerDetail *copy = [[JCModel_ReceivableOrderCustomerDetail alloc] init];
    
    
    
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
