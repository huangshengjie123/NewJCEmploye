//
//  RepertoryChooseTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepertoryChooseTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (strong,nonatomic) UIImageView *kImageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *contentLabel;
@property (nonatomic,strong) UITextField *numTextField;
@property (nonatomic,assign) int num;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,assign) BOOL  isSelected;

@property (nonatomic,assign) double idDouble;

@property (nonatomic,assign) int maxNum;

@end
