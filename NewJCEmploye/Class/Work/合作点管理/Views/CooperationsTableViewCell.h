//
//  CooperationsTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CooperationsTableViewCell : UITableViewCell


@property (nonatomic,strong) UILabel *nameLabel;  //试用人姓名
@property (nonatomic,strong) UILabel *phoneLabel;  //试用人手机
@property (nonatomic,strong) UILabel *timeLabel; // 试用人开始时间
@property (nonatomic,strong) UILabel *probationStateLabel;  // 试用人状态
@property (nonatomic,strong) UILabel *addressLabel; // 试用人地址
@property (nonatomic,strong) UILabel *itemsLabel; //试用物品清单

@end
