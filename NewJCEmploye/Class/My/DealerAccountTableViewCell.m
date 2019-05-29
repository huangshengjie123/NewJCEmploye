//
//  DealerAccountTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerAccountTableViewCell.h"
#import "Macro.h"
@implementation DealerAccountTableViewCell

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
    
    _typeLabel = [[UILabel alloc]init];
    _typeLabel.font = JCFont15;
    [self addSubview:_typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = JCFont15;
    _timeLabel.textColor = JCColorMidGray;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_typeLabel);
        make.right.equalTo(self).offset(-10);
    }];
    
    UILabel *label1 =[[UILabel alloc]init];
    label1.textColor = JCColorMidGray;
    label1.font = JCFont15;
    label1.text = @"金额:";
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_typeLabel.mas_bottom).offset(15);
    }];
    
    _amountLabel = [[UILabel alloc]init];
    _amountLabel.font = JCFont15;
    _amountLabel.textColor = JCColorBlack;
    [self addSubview:_amountLabel];
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.left.equalTo(label1.mas_right).offset(10);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorMidGray;
    label2.font = JCFont15;
    label2.text = @"物品:";
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(label1.mas_bottom).offset(8);
    }];
    
    
    _itemLabel = [[UILabel alloc]init];
    _itemLabel.font = JCFont15;
    _itemLabel.textColor = JCColorBlack;
    [self addSubview:_itemLabel];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    
    UIView *lineView= [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(5));
        make.left.right.equalTo(self);
    }];
    
    
}
@end
