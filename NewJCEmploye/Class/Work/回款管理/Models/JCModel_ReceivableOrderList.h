//
//  JCModel_ReceivableOrderList.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ReceivableOrderCustomer, JCModel_ReceivableOrderGuider;

@interface JCModel_ReceivableOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) id comments;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) id leader;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double getamount;
@property (nonatomic, strong) NSArray *orderPresents;
@property (nonatomic, assign) id com;
@property (nonatomic, strong) JCModel_ReceivableOrderCustomer *customer;
@property (nonatomic, assign) double customerId;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) id checker;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *orderCosts;
@property (nonatomic, strong) JCModel_ReceivableOrderGuider *guider;
@property (nonatomic, assign) id cusType;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
