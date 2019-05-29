//
//  JCModel_InterstIncomeList.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeList.h"
#import "JCModel_InterstIncomeCreditComInfo.h"
#import "JCModel_InterstIncomeCrediter.h"
#import "JCModel_InterstIncomeAccountantInfo.h"
#import "JCModel_InterstIncomeDebiter.h"
#import "JCModel_InterstIncomeDebitComInfo.h"


NSString *const kJCModel_InterstIncomeListSettleTime = @"settleTime";
NSString *const kJCModel_InterstIncomeListStatus = @"status";
NSString *const kJCModel_InterstIncomeListAmount = @"amount";
NSString *const kJCModel_InterstIncomeListShouldInterests = @"shouldInterests";
NSString *const kJCModel_InterstIncomeListCheckTime = @"checkTime";
NSString *const kJCModel_InterstIncomeListFid = @"fid";
NSString *const kJCModel_InterstIncomeListYrate = @"yrate";
NSString *const kJCModel_InterstIncomeListCard = @"card";
NSString *const kJCModel_InterstIncomeListSettlementAmount = @"settlementAmount";
NSString *const kJCModel_InterstIncomeListCreditComInfo = @"creditComInfo";
NSString *const kJCModel_InterstIncomeListShouldAmount = @"shouldAmount";
NSString *const kJCModel_InterstIncomeListEndTime = @"endTime";
NSString *const kJCModel_InterstIncomeListDebitCom = @"debitCom";
NSString *const kJCModel_InterstIncomeListCreditCom = @"creditCom";
NSString *const kJCModel_InterstIncomeListCrediter = @"crediter";
NSString *const kJCModel_InterstIncomeListRealrate = @"realrate";
NSString *const kJCModel_InterstIncomeListType = @"type";
NSString *const kJCModel_InterstIncomeListAccountantInfo = @"accountantInfo";
NSString *const kJCModel_InterstIncomeListId = @"id";
NSString *const kJCModel_InterstIncomeListRateType = @"rateType";
NSString *const kJCModel_InterstIncomeListDebiter = @"debiter";
NSString *const kJCModel_InterstIncomeListCdid = @"cdid";
NSString *const kJCModel_InterstIncomeListAccountant = @"accountant";
NSString *const kJCModel_InterstIncomeListCredit = @"credit";
NSString *const kJCModel_InterstIncomeListCreateTime = @"createTime";
NSString *const kJCModel_InterstIncomeListDebitComInfo = @"debitComInfo";
NSString *const kJCModel_InterstIncomeListInterests = @"interests";
NSString *const kJCModel_InterstIncomeListDebit = @"debit";
NSString *const kJCModel_InterstIncomeListComment = @"comment";
NSString *const kJCModel_InterstIncomeListBank = @"bank";


@interface JCModel_InterstIncomeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeList

