//
//  ProbationDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  试用详情

#import "BaseViewController.h"
#import "DataModels.h"

@protocol ProbationDetailsSuccessDelegate <NSObject>

@optional

-(void)takeProbationSuccess;

@end
@interface ProbationDetailsViewController : BaseViewController

@property (nonatomic,strong) NSString *probationId;
@property (nonatomic,strong) JCModel_probationOrderList *probationOrderList;
@property (nonatomic, weak) id<ProbationDetailsSuccessDelegate> delegate;
@property (nonatomic,assign) BOOL isReadOfLeader;//是否是领导查看

@property (nonatomic,strong) JCModel_EmpSupportOrderList  *listData;

@end
