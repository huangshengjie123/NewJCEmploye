//
//  WorkLogTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkLogTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *contenLabel;

-(void)addContentLabel;

@end
