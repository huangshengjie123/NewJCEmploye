//
//  JCModel_InAndOutList.h
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_InAndOutApplicantInfo, JCModel_InAndOutStoreHouseInfo;

@interface JCModel_InAndOutList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) id checkName;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *faOrderId;
@property (nonatomic, assign) id checker;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) id endTime;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) double applicant;
@property (nonatomic, assign) double storeHouse;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) JCModel_InAndOutApplicantInfo *applicantInfo;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) JCModel_InAndOutStoreHouseInfo *storeHouseInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
