//
//  StockBaseTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "StockBaseTableViewCell.h"
#import "Macro.h"
@implementation StockBaseTableViewCell

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
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorBlue;
    _stateLabel.font = JCFont14;
    [self addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorMidGray;
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
        make.right.left.equalTo(self);
        make.top.equalTo(_nameLabel.mas_bottom).offset(8);
        make.height.equalTo(@(1));
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"类型:";
    label1.textColor = JCColorMidGray;
    label1.font = JCFont14;
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(8);
    }];
    
    _typeLabel = [[UILabel alloc]init];
    _typeLabel.textColor = JCColorBlack;
    _typeLabel.font = JCFont14;
    [self addSubview:_typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(label1.mas_right).offset(10);
    }];
    
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"产品:";
    label2.textColor = JCColorMidGray;
    label2.font = JCFont14;
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(5);
        make.left.equalTo(self).offset(10);
    }];
    
    
    _itemLabel = [[UILabel alloc]init];
    _itemLabel.textColor = JCColorBlack;
    _itemLabel.font = JCFont14;
    [self addSubview:_itemLabel];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(8));
    }];
    
}

@end
