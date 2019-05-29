//
//  JCmodel_newCustomer2CustomerDetail.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2CustomerDetail.h"


NSString *const kJCmodel_newCustomer2CustomerDetailId = @"id";
NSString *const kJCmodel_newCustomer2CustomerDetailDescription = @"description";
NSString *const kJCmodel_newCustomer2CustomerDetailPhone = @"phone";
NSString *const kJCmodel_newCustomer2CustomerDetailSex = @"sex";
NSString *const kJCmodel_newCustomer2CustomerDetailMobile = @"mobile";
NSString *const kJCmodel_newCustomer2CustomerDetailCompany = @"company";
NSString *const kJCmodel_newCustomer2CustomerDetailWeChat = @"weChat";
NSString *const kJCmodel_newCustomer2CustomerDetailIncome = @"income";
NSString *const kJCmodel_newCustomer2CustomerDetailBirthday = @"birthday";
NSString *const kJCmodel_newCustomer2CustomerDetailQq = @"qq";
NSString *const kJCmodel_newCustomer2CustomerDetailEmail = @"email";
NSString *const kJCmodel_newCustomer2CustomerDetailInterest = @"interest";


@interface JCmodel_newCustomer2CustomerDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2CustomerDetail

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
            self.customerDetailIdentifier = [[self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailId fromDictionary:dict] doubleValue];
            self.customerDetailDescription = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailDescription fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailSex fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailMobile fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailCompany fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailWeChat fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailIncome fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailBirthday fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailQq fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailEmail fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCmodel_newCustomer2CustomerDetailInterest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerDetailIdentifier] forKey:kJCmodel_newCustomer2CustomerDetailId];
    [mutableDict setValue:self.customerDetailDescription forKey:kJCmodel_newCustomer2CustomerDetailDescription];
    [mutableDict setValue:self.phone forKey:kJCmodel_newCustomer2CustomerDetailPhone];
    [mutableDict setValue:self.sex forKey:kJCmodel_newCustomer2CustomerDetailSex];
    [mutableDict setValue:self.mobile forKey:kJCmodel_newCustomer2CustomerDetailMobile];
    [mutableDict setValue:self.company forKey:kJCmodel_newCustomer2CustomerDetailCompany];
    [mutableDict setValue:self.weChat forKey:kJCmodel_newCustomer2CustomerDetailWeChat];
    [mutableDict setValue:self.income forKey:kJCmodel_newCustomer2CustomerDetailIncome];
    [mutableDict setValue:self.birthday forKey:kJCmodel_newCustomer2CustomerDetailBirthday];
    [mutableDict setValue:self.qq forKey:kJCmodel_newCustomer2CustomerDetailQq];
    [mutableDict setValue:self.email forKey:kJCmodel_newCustomer2CustomerDetailEmail];
    [mutableDict setValue:self.interest forKey:kJCmodel_newCustomer2CustomerDetailInterest];

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

    self.customerDetailIdentifier = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2CustomerDetailId];
    self.customerDetailDescription = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailDescription];
    self.phone = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailPhone];
    self.sex = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailSex];
    self.mobile = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailMobile];
    self.company = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailCompany];
    self.weChat = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailWeChat];
    self.income = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailIncome];
    self.birthday = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailBirthday];
    self.qq = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailQq];
    self.email = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailEmail];
    self.interest = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2CustomerDetailInterest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerDetailIdentifier forKey:kJCmodel_newCustomer2CustomerDetailId];
    [aCoder encodeObject:_customerDetailDescription forKey:kJCmodel_newCustomer2CustomerDetailDescription];
    [aCoder encodeObject:_phone forKey:kJCmodel_newCustomer2CustomerDetailPhone];
    [aCoder encodeObject:_sex forKey:kJCmodel_newCustomer2CustomerDetailSex];
    [aCoder encodeObject:_mobile forKey:kJCmodel_newCustomer2CustomerDetailMobile];
    [aCoder encodeObject:_company forKey:kJCmodel_newCustomer2CustomerDetailCompany];
    [aCoder encodeObject:_weChat forKey:kJCmodel_newCustomer2CustomerDetailWeChat];
    [aCoder encodeObject:_income forKey:kJCmodel_newCustomer2CustomerDetailIncome];
    [aCoder encodeObject:_birthday forKey:kJCmodel_newCustomer2CustomerDetailBirthday];
    [aCoder encodeObject:_qq forKey:kJCmodel_newCustomer2CustomerDetailQq];
    [aCoder encodeObject:_email forKey:kJCmodel_newCustomer2CustomerDetailEmail];
    [aCoder encodeObject:_interest forKey:kJCmodel_newCustomer2CustomerDetailInterest];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2CustomerDetail *copy = [[JCmodel_newCustomer2CustomerDetail alloc] init];
    
    
    
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
