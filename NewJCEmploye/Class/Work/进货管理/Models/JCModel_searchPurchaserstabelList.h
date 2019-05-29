//
//  JCModel_searchPurchaserstabelList.h
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_searchPurchaserstabelPurchaserDetail;

@interface JCModel_searchPurchaserstabelList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) JCModel_searchPurchaserstabelPurchaserDetail *purchaserDetail;
@property (nonatomic, assign) double opr;
@property (nonatomic, assign) double leader;
@property (nonatomic, assign) id financer;
@property (nonatomic, assign) id inStoreHouse;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id inStoreHouseId;
@property (nonatomic, assign) id distributer;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) id endTime;
@property (nonatomic, assign) double applicant;
@property (nonatomic, assign) id storeHouse;
@property (nonatomic, assign) id storeHouseId;
@property (nonatomic, strong) NSArray *purchaserOrderCosts;
@property (nonatomic, assign) id distributerSimp;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *purchaser;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
