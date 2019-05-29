//
//  ReturnGoodsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/24.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReturnGoodsTableViewCell.h"
#import "Macro.h"
@implementation ReturnGoodsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCColorWithe;
    }
    return self;
}

-(void)addViews {
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    _statusLabel = [[UILabel alloc]init];
    _statusLabel.textColor = JCColorBlue;
    _statusLabel.font = JCFont14;
    [self addSubview:_statusLabel];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_nameLabel.mas_bottom).offset(8);
        make.height.equalTo(@(1));
    }];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"金额:";
    label.textColor = JCColorBlack;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(10);
    }];

    _numLabel = [[UILabel alloc]init];
    _numLabel.textColor = JCColorBlack;
    _numLabel.font = JCFont14;
    [self addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(10);
        make.centerY.equalTo(label);
    }];
    
    UIView *line2View = [[UIView alloc]init];
    line2View.backgroundColor = JCBackgroundColor;
    [self addSubview:line2View];
    [line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
}

@end
