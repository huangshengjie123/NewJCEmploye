//
//  JCModel_reimbursementList.h
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_reimbursementMgrInfo, JCModel_reimbursementLeaderInfo, JCModel_reimbursementApprInfo;

@interface JCModel_reimbursementList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) JCModel_reimbursementMgrInfo *mgrInfo;
@property (nonatomic, assign) double leader;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) id accountantInfo;
@property (nonatomic, assign) id accountant;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) double mgr;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, assign) id faOrdrerId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id comment;
@property (nonatomic, strong) JCModel_reimbursementLeaderInfo *leaderInfo;
@property (nonatomic, strong) JCModel_reimbursementApprInfo *apprInfo;
@property (nonatomic, assign) double appr;
@property (nonatomic, strong) NSArray *reimbursementItems;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
