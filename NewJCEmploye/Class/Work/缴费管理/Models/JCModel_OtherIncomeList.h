//
//  JCModel_OtherIncomeList.h
//
//  Created by   on 2019/3/12
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_OtherIncomeAccountantInfo, JCModel_OtherIncomeApprInfo;

@interface JCModel_OtherIncomeList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double amount;
@property (nonatomic, strong) JCModel_OtherIncomeAccountantInfo *accountantInfo;
@property (nonatomic, assign) double accountant;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) JCModel_OtherIncomeApprInfo *apprInfo;
@property (nonatomic, assign) double appr;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *payment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
