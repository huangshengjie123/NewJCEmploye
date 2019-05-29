//
//  JCModel_EmpSupportOrderList.h
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_EmpSupportOrderCustomerPrepare, JCModel_EmpSupportOrderFranProbation, JCModel_EmpSupportOrderCustomer, JCModel_EmpSupportOrderFranchiserDetail;

@interface JCModel_EmpSupportOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) id amount;
@property (nonatomic, strong) JCModel_EmpSupportOrderCustomerPrepare *customerPrepare;
@property (nonatomic, assign) double isAgent;
@property (nonatomic, assign) id difBalance;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double preId;
@property (nonatomic, assign) double customerId;
@property (nonatomic, assign) id endTime;
@property (nonatomic, strong) JCModel_EmpSupportOrderFranProbation *franProbation;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) id getamount;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSArray *orderPresents;
@property (nonatomic, strong) NSString *cusType;
@property (nonatomic, strong) JCModel_EmpSupportOrderCustomer *customer;
@property (nonatomic, strong) JCModel_EmpSupportOrderFranchiserDetail *franchiserDetail;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *orderCosts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
