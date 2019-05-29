//
//  InAndOutTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "InAndOutTableViewCell.h"
#import "Macro.h"
@implementation InAndOutTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)addViews {
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(lineView.mas_bottom);
        make.height.equalTo(@(38));
    }];
    
    _applicantName = [[UILabel alloc]init];
    _applicantName.textColor = JCColorBlack;
    _applicantName.font = JCFont14;
    [topView addSubview:_applicantName];
    [_applicantName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.centerY.equalTo(topView);
    }];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.font = JCFont12;
    [topView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(-20);
        make.top.equalTo(topView.mas_top).offset(5);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = JCFont12;
    _timeLabel.textColor = MidGrayColor;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_stateLabel.mas_bottom).offset(4);
        make.right.equalTo(topView).offset(-10);
    }];
    
    UIView *line2View = [[UIView alloc]init];
    line2View.backgroundColor = JCColorGray;
    [self addSubview:line2View];
    [line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(topView.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"用途:";
    label.font = JCFont14;
    label.textColor = JCColorBlack;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(line2View.mas_bottom).offset(6);
    }];
    
    _useLaebl = [[UILabel alloc]init];
    _useLaebl.textColor = JCColorBlack;
    _useLaebl.font = JCFont14;
    [self addSubview:_useLaebl];
    [_useLaebl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(0);
        make.centerY.equalTo(label);
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"物品:";
    label1.textColor = JCColorBlack;
    label1.font = JCFont14;
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(label.mas_bottom).offset(6);
    }];
    
    _materialLabel = [[UILabel alloc]init];
    _materialLabel.textColor = JCColorBlack;
    _materialLabel.font = JCFont14;
    [self addSubview:_materialLabel];
    [_materialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(label1.mas_right);
        make.top.equalTo(label1.mas_top);
    }];
    _materialLabel.numberOfLines = 1;
    
}
@end
