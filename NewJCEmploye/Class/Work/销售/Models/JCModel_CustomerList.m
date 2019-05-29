//
//  JCModel_CustomerList.m
//
//  Created by   on 2018/4/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CustomerList.h"
#import "JCModel_CustomerCustomerAddressList.h"


NSString *const kJCModel_CustomerListId = @"id";
NSString *const kJCModel_CustomerListGuide = @"guide";
NSString *const kJCModel_CustomerListPhone = @"phone";
NSString *const kJCModel_CustomerListCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_CustomerListMobile = @"mobile";
NSString *const kJCModel_CustomerListSex = @"sex";
NSString *const kJCModel_CustomerListCompany = @"company";
NSString *const kJCModel_CustomerListWeChat = @"weChat";
NSString *const kJCModel_CustomerListType = @"type";
NSString *const kJCModel_CustomerListIncome = @"income";
NSString *const kJCModel_CustomerListCreateTime = @"createTime";
NSString *const kJCModel_CustomerListQq = @"qq";
NSString *const kJCModel_CustomerListAccount = @"account";
NSString *const kJCModel_CustomerListInterest = @"interest";
NSString *const kJCModel_CustomerListName = @"name";
NSString *const kJCModel_CustomerListEmail = @"email";


@interface JCModel_CustomerList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CustomerList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize phone = _phone;
@synthesize customerAddressList = _customerAddressList;
@synthesize mobile = _mobile;
@synthesize sex = _sex;
@synthesize company = _company;
@synthesize weChat = _weChat;
@synthesize type = _type;
@synthesize income = _income;
@synthesize createTime = _createTime;
@synthesize qq = _qq;
@synthesize account = _account;
@synthesize interest = _interest;
@synthesize name = _name;
@synthesize email = _email;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kJCModel_CustomerListId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_CustomerListGuide fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kJCModel_CustomerListPhone fromDictionary:dict];
    NSObject *receivedJCModel_CustomerCustomerAddressList = [dict objectForKey:kJCModel_CustomerListCustomerAddressList];
    NSMutableArray *parsedJCModel_CustomerCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_CustomerCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CustomerCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CustomerCustomerAddressList addObject:[JCModel_CustomerCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CustomerCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CustomerCustomerAddressList addObject:[JCModel_CustomerCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CustomerCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_CustomerCustomerAddressList];
            self.mobile = [self objectOrNilForKey:kJCModel_CustomerListMobile fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kJCModel_CustomerListSex fromDictionary:dict];
            self.company = [self objectOrNilForKey:kJCModel_CustomerListCompany fromDictionary:dict];
            self.weChat = [self objectOrNilForKey:kJCModel_CustomerListWeChat fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_CustomerListType fromDictionary:dict];
            self.income = [self objectOrNilForKey:kJCModel_CustomerListIncome fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_CustomerListCreateTime fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kJCModel_CustomerListQq fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_CustomerListAccount fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kJCModel_CustomerListInterest fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_CustomerListName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kJCModel_CustomerListEmail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCModel_CustomerListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_CustomerListGuide];
    [mutableDict setValue:self.phone forKey:kJCModel_CustomerListPhone];
    NSMutableArray *tempArrayForCustomerAddressList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddressList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomerAddressList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomerAddressList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_CustomerListCustomerAddressList];
    [mutableDict setValue:self.mobile forKey:kJCModel_CustomerListMobile];
    [mutableDict setValue:self.sex forKey:kJCModel_CustomerListSex];
    [mutableDict setValue:self.company forKey:kJCModel_CustomerListCompany];
    [mutableDict setValue:self.weChat forKey:kJCModel_CustomerListWeChat];
    [mutableDict setValue:self.type forKey:kJCModel_CustomerListType];
    [mutableDict setValue:self.income forKey:kJCModel_CustomerListIncome];
    [mutableDict setValue:self.createTime forKey:kJCModel_CustomerListCreateTime];
    [mutableDict setValue:self.qq forKey:kJCModel_CustomerListQq];
    [mutableDict setValue:self.account forKey:kJCModel_CustomerListAccount];
    [mutableDict setValue:self.interest forKey:kJCModel_CustomerListInterest];
    [mutableDict setValue:self.name forKey:kJCModel_CustomerListName];
    [mutableDict setValue:self.email forKey:kJCModel_CustomerListEmail];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CustomerListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_CustomerListGuide];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_CustomerListPhone];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_CustomerListCustomerAddressList];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_CustomerListMobile];
    self.sex = [aDecoder decodeObjectForKey:kJCModel_CustomerListSex];
    self.company = [aDecoder decodeObjectForKey:kJCModel_CustomerListCompany];
    self.weChat = [aDecoder decodeObjectForKey:kJCModel_CustomerListWeChat];
    self.type = [aDecoder decodeObjectForKey:kJCModel_CustomerListType];
    self.income = [aDecoder decodeObjectForKey:kJCModel_CustomerListIncome];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_CustomerListCreateTime];
    self.qq = [aDecoder decodeObjectForKey:kJCModel_CustomerListQq];
    self.account = [aDecoder decodeObjectForKey:kJCModel_CustomerListAccount];
    self.interest = [aDecoder decodeObjectForKey:kJCModel_CustomerListInterest];
    self.name = [aDecoder decodeObjectForKey:kJCModel_CustomerListName];
    self.email = [aDecoder decodeObjectForKey:kJCModel_CustomerListEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCModel_CustomerListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_CustomerListGuide];
    [aCoder encodeObject:_phone forKey:kJCModel_CustomerListPhone];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_CustomerListCustomerAddressList];
    [aCoder encodeObject:_mobile forKey:kJCModel_CustomerListMobile];
    [aCoder encodeObject:_sex forKey:kJCModel_CustomerListSex];
    [aCoder encodeObject:_company forKey:kJCModel_CustomerListCompany];
    [aCoder encodeObject:_weChat forKey:kJCModel_CustomerListWeChat];
    [aCoder encodeObject:_type forKey:kJCModel_CustomerListType];
    [aCoder encodeObject:_income forKey:kJCModel_CustomerListIncome];
    [aCoder encodeObject:_createTime forKey:kJCModel_CustomerListCreateTime];
    [aCoder encodeObject:_qq forKey:kJCModel_CustomerListQq];
    [aCoder encodeObject:_account forKey:kJCModel_CustomerListAccount];
    [aCoder encodeObject:_interest forKey:kJCModel_CustomerListInterest];
    [aCoder encodeObject:_name forKey:kJCModel_CustomerListName];
    [aCoder encodeObject:_email forKey:kJCModel_CustomerListEmail];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CustomerList *copy = [[JCModel_CustomerList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.guide = self.guide;
        copy.phone = [self.phone copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.weChat = [self.weChat copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.income = [self.income copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
    }
    
    return copy;
}


@end
