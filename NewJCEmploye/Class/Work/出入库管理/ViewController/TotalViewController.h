//
//  TotalViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  出入库总计

#import "BaseViewController.h"
#import "YUFoldingTableView.h"

@interface TotalViewController : BaseViewController

@property (nonatomic, strong)  NSString *kindString; //传入字符 以判断是出库 还是入库
@property (nonatomic, assign)  YUFoldingSectionHeaderArrowPosition arrowPosition;
@property (nonatomic, strong)  NSString *warehouseId;
@property (nonatomic, strong)  NSString *inoutSring;
@end