@synthesize settleTime = _settleTime;
@synthesize status = _status;
@synthesize amount = _amount;
@synthesize shouldInterests = _shouldInterests;
@synthesize checkTime = _checkTime;
@synthesize fid = _fid;
@synthesize yrate = _yrate;
@synthesize card = _card;
@synthesize settlementAmount = _settlementAmount;
@synthesize creditComInfo = _creditComInfo;
@synthesize shouldAmount = _shouldAmount;
@synthesize endTime = _endTime;
@synthesize debitCom = _debitCom;
@synthesize creditCom = _creditCom;
@synthesize crediter = _crediter;
@synthesize realrate = _realrate;
@synthesize type = _type;
@synthesize accountantInfo = _accountantInfo;
@synthesize listIdentifier = _listIdentifier;
@synthesize rateType = _rateType;
@synthesize debiter = _debiter;
@synthesize cdid = _cdid;
@synthesize accountant = _accountant;
@synthesize credit = _credit;
@synthesize createTime = _createTime;
@synthesize debitComInfo = _debitComInfo;
@synthesize interests = _interests;
@synthesize debit = _debit;
@synthesize comment = _comment;
@synthesize bank = _bank;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.settleTime = [self objectOrNilForKey:kJCModel_InterstIncomeListSettleTime fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_InterstIncomeListStatus fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_InterstIncomeListAmount fromDictionary:dict] doubleValue];
            self.shouldInterests = [[self objectOrNilForKey:kJCModel_InterstIncomeListShouldInterests fromDictionary:dict] doubleValue];
            self.checkTime = [self objectOrNilForKey:kJCModel_InterstIncomeListCheckTime fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kJCModel_InterstIncomeListFid fromDictionary:dict];
            self.yrate = [[self objectOrNilForKey:kJCModel_InterstIncomeListYrate fromDictionary:dict] doubleValue];
            self.card = [self objectOrNilForKey:kJCModel_InterstIncomeListCard fromDictionary:dict];
            self.settlementAmount = [self objectOrNilForKey:kJCModel_InterstIncomeListSettlementAmount fromDictionary:dict];
            self.creditComInfo = [JCModel_InterstIncomeCreditComInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeListCreditComInfo]];
            self.shouldAmount = [[self objectOrNilForKey:kJCModel_InterstIncomeListShouldAmount fromDictionary:dict] doubleValue];
            self.endTime = [self objectOrNilForKey:kJCModel_InterstIncomeListEndTime fromDictionary:dict];
            self.debitCom = [self objectOrNilForKey:kJCModel_InterstIncomeListDebitCom fromDictionary:dict];
            self.creditCom = [self objectOrNilForKey:kJCModel_InterstIncomeListCreditCom fromDictionary:dict];
            self.crediter = [JCModel_InterstIncomeCrediter modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeListCrediter]];
            self.realrate = [self objectOrNilForKey:kJCModel_InterstIncomeListRealrate fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_InterstIncomeListType fromDictionary:dict];
            self.accountantInfo = [JCModel_InterstIncomeAccountantInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeListAccountantInfo]];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_InterstIncomeListId fromDictionary:dict];
            self.rateType = [self objectOrNilForKey:kJCModel_InterstIncomeListRateType fromDictionary:dict];
            self.debiter = [JCModel_InterstIncomeDebiter modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeListDebiter]];
            self.cdid = [self objectOrNilForKey:kJCModel_InterstIncomeListCdid fromDictionary:dict];
            self.accountant = [[self objectOrNilForKey:kJCModel_InterstIncomeListAccountant fromDictionary:dict] doubleValue];
            self.credit = [[self objectOrNilForKey:kJCModel_InterstIncomeListCredit fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_InterstIncomeListCreateTime fromDictionary:dict];
            self.debitComInfo = [JCModel_InterstIncomeDebitComInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_InterstIncomeListDebitComInfo]];
            self.interests = [self objectOrNilForKey:kJCModel_InterstIncomeListInterests fromDictionary:dict];
            self.debit = [[self objectOrNilForKey:kJCModel_InterstIncomeListDebit fromDictionary:dict] doubleValue];
            self.comment = [self objectOrNilForKey:kJCModel_InterstIncomeListComment fromDictionary:dict];
            self.bank = [self objectOrNilForKey:kJCModel_InterstIncomeListBank fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.settleTime forKey:kJCModel_InterstIncomeListSettleTime];
    [mutableDict setValue:self.status forKey:kJCModel_InterstIncomeListStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_InterstIncomeListAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shouldInterests] forKey:kJCModel_InterstIncomeListShouldInterests];
    [mutableDict setValue:self.checkTime forKey:kJCModel_InterstIncomeListCheckTime];
    [mutableDict setValue:self.fid forKey:kJCModel_InterstIncomeListFid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.yrate] forKey:kJCModel_InterstIncomeListYrate];
    [mutableDict setValue:self.card forKey:kJCModel_InterstIncomeListCard];
    [mutableDict setValue:self.settlementAmount forKey:kJCModel_InterstIncomeListSettlementAmount];
    [mutableDict setValue:[self.creditComInfo dictionaryRepresentation] forKey:kJCModel_InterstIncomeListCreditComInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shouldAmount] forKey:kJCModel_InterstIncomeListShouldAmount];
    [mutableDict setValue:self.endTime forKey:kJCModel_InterstIncomeListEndTime];
    [mutableDict setValue:self.debitCom forKey:kJCModel_InterstIncomeListDebitCom];
    [mutableDict setValue:self.creditCom forKey:kJCModel_InterstIncomeListCreditCom];
    [mutableDict setValue:[self.crediter dictionaryRepresentation] forKey:kJCModel_InterstIncomeListCrediter];
    [mutableDict setValue:self.realrate forKey:kJCModel_InterstIncomeListRealrate];
    [mutableDict setValue:self.type forKey:kJCModel_InterstIncomeListType];
    [mutableDict setValue:[self.accountantInfo dictionaryRepresentation] forKey:kJCModel_InterstIncomeListAccountantInfo];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_InterstIncomeListId];
    [mutableDict setValue:self.rateType forKey:kJCModel_InterstIncomeListRateType];
    [mutableDict setValue:[self.debiter dictionaryRepresentation] forKey:kJCModel_InterstIncomeListDebiter];
    [mutableDict setValue:self.cdid forKey:kJCModel_InterstIncomeListCdid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.accountant] forKey:kJCModel_InterstIncomeListAccountant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.credit] forKey:kJCModel_InterstIncomeListCredit];
    [mutableDict setValue:self.createTime forKey:kJCModel_InterstIncomeListCreateTime];
    [mutableDict setValue:[self.debitComInfo dictionaryRepresentation] forKey:kJCModel_InterstIncomeListDebitComInfo];
    [mutableDict setValue:self.interests forKey:kJCModel_InterstIncomeListInterests];
    [mutableDict setValue:[NSNumber numberWithDouble:self.debit] forKey:kJCModel_InterstIncomeListDebit];
    [mutableDict setValue:self.comment forKey:kJCModel_InterstIncomeListComment];
    [mutableDict setValue:self.bank forKey:kJCModel_InterstIncomeListBank];

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

    self.settleTime = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListSettleTime];
    self.status = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListStatus];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListAmount];
    self.shouldInterests = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListShouldInterests];
    self.checkTime = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCheckTime];
    self.fid = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListFid];
    self.yrate = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListYrate];
    self.card = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCard];
    self.settlementAmount = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListSettlementAmount];
    self.creditComInfo = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCreditComInfo];
    self.shouldAmount = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListShouldAmount];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListEndTime];
    self.debitCom = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListDebitCom];
    self.creditCom = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCreditCom];
    self.crediter = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCrediter];
    self.realrate = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListRealrate];
    self.type = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListType];
    self.accountantInfo = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListAccountantInfo];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListId];
    self.rateType = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListRateType];
    self.debiter = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListDebiter];
    self.cdid = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCdid];
    self.accountant = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListAccountant];
    self.credit = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListCredit];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListCreateTime];
    self.debitComInfo = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListDebitComInfo];
    self.interests = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListInterests];
    self.debit = [aDecoder decodeDoubleForKey:kJCModel_InterstIncomeListDebit];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListComment];
    self.bank = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeListBank];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_settleTime forKey:kJCModel_InterstIncomeListSettleTime];
    [aCoder encodeObject:_status forKey:kJCModel_InterstIncomeListStatus];
    [aCoder encodeDouble:_amount forKey:kJCModel_InterstIncomeListAmount];
    [aCoder encodeDouble:_shouldInterests forKey:kJCModel_InterstIncomeListShouldInterests];
    [aCoder encodeObject:_checkTime forKey:kJCModel_InterstIncomeListCheckTime];
    [aCoder encodeObject:_fid forKey:kJCModel_InterstIncomeListFid];
    [aCoder encodeDouble:_yrate forKey:kJCModel_InterstIncomeListYrate];
    [aCoder encodeObject:_card forKey:kJCModel_InterstIncomeListCard];
    [aCoder encodeObject:_settlementAmount forKey:kJCModel_InterstIncomeListSettlementAmount];
    [aCoder encodeObject:_creditComInfo forKey:kJCModel_InterstIncomeListCreditComInfo];
    [aCoder encodeDouble:_shouldAmount forKey:kJCModel_InterstIncomeListShouldAmount];
    [aCoder encodeObject:_endTime forKey:kJCModel_InterstIncomeListEndTime];
    [aCoder encodeObject:_debitCom forKey:kJCModel_InterstIncomeListDebitCom];
    [aCoder encodeObject:_creditCom forKey:kJCModel_InterstIncomeListCreditCom];
    [aCoder encodeObject:_crediter forKey:kJCModel_InterstIncomeListCrediter];
    [aCoder encodeObject:_realrate forKey:kJCModel_InterstIncomeListRealrate];
    [aCoder encodeObject:_type forKey:kJCModel_InterstIncomeListType];
    [aCoder encodeObject:_accountantInfo forKey:kJCModel_InterstIncomeListAccountantInfo];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_InterstIncomeListId];
    [aCoder encodeObject:_rateType forKey:kJCModel_InterstIncomeListRateType];
    [aCoder encodeObject:_debiter forKey:kJCModel_InterstIncomeListDebiter];
    [aCoder encodeObject:_cdid forKey:kJCModel_InterstIncomeListCdid];
    [aCoder encodeDouble:_accountant forKey:kJCModel_InterstIncomeListAccountant];
    [aCoder encodeDouble:_credit forKey:kJCModel_InterstIncomeListCredit];
    [aCoder encodeObject:_createTime forKey:kJCModel_InterstIncomeListCreateTime];
    [aCoder encodeObject:_debitComInfo forKey:kJCModel_InterstIncomeListDebitComInfo];
    [aCoder encodeObject:_interests forKey:kJCModel_InterstIncomeListInterests];
    [aCoder encodeDouble:_debit forKey:kJCModel_InterstIncomeListDebit];
    [aCoder encodeObject:_comment forKey:kJCModel_InterstIncomeListComment];
    [aCoder encodeObject:_bank forKey:kJCModel_InterstIncomeListBank];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeList *copy = [[JCModel_InterstIncomeList alloc] init];
    
    
    
    if (copy) {

        copy.settleTime = [self.settleTime copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.amount = self.amount;
        copy.shouldInterests = self.shouldInterests;
        copy.checkTime = [self.checkTime copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.yrate = self.yrate;
        copy.card = [self.card copyWithZone:zone];
        copy.settlementAmount = [self.settlementAmount copyWithZone:zone];
        copy.creditComInfo = [self.creditComInfo copyWithZone:zone];
        copy.shouldAmount = self.shouldAmount;
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.debitCom = [self.debitCom copyWithZone:zone];
        copy.creditCom = [self.creditCom copyWithZone:zone];
        copy.crediter = [self.crediter copyWithZone:zone];
        copy.realrate = [self.realrate copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.accountantInfo = [self.accountantInfo copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.rateType = [self.rateType copyWithZone:zone];
        copy.debiter = [self.debiter copyWithZone:zone];
        copy.cdid = [self.cdid copyWithZone:zone];
        copy.accountant = self.accountant;
        copy.credit = self.credit;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.debitComInfo = [self.debitComInfo copyWithZone:zone];
        copy.interests = [self.interests copyWithZone:zone];
        copy.debit = self.debit;
        copy.comment = [self.comment copyWithZone:zone];
        copy.bank = [self.bank copyWithZone:zone];
    }
    
    return copy;
}


@end
