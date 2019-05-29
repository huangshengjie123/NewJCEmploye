//
//  HomeTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *kImageView;
@property (nonatomic,strong) UILabel     *messageLabel;  //消息
@property (nonatomic,strong) UILabel     *userNameLabel; //关于某个人
@property (nonatomic,strong) UILabel     *classLabel; //消息类型
@property (nonatomic,strong) UILabel     *timeLabel; //时间

@end
