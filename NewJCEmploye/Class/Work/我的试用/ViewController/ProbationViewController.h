//
//  ProbationViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  我的试用

#import "BaseViewController.h"

@interface ProbationViewController : BaseViewController

@property (nonatomic,strong) NSString *uID;
@property (nonatomic,strong) NSString *gID;
@property (nonatomic,strong) NSString *sring;//判断是否是工作组过来的

@property (nonatomic,assign) int allNum;//总数量
@property (nonatomic,strong) NSString *cycleSring;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,assign) BOOL isAll; // 是否是全部

@end
