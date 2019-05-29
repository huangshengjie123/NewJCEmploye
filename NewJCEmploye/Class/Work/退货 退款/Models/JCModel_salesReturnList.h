//
//  JCModel_salesReturnList.h
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_salesReturnStaff, JCModel_salesReturnCustomer;

@interface JCModel_salesReturnList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) JCModel_salesReturnStaff *staff;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double cus;
@property (nonatomic, assign) double getamount;
@property (nonatomic, strong) NSArray *payments;
@property (nonatomic, assign) id accountant;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) JCModel_salesReturnCustomer *customer;
@property (nonatomic, strong) NSArray *refundmentCosts;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *oid;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) double refundment;
@property (nonatomic, assign) id fran;
@property (nonatomic, assign) id storeHouse;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
