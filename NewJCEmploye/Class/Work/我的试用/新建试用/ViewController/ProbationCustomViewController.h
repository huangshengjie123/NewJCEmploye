//
//  ProbationCustomViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  试用客户列表

#import "BaseViewController.h"
#import "DataModels.h"
@protocol SelectProbationCustomDelegate <NSObject>

@optional
-(void)selectProbationReturn:(JCModel_NewProabtionCustomList *)listData;

@end

@interface ProbationCustomViewController : BaseViewController

@property (nonatomic,strong) NSString *tpyeString;
@property (nonatomic, weak) id<SelectProbationCustomDelegate> delegate;
@property (nonatomic,strong) NSString *guideSring;//员工ID

@end
