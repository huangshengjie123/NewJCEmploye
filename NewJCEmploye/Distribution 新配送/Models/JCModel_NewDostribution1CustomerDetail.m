//
//  JCModel_NewDostribution1CustomerDetail.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1CustomerDetail.h"


NSString *const kJCModel_NewDostribution1CustomerDetailQq = @"qq";
NSString *const kJCModel_NewDostribution1CustomerDetailPhone = @"phone";
NSString *const kJCModel_NewDostribution1CustomerDetailMobile = @"mobile";
NSString *const kJCModel_NewDostribution1CustomerDetailId = @"id";
NSString *const kJCModel_NewDostribution1CustomerDetailWeChat = @"weChat";
NSString *const kJCModel_NewDostribution1CustomerDetailCompany = @"company";
NSString *const kJCModel_NewDostribution1CustomerDetailIncome = @"income";
NSString *const kJCModel_NewDostribution1CustomerDetailEmail = @"email";
NSString *const kJCModel_NewDostribution1CustomerDetailDescription = @"description";
NSString *const kJCModel_NewDostribution1CustomerDetailSex = @"sex";
NSString *const kJCModel_NewDostribution1CustomerDetailInterest = @"interest";


@interface JCModel_NewDostribution1CustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1CustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_NewDostribution1CustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_NewDostribution1CustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_NewDostribution1CustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_NewDostribution1CustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_NewDostribution1CustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_NewDostribution1CustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_NewDostribution1CustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_NewDostribution1CustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_NewDostribution1CustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_NewDostribution1CustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_NewDostribution1CustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1CustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_NewDostribution1CustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_NewDostribution1CustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_NewDostribution1CustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_NewDostribution1CustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_NewDostribution1CustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_NewDostribution1CustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_NewDostribution1CustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_NewDostribution1CustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_NewDostribution1CustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_NewDostribution1CustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_NewDostribution1CustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1CustomerDetail *copy = [[JCModel_NewDostribution1CustomerDetail alloc] init];
    
    
    
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
