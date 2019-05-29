//
//  AttributeViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  数据界面

#import "BaseViewController.h"

@interface AttributeViewController : BaseViewController

@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) NSString *workGroupIdString;
@property (nonatomic,assign) double userIdString;
@property (nonatomic,assign) BOOL isALL; //是否是整个组
@end
