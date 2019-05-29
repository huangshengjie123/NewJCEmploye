//
//  JCModel_DistributionList.h
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_DistributionUserExtInfo, JCModel_DistributionCustomer;

@interface JCModel_DistributionList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double staff;
@property (nonatomic, strong) NSString *cardId;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) JCModel_DistributionUserExtInfo *userExtInfo;
@property (nonatomic, assign) double cusId;
@property (nonatomic, strong) JCModel_DistributionCustomer *customer;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
