//
//  SellViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  销售单列表

#import "BaseViewController.h"
#import "JCRequest_getSaleOrders4Group2.h"
@interface SellViewController : BaseViewController

@property (nonatomic,strong) NSString *uID;
@property (nonatomic,strong) NSString *gID;
@property (nonatomic,strong) NSString *sring;//判断是否是工作组过来的

@property (nonatomic,assign) int      allNum;//总数量
@property (nonatomic,strong) NSString *cycleSring;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *searchString;//搜索词
@property (nonatomic,assign) BOOL     isAll; // 是否是全部

@end
