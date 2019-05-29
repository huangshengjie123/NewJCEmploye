//
//  InAndOutTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InAndOutTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *applicantName; //申请人
@property (nonatomic,strong) UILabel *stateLabel;//状态
@property (nonatomic,strong) UILabel *timeLabel;//时间
@property (nonatomic,strong) UILabel *useLaebl;//用途
@property (nonatomic,strong) UILabel *materialLabel;//物料

@end
