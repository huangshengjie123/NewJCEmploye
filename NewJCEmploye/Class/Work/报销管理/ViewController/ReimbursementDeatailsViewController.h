//
//  ReimbursementDeatailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/19.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@interface ReimbursementDeatailsViewController : BaseViewController

@property (nonatomic,strong) JCModel_reimbursementList *listData;
@property (nonatomic,strong) NSString *typestring;

@end
