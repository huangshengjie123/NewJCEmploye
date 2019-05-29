//
//  WorkGroupTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupTableViewCell.h"
#import "Macro.h"
@implementation WorkGroupTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCBackgroundColor;
    }
    return self;
}

-(void)addViews {
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = JCColorWithe;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.right.equalTo(self);
        make.height.equalTo(@(40));
    }];
    
    _titelLabel = [[UILabel alloc]init];
    _titelLabel.textColor = JCColorBlack;
    _titelLabel.font = JCFont16;
    [backView addSubview:_titelLabel];
    [_titelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(backView).offset(10);
    }];
    
    
    _categoryLabel = [[UILabel alloc]init];
    _categoryLabel.textColor = JCColorWithe;
    _categoryLabel.backgroundColor = JCColorBlue;
    _categoryLabel.font = [UIFont systemFontOfSize:11];
    [backView addSubview:_categoryLabel];
    [_categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_titelLabel.mas_right).offset(5);
        make.height.equalTo(@(13));
    }];
    _categoryLabel.layer.masksToBounds = YES;
    _categoryLabel.layer.cornerRadius = 2.5;
    
    
    
//    _contentLabel = [[UILabel alloc]init];
//    _contentLabel.textColor = JCColorBlack;
//    _contentLabel.font = JCFont14;
//    [backView addSubview:_contentLabel];
//    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.right.equalTo(self).offset(-10);
//    }];
    
     _button = [[UIButton alloc]init];
    _button.backgroundColor = JCColorBlue;
    [backView addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backView.mas_right).offset(-10);
        make.height.equalTo(@(28));
        make.width.equalTo(@(100));
        make.centerY.equalTo(backView);
    }];
    _button.hidden = YES;
    _button.layer.masksToBounds = YES;
    _button.layer.cornerRadius = 2;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"查看整组数据";
    label.textColor = JCColorWithe;
    label.font = JCFont13;
    [_button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(_button);
    }];
    
 
    
}
@end
