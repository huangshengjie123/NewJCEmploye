//
//  WarningTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WarningTableViewCell.h"
#import "Macro.h"
@implementation WarningTableViewCell
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
    _nameLabel.textColor = JCColorBlack ;
    _nameLabel.font = JCFont15;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(7);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = JCColorBlack;
    _phoneLabel.font = JCFont15;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
        make.top.equalTo(_nameLabel.mas_bottom).offset(7);
    }];
    
    UILabel *label1 =[[UILabel alloc]init];
    label1.text = @"地址:";
    label1.textColor = JCColorMidGray;
    label1.font = JCFont15;
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(7);
    }];
    
    _addressLabel  = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont15;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self).offset(-10);
        make.left.equalTo(label1.mas_right).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(7);
    }];
    
    UILabel *label2= [[UILabel alloc]init];
    label2.textColor = JCColorMidGray;
    label2.font = JCFont15;
    label2.text = @"卡号:";
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(label1.mas_bottom).offset(7);
    }];
    
    _cardNumLabel  =[[UILabel alloc]init];
    _cardNumLabel.textColor = JCColorBlack;
    _cardNumLabel.font = JCFont15;
    [self addSubview:_cardNumLabel];
    [_cardNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self).offset(-10);
        make.left.equalTo(label1.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    
    UILabel *label3= [[UILabel alloc]init];
    label3.textColor = JCColorMidGray;
    label3.font = JCFont15;
    label3.text = @"水量剩余:";
    [self addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(7);
    }];
    
    _waterNumLabel = [[UILabel alloc]init];
    _waterNumLabel.textColor = JCColorBlack;
    _waterNumLabel.font = JCFont15;
    [self addSubview:_waterNumLabel];
    [_waterNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.right.equalTo(self).offset(-10);
         make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(label3);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
    
    
}

@end
