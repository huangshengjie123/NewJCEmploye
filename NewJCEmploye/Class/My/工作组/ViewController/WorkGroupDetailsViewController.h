//
//  WorkGroupDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
#import "WorkGroupTableViewCell.h"
@interface WorkGroupDetailsViewController : BaseViewController

@property (nonatomic,strong) JCModel_WorkGroupList *workGrouplist;
@property (nonatomic,assign) BOOL                  isHoom;
@property (nonatomic,strong) NSString              *taskIDstring;

@property (nonatomic,assign) BOOL                  isBeyoud; //是否是超期待办跳过来的
@property (nonatomic,assign) BOOL                  isHaveLeader;

@property (nonatomic,assign) BOOL                  ishaveAssistant;//是否是助理

@end
