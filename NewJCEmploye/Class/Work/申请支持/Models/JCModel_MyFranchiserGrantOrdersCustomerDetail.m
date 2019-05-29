//
//  JCModel_MyFranchiserGrantOrdersCustomerDetail.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersCustomerDetail.h"


NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailQq = @"qq";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailPhone = @"phone";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailMobile = @"mobile";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailWeChat = @"weChat";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailCompany = @"company";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailIncome = @"income";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailEmail = @"email";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailDescription = @"description";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailSex = @"sex";
NSString *const kJCModel_MyFranchiserGrantOrdersCustomerDetailInterest = @"interest";


@interface JCModel_MyFranchiserGrantOrdersCustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersCustomerDetail

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
            self.qq = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailQq fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailPhone fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailMobile fromDictionary:dict];
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailId fromDictionary:dict] doubleValue];
            self.weChat = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailWeChat fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailCompany fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailIncome fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailEmail fromDictionary:dict];
            self.customerDetailDescription = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailDescription fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailSex fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qq forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailQq];
    [mutableDict setValue:self.phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailPhone];
    [mutableDict setValue:self.mobile forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailId];
    [mutableDict setValue:self.weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailWeChat];
    [mutableDict setValue:self.company forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailCompany];
    [mutableDict setValue:self.income forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailIncome];
    [mutableDict setValue:self.email forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailEmail];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailDescription];
    [mutableDict setValue:self.sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailSex];
    [mutableDict setValue:self.interest forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailInterest];

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

    self.qq = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailQq];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailPhone];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailMobile];
    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailId];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailWeChat];
    self.company = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailCompany];
    self.income = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailIncome];
    self.email = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailEmail];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailDescription];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailSex];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qq forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailQq];
    [aCoder encodeObject:_phone forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailPhone];
    [aCoder encodeObject:_mobile forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailMobile];
    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailId];
    [aCoder encodeObject:_weChat forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailWeChat];
    [aCoder encodeObject:_company forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailCompany];
    [aCoder encodeObject:_income forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailIncome];
    [aCoder encodeObject:_email forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailEmail];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailDescription];
    [aCoder encodeObject:_sex forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailSex];
    [aCoder encodeObject:_interest forKey:kJCModel_MyFranchiserGrantOrdersCustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersCustomerDetail *copy = [[JCModel_MyFranchiserGrantOrdersCustomerDetail alloc] init];
    
    
    
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
