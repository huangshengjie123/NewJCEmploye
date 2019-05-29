//
//  ProbationTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ProbationTableViewCell.h"
#import "Macro.h"
@implementation ProbationTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {

    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self);
        make.height.equalTo(@(10));
    }];
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.equalTo(self);
        make.height.equalTo(@(30));
    }];
    
    _probationerNameLabel = [[UILabel alloc]init];
    _probationerNameLabel.textColor = JCColorBlack;
    _probationerNameLabel.font = JCFont14;
    [topView addSubview:_probationerNameLabel];
    [_probationerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(self).offset(10);
    }];
    
    _probationStateLabel = [[UILabel alloc]init];
    _probationStateLabel.textColor =  [UIColor whiteColor];
    _probationStateLabel.backgroundColor =  JCColorMidGray;
    _probationStateLabel.font = [UIFont boldSystemFontOfSize:12];
    [topView addSubview:_probationStateLabel];
    [_probationStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(_probationerNameLabel.mas_right).offset(5);
    }];
    _probationStateLabel.layer.masksToBounds = YES;
    _probationStateLabel.layer.cornerRadius = 2;
    
    _probationerPhoneLabel = [[UILabel alloc]init];
    _probationerPhoneLabel.textColor = JCColorBlack;
    _probationerPhoneLabel.font = JCFont14;
    [self addSubview:_probationerPhoneLabel];
    [_probationerPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(topView);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = GrayColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(topView.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textColor = JCColorMidGray;
    timeLabel.text = @"时间:";
    timeLabel.font = JCFont14;
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView2.mas_bottom).offset(8);
        make.width.equalTo(@(35));
    }];
    
    _probationStartTimeLabel = [[UILabel alloc]init];
    _probationStartTimeLabel.textColor = JCColorBlack;
    _probationStartTimeLabel.font = JCFont14;
    [self addSubview:_probationStartTimeLabel];
    [_probationStartTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(timeLabel);
        make.left.equalTo(timeLabel.mas_right);
    }];
    
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.text = @"地址:";
    addressLabel.textColor = JCColorMidGray;
    addressLabel.font = JCFont14;
    [self addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(timeLabel.mas_bottom).offset(8);
        make.width.equalTo(@(35));
    }];
    
    _probationAddressLabel = [[UILabel alloc]init];
    _probationAddressLabel.textColor = JCColorBlack;
    _probationAddressLabel.font = JCFont14;
    [self addSubview:_probationAddressLabel];
    [_probationAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressLabel.mas_right).offset(0);
        make.centerY.equalTo(addressLabel);
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"物品:";
    label3.textColor = JCColorMidGray;
    label3.font = JCFont14;
    [self addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(addressLabel.mas_bottom).offset(6);
        make.width.equalTo(@(35));
    }];
    
    _probationItemsLabel = [[UILabel alloc]init];
    _probationItemsLabel.textColor = JCColorBlack;
    _probationItemsLabel.font = JCFont14;
    [self addSubview:_probationItemsLabel];
    [_probationItemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(label3.mas_right);
        make.top.equalTo(label3.mas_top);
    }];
    _probationItemsLabel.numberOfLines = 1;

}
@end
