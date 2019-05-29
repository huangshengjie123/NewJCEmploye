//
//  JCModel_OtherIncomeList.m
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_OtherIncomeList.h"
#import "JCModel_OtherIncomeAccountantInfo.h"
#import "JCModel_OtherIncomeApprInfo.h"


NSString *const kJCModel_OtherIncomeListId = @"id";
NSString *const kJCModel_OtherIncomeListAmount = @"amount";
NSString *const kJCModel_OtherIncomeListAccountantInfo = @"accountantInfo";
NSString *const kJCModel_OtherIncomeListAccountant = @"accountant";
NSString *const kJCModel_OtherIncomeListTime = @"time";
NSString *const kJCModel_OtherIncomeListCom = @"com";
NSString *const kJCModel_OtherIncomeListType = @"type";
NSString *const kJCModel_OtherIncomeListComment = @"comment";
NSString *const kJCModel_OtherIncomeListApprInfo = @"apprInfo";
NSString *const kJCModel_OtherIncomeListAppr = @"appr";
NSString *const kJCModel_OtherIncomeListStatus = @"status";
NSString *const kJCModel_OtherIncomeListPayment = @"payment";


@interface JCModel_OtherIncomeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_OtherIncomeList

@synthesize listIdentifier = _listIdentifier;
@synthesize amount = _amount;
@synthesize accountantInfo = _accountantInfo;
@synthesize accountant = _accountant;
@synthesize time = _time;
@synthesize com = _com;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize apprInfo = _apprInfo;
@synthesize appr = _appr;
@synthesize status = _status;
@synthesize payment = _payment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_OtherIncomeListId fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_OtherIncomeListAmount fromDictionary:dict] doubleValue];
            self.accountantInfo = [JCModel_OtherIncomeAccountantInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_OtherIncomeListAccountantInfo]];
            self.accountant = [[self objectOrNilForKey:kJCModel_OtherIncomeListAccountant fromDictionary:dict] doubleValue];
            self.time = [self objectOrNilForKey:kJCModel_OtherIncomeListTime fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_OtherIncomeListCom fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_OtherIncomeListType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_OtherIncomeListComment fromDictionary:dict];
            self.apprInfo = [JCModel_OtherIncomeApprInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_OtherIncomeListApprInfo]];
            self.appr = [[self objectOrNilForKey:kJCModel_OtherIncomeListAppr fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kJCModel_OtherIncomeListStatus fromDictionary:dict];
            self.payment = [self objectOrNilForKey:kJCModel_OtherIncomeListPayment fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_OtherIncomeListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_OtherIncomeListAmount];
    [mutableDict setValue:[self.accountantInfo dictionaryRepresentation] forKey:kJCModel_OtherIncomeListAccountantInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.accountant] forKey:kJCModel_OtherIncomeListAccountant];
    [mutableDict setValue:self.time forKey:kJCModel_OtherIncomeListTime];
    [mutableDict setValue:self.com forKey:kJCModel_OtherIncomeListCom];
    [mutableDict setValue:self.type forKey:kJCModel_OtherIncomeListType];
    [mutableDict setValue:self.comment forKey:kJCModel_OtherIncomeListComment];
    [mutableDict setValue:[self.apprInfo dictionaryRepresentation] forKey:kJCModel_OtherIncomeListApprInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appr] forKey:kJCModel_OtherIncomeListAppr];
    [mutableDict setValue:self.status forKey:kJCModel_OtherIncomeListStatus];
    [mutableDict setValue:self.payment forKey:kJCModel_OtherIncomeListPayment];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListId];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomeListAmount];
    self.accountantInfo = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListAccountantInfo];
    self.accountant = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomeListAccountant];
    self.time = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListTime];
    self.com = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListCom];
    self.type = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListType];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListComment];
    self.apprInfo = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListApprInfo];
    self.appr = [aDecoder decodeDoubleForKey:kJCModel_OtherIncomeListAppr];
    self.status = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListStatus];
    self.payment = [aDecoder decodeObjectForKey:kJCModel_OtherIncomeListPayment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_OtherIncomeListId];
    [aCoder encodeDouble:_amount forKey:kJCModel_OtherIncomeListAmount];
    [aCoder encodeObject:_accountantInfo forKey:kJCModel_OtherIncomeListAccountantInfo];
    [aCoder encodeDouble:_accountant forKey:kJCModel_OtherIncomeListAccountant];
    [aCoder encodeObject:_time forKey:kJCModel_OtherIncomeListTime];
    [aCoder encodeObject:_com forKey:kJCModel_OtherIncomeListCom];
    [aCoder encodeObject:_type forKey:kJCModel_OtherIncomeListType];
    [aCoder encodeObject:_comment forKey:kJCModel_OtherIncomeListComment];
    [aCoder encodeObject:_apprInfo forKey:kJCModel_OtherIncomeListApprInfo];
    [aCoder encodeDouble:_appr forKey:kJCModel_OtherIncomeListAppr];
    [aCoder encodeObject:_status forKey:kJCModel_OtherIncomeListStatus];
    [aCoder encodeObject:_payment forKey:kJCModel_OtherIncomeListPayment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_OtherIncomeList *copy = [[JCModel_OtherIncomeList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.amount = self.amount;
        copy.accountantInfo = [self.accountantInfo copyWithZone:zone];
        copy.accountant = self.accountant;
        copy.time = [self.time copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.apprInfo = [self.apprInfo copyWithZone:zone];
        copy.appr = self.appr;
        copy.status = [self.status copyWithZone:zone];
        copy.payment = [self.payment copyWithZone:zone];
    }
    
    return copy;
}


@end
