//
//  JCModel_searchDetailsOutputFList.h
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_searchDetailsOutputFApplicantInfo, JCModel_searchDetailsOutputFStoreHouseInfo;

@interface JCModel_searchDetailsOutputFList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *checkCode;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) id outTime;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *faOrderId;
@property (nonatomic, assign) double checker;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *franchiser;
@property (nonatomic, assign) double applicant;
@property (nonatomic, assign) double storeHouse;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) JCModel_searchDetailsOutputFApplicantInfo *applicantInfo;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) JCModel_searchDetailsOutputFStoreHouseInfo *storeHouseInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
