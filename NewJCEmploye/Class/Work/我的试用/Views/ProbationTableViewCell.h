//
//  ProbationTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProbationTableViewCell : UITableViewCell


@property (nonatomic,strong) UILabel *probationerNameLabel;  //试用人姓名
@property (nonatomic,strong) UILabel *probationerPhoneLabel;  //试用人手机
@property (nonatomic,strong) UILabel *probationStartTimeLabel; // 试用人开始时间
@property (nonatomic,strong) UILabel *probationStateLabel;  // 试用人状态
@property (nonatomic,strong) UILabel *probationAddressLabel; // 试用人地址
@property (nonatomic,strong) UILabel *probationItemsLabel; //试用物品清单

@end
