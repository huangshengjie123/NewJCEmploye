//
//  OtherIncomeTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/8.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "OtherIncomeTableViewCell.h"
#import "Macro.h"
@implementation OtherIncomeTableViewCell

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
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = JCColorBlack;
    _titleLabel.font = JCFont14;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
    }];
    
    _useNameLabel = [[UILabel alloc]init];
    _useNameLabel.textColor = JCColorBlack;
    _useNameLabel.font = JCFont14;
    [self addSubview:_useNameLabel];
    [_useNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(10);
        make.centerY.equalTo(_titleLabel);
    }];
    
    _stastLabel = [[UILabel alloc]init];
    _stastLabel.textColor = JCColorBlue;
    _stastLabel.font = JCFont14;
    [self addSubview:_stastLabel];
    [_stastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_titleLabel);
    }];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.font = [UIFont boldSystemFontOfSize:16];
    [self addSubview:_priceLabel];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = JCColorMidGray;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_priceLabel.mas_bottom).offset(8);
    }];
    
    UIView *lineView= [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(_timeLabel.mas_bottom).offset(8);
        make.height.equalTo(@(1));
    }];
                            
    _itemsLabel = [[UILabel alloc]init];
    _itemsLabel.textColor= JCColorBlack;
    _itemsLabel.font = JCFont14;
    [self addSubview:_itemsLabel];
    [_itemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(8);

    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.height.equalTo(@(10));
        make.bottom.equalTo(self);
    }];
    
}

@end
