//
//  JCModel_InterstIncomeList.h
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_InterstIncomeCreditComInfo, JCModel_InterstIncomeCrediter, JCModel_InterstIncomeAccountantInfo, JCModel_InterstIncomeDebiter, JCModel_InterstIncomeDebitComInfo;

@interface JCModel_InterstIncomeList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id settleTime;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double shouldInterests;
@property (nonatomic, strong) NSString *checkTime;
@property (nonatomic, assign) id fid;
@property (nonatomic, assign) double yrate;
@property (nonatomic, assign) id card;
@property (nonatomic, assign) id settlementAmount;
@property (nonatomic, strong) JCModel_InterstIncomeCreditComInfo *creditComInfo;
@property (nonatomic, assign) double shouldAmount;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *debitCom;
@property (nonatomic, strong) NSString *creditCom;
@property (nonatomic, strong) JCModel_InterstIncomeCrediter *crediter;
@property (nonatomic, assign) id realrate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) JCModel_InterstIncomeAccountantInfo *accountantInfo;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *rateType;
@property (nonatomic, strong) JCModel_InterstIncomeDebiter *debiter;
@property (nonatomic, strong) NSString *cdid;
@property (nonatomic, assign) double accountant;
@property (nonatomic, assign) double credit;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) JCModel_InterstIncomeDebitComInfo *debitComInfo;
@property (nonatomic, assign) id interests;
@property (nonatomic, assign) double debit;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, assign) id bank;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
