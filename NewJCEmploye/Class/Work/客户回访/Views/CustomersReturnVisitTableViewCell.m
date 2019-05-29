//
//  CustomersReturnVisitTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CustomersReturnVisitTableViewCell.h"
#import "Macro.h"
@implementation CustomersReturnVisitTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = JCFont14;
    _nameLabel.textColor = JCColorBlack;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    
    _phoneButton = [[UIButton alloc]init];
    _phoneButton.backgroundColor = [UIColor clearColor];
    [self addSubview:_phoneButton];
    [_phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_nameLabel);
        make.height.equalTo(@(33));
        make.width.equalTo(@(100));
    }];
    _phoneButton.titleLabel.font = JCFont14;
    [_phoneButton setTitleColor:JCColorBlue forState:UIControlStateNormal];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
        make.top.equalTo(_nameLabel.mas_bottom).offset(7);
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = JCFont14;
    _addressLabel.textColor = JCColorBlack;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(JCScreen_Width -20));
        make.top.equalTo(lineView.mas_bottom).offset(7);
    }];
    
//    UILabel *label = [[UILabel alloc]init];
//    label.text = @"上次回访时间:";
//    label.font = JCFont14;
//    label.textColor = JCColorBlack;
//    [self addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(10);
//        make.top.equalTo(_addressLabel.mas_bottom).offset(7);
//    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = JCFont14;
    _timeLabel.textColor = JCColorBlack;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(JCScreen_Width -20));
        make.top.equalTo(_addressLabel.mas_bottom).offset(7);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(JCScreen_Width -20));
        make.top.equalTo(_timeLabel.mas_bottom).offset(7);
    }];
    
//    _content2Label = [[UILabel alloc]init];
//    _content2Label.font = JCFont14;
//    _content2Label.textColor = JCColorBlack;
//    [self addSubview:_content2Label];
//    [_content2Label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(10);
//        make.width.equalTo(@(JCScreen_Width -20));
//        make.top.equalTo(_contentLabel.mas_bottom).offset(7);
//    }];
    
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
}

@end
