//
//  WorkGroupSearchToolViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/2/21.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@interface WorkGroupSearchToolViewController : BaseViewController
@property(nonatomic,strong)  JCModel_GroupEMPList *list;
@property(nonatomic,strong) JCModel_WorkGroupGroupRelations *workGroupRelations;
@property (nonatomic,strong) JCModel_WorkGroupList *workGrouplist;
@property (nonatomic,assign) BOOL isAssistant;// 是否是助理
@end
