//
//  SellTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  销售列表cell

#import <UIKit/UIKit.h>

@interface SellTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLabel;  //姓名
@property (nonatomic,strong) UILabel *phoneLabel;  //手机
@property (nonatomic,strong) UILabel *timeLabel; // 开始时间
@property (nonatomic,strong) UILabel *stateLabel;  // 状态
@property (nonatomic,strong) UILabel *addressLabel; // 地址
@property (nonatomic,strong) UILabel *itemsLabel; //物品清单

@end
