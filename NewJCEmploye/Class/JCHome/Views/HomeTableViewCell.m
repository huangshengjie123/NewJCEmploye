//
//  HomeTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Macro.h"

@interface HomeTableViewCell ()

@end


@implementation HomeTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-5);
        make.right.equalTo(self).offset(-5);
    }];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 4.0;
    
    _kImageView  = [[UIImageView alloc]init];
    [backView addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        make.left.equalTo(backView).offset(10);
        make.centerY.equalTo(backView);
    }];
    
    
    UILabel *label1= [[UILabel alloc]init];
    label1.text = @"关于";
    label1.font = JCFont12;
    label1.textColor =  JCColorMidGray;
    [backView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (backView.mas_top).offset (5);
        make.left.equalTo(_kImageView.mas_right).offset(10);
    }];
    
    _userNameLabel = [[UILabel alloc]init];
    _userNameLabel.font = JCFont12;
    _userNameLabel.textColor = [UIColor orangeColor];
    [backView addSubview:_userNameLabel];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label1).offset(0);
        make.left.equalTo(label1.mas_right).offset(0);
    }];
    
    
    _classLabel = [[UILabel alloc]init];
    _classLabel.font = JCFont12;
    _classLabel.textColor =  JCColorBlue;
    [backView addSubview:_classLabel];
    [_classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label1);
        make.left.equalTo(_userNameLabel.mas_right);
    }];
    
    UILabel *label2= [[UILabel alloc]init];
    label2.text = @"的待办消息";
    label2.font = JCFont12;
    label2.textColor =  JCColorMidGray;
    [backView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label1).offset(0);
        make.left.equalTo(_classLabel.mas_right).offset(0);
    }];

    
    _messageLabel = [[UILabel alloc]init];
    _messageLabel.font = JCFont13;
    _messageLabel.textColor = BlackColor;
    [backView addSubview:_messageLabel];
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.right.equalTo(backView.mas_right).offset(-10);
        make.top.equalTo(_classLabel.mas_bottom).offset(6);
    }];
    
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = JCColorMidGray;
    [backView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backView.mas_bottom).offset(-5);
        make.right.equalTo(backView.mas_right).offset(-5);
    }];
    
    
}

@end
