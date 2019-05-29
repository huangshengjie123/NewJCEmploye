//
//  JCModel_newInterstIncomeBase.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newInterstIncomeBase.h"


NSString *const kJCModel_newInterstIncomeBaseCheckTime = @"checkTime";
NSString *const kJCModel_newInterstIncomeBaseAmount = @"amount";
NSString *const kJCModel_newInterstIncomeBaseShouldAmount = @"shouldAmount";
NSString *const kJCModel_newInterstIncomeBaseDebit = @"debit";
NSString *const kJCModel_newInterstIncomeBaseType = @"type";
NSString *const kJCModel_newInterstIncomeBaseComment = @"comment";
NSString *const kJCModel_newInterstIncomeBaseCredit = @"credit";
NSString *const kJCModel_newInterstIncomeBaseCreateTime = @"createTime";
NSString *const kJCModel_newInterstIncomeBaseCard = @"card";
NSString *const kJCModel_newInterstIncomeBaseBank = @"bank";
NSString *const kJCModel_newInterstIncomeBaseShouldInterests = @"shouldInterests";
NSString *const kJCModel_newInterstIncomeBaseCdid = @"cdid";
NSString *const kJCModel_newInterstIncomeBaseRateType = @"rateType";
NSString *const kJCModel_newInterstIncomeBaseStatus = @"status";


@interface JCModel_newInterstIncomeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newInterstIncomeBase

@synthesize checkTime = _checkTime;
@synthesize amount = _amount;
@synthesize shouldAmount = _shouldAmount;
@synthesize debit = _debit;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize credit = _credit;
@synthesize createTime = _createTime;
@synthesize card = _card;
@synthesize bank = _bank;
@synthesize shouldInterests = _shouldInterests;
@synthesize cdid = _cdid;
@synthesize rateType = _rateType;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.checkTime = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseCheckTime fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_newInterstIncomeBaseAmount fromDictionary:dict] doubleValue];
            self.shouldAmount = [[self objectOrNilForKey:kJCModel_newInterstIncomeBaseShouldAmount fromDictionary:dict] doubleValue];
            self.debit = [[self objectOrNilForKey:kJCModel_newInterstIncomeBaseDebit fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseComment fromDictionary:dict];
            self.credit = [[self objectOrNilForKey:kJCModel_newInterstIncomeBaseCredit fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseCreateTime fromDictionary:dict];
            self.card = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseCard fromDictionary:dict];
            self.bank = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseBank fromDictionary:dict];
            self.shouldInterests = [[self objectOrNilForKey:kJCModel_newInterstIncomeBaseShouldInterests fromDictionary:dict] doubleValue];
            self.cdid = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseCdid fromDictionary:dict] ;
            self.rateType = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseRateType fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_newInterstIncomeBaseStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.checkTime forKey:kJCModel_newInterstIncomeBaseCheckTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_newInterstIncomeBaseAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shouldAmount] forKey:kJCModel_newInterstIncomeBaseShouldAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.debit] forKey:kJCModel_newInterstIncomeBaseDebit];
    [mutableDict setValue:self.type forKey:kJCModel_newInterstIncomeBaseType];
    [mutableDict setValue:self.comment forKey:kJCModel_newInterstIncomeBaseComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.credit] forKey:kJCModel_newInterstIncomeBaseCredit];
    [mutableDict setValue:self.createTime forKey:kJCModel_newInterstIncomeBaseCreateTime];
    [mutableDict setValue:self.card forKey:kJCModel_newInterstIncomeBaseCard];
    [mutableDict setValue:self.bank forKey:kJCModel_newInterstIncomeBaseBank];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shouldInterests] forKey:kJCModel_newInterstIncomeBaseShouldInterests];
    [mutableDict setValue:[NSNumber numberWithInt:self.cdid] forKey:kJCModel_newInterstIncomeBaseCdid];
    [mutableDict setValue:self.rateType forKey:kJCModel_newInterstIncomeBaseRateType];
    [mutableDict setValue:self.status forKey:kJCModel_newInterstIncomeBaseStatus];

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

    self.checkTime = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseCheckTime];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_newInterstIncomeBaseAmount];
    self.shouldAmount = [aDecoder decodeDoubleForKey:kJCModel_newInterstIncomeBaseShouldAmount];
    self.debit = [aDecoder decodeDoubleForKey:kJCModel_newInterstIncomeBaseDebit];
    self.type = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseType];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseComment];
    self.credit = [aDecoder decodeDoubleForKey:kJCModel_newInterstIncomeBaseCredit];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseCreateTime];
    self.card = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseCard];
    self.bank = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseBank];
    self.shouldInterests = [aDecoder decodeDoubleForKey:kJCModel_newInterstIncomeBaseShouldInterests];
    self.cdid = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseCdid];
    self.rateType = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseRateType];
    self.status = [aDecoder decodeObjectForKey:kJCModel_newInterstIncomeBaseStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_checkTime forKey:kJCModel_newInterstIncomeBaseCheckTime];
    [aCoder encodeDouble:_amount forKey:kJCModel_newInterstIncomeBaseAmount];
    [aCoder encodeDouble:_shouldAmount forKey:kJCModel_newInterstIncomeBaseShouldAmount];
    [aCoder encodeDouble:_debit forKey:kJCModel_newInterstIncomeBaseDebit];
    [aCoder encodeObject:_type forKey:kJCModel_newInterstIncomeBaseType];
    [aCoder encodeObject:_comment forKey:kJCModel_newInterstIncomeBaseComment];
    [aCoder encodeDouble:_credit forKey:kJCModel_newInterstIncomeBaseCredit];
    [aCoder encodeObject:_createTime forKey:kJCModel_newInterstIncomeBaseCreateTime];
    [aCoder encodeObject:_card forKey:kJCModel_newInterstIncomeBaseCard];
    [aCoder encodeObject:_bank forKey:kJCModel_newInterstIncomeBaseBank];
    [aCoder encodeDouble:_shouldInterests forKey:kJCModel_newInterstIncomeBaseShouldInterests];
    [aCoder encodeObject:_cdid forKey:kJCModel_newInterstIncomeBaseCdid];
    [aCoder encodeObject:_rateType forKey:kJCModel_newInterstIncomeBaseRateType];
    [aCoder encodeObject:_status forKey:kJCModel_newInterstIncomeBaseStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newInterstIncomeBase *copy = [[JCModel_newInterstIncomeBase alloc] init];
    
    
    
    if (copy) {

        copy.checkTime = [self.checkTime copyWithZone:zone];
        copy.amount = self.amount;
        copy.shouldAmount = self.shouldAmount;
        copy.debit = self.debit;
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.credit = self.credit;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.card = [self.card copyWithZone:zone];
        copy.bank = [self.bank copyWithZone:zone];
        copy.shouldInterests = self.shouldInterests;
        copy.cdid = self.cdid;
        copy.rateType = [self.rateType copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
