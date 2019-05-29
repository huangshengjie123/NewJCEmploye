//
//  JCModel_SellOrderCustomerDetail.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderCustomerDetail.h"


NSString *const kJCModel_SellOrderCustomerDetailQq = @"qq";
NSString *const kJCModel_SellOrderCustomerDetailPhone = @"phone";
NSString *const kJCModel_SellOrderCustomerDetailMobile = @"mobile";
NSString *const kJCModel_SellOrderCustomerDetailId = @"id";
NSString *const kJCModel_SellOrderCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_SellOrderCustomerDetailCompany = @"company";
NSString *const kJCModel_SellOrderCustomerDetailIncome = @"income";
NSString *const kJCModel_SellOrderCustomerDetailEmail = @"email";
NSString *const kJCModel_SellOrderCustomerDetailDescription = @"description";
NSString *const kJCModel_SellOrderCustomerDetailSex = @"sex";
NSString *const kJCModel_SellOrderCustomerDetailInterest = @"interest";


@interface JCModel_SellOrderCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_SellOrderCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_SellOrderCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_SellOrderCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_SellOrderCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_SellOrderCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_SellOrderCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_SellOrderCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_SellOrderCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_SellOrderCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_SellOrderCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_SellOrderCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_SellOrderCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_SellOrderCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_SellOrderCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_SellOrderCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_SellOrderCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_SellOrderCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_SellOrderCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_SellOrderCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_SellOrderCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_SellOrderCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_SellOrderCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_SellOrderCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_SellOrderCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_SellOrderCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderCustomerDetail *copy = [[JCModel_SellOrderCustomerDetail alloc] init];
    
    
    
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
