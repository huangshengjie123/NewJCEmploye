//
//  NewReturnGoodsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/28.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//  新建退货单

#import "BaseViewController.h"
#import "DataModels.h"
@interface NewReturnGoodsViewController : BaseViewController
@property (nonatomic,strong) JCModel_SellOrderList *sellOrderList;
@property (nonatomic,strong) NSString *newi2d;

@end
