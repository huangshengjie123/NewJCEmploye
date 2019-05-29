//
//  SellTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SellTableViewCell.h"
#import "Macro.h"
@implementation SellTableViewCell

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
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    [topView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(self).offset(10);
    }];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor =  [UIColor whiteColor];
    _stateLabel.backgroundColor =  JCColorMidGray;
    _stateLabel.font = [UIFont boldSystemFontOfSize:12];
    [topView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(_nameLabel.mas_right).offset(5);
    }];
    _stateLabel.layer.masksToBounds = YES;
    _stateLabel.layer.cornerRadius = 2;
    
    
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = JCColorBlack;
    _phoneLabel.font = JCFont14;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
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
    timeLabel.textColor = JCColorBlack;
    timeLabel.text = @"时间:";
    timeLabel.font = JCFont14;
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView2.mas_bottom).offset(8);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(timeLabel);
        make.left.equalTo(timeLabel.mas_right);
    }];
    
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.text = @"地址:";
    addressLabel.textColor = JCColorBlack;
    addressLabel.font = JCFont14;
    [self addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(timeLabel.mas_bottom).offset(8);
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressLabel.mas_right).offset(0);
        make.centerY.equalTo(addressLabel);
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"物品:";
    label3.textColor = JCColorBlack;
    label3.font = JCFont14;
    [self addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(addressLabel.mas_bottom).offset(6);
        make.width.equalTo(@(36));
    }];
    
    _itemsLabel = [[UILabel alloc]init];
    _itemsLabel.textColor = JCColorBlack;
    _itemsLabel.font = JCFont14;
    [self addSubview:_itemsLabel];
    [_itemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.right.equalTo(self).offset(-10);
        make.left.equalTo(label3.mas_right);
      
        make.top.equalTo(label3.mas_top);
    }];
    _itemsLabel.numberOfLines = 1;
    
}

@end
