//
//  MessageDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/2.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"

@interface MessageDetailsViewController : BaseViewController

@property (nonatomic,strong)  JCModel_message2List *listData ;
@property (nonatomic, assign) BOOL     flag;//是否创建底部按钮

@end
