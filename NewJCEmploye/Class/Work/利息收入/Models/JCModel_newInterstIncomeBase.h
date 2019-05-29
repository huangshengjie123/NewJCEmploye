//
//  JCModel_newInterstIncomeBase.h
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newInterstIncomeBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *checkTime;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double shouldAmount;
@property (nonatomic, assign) double debit;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, assign) double credit;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *card;
@property (nonatomic, strong) NSString *bank;
@property (nonatomic, assign) double shouldInterests;
@property (nonatomic, strong) NSString *cdid;
@property (nonatomic, strong) NSString *rateType;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
