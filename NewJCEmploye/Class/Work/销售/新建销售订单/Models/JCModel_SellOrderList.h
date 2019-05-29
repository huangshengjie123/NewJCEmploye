//
//  JCModel_SellOrderList.h
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_SellOrderCustomer, JCModel_SellOrderGuider;

@interface JCModel_SellOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double guide;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) id leader;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double getamount;
@property (nonatomic, strong) NSArray *orderPresents;
@property (nonatomic, assign) id com;
@property (nonatomic, strong) JCModel_SellOrderCustomer *customer;
@property (nonatomic, assign) double customerId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id checker;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *orderCosts;
@property (nonatomic, strong) JCModel_SellOrderGuider *guider;
@property (nonatomic, assign) id cusType;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
