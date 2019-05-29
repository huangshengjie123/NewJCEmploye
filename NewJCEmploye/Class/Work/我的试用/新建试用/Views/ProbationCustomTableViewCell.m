//
//  ProbationCustomTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ProbationCustomTableViewCell.h"
#import "Macro.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
@implementation ProbationCustomTableViewCell

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
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@(7));
    }];

    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(lineView.mas_bottom);
        make.height.equalTo(@(30));
    }];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = JCFont14;
    _nameLabel.textColor = JCColorBlack;
    [topView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.centerY.equalTo(topView);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont14;
    _phoneLabel.textColor = JCColorBlue;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(topView);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCColorGray;
    [topView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topView);
        make.bottom.equalTo(topView.mas_bottom);
        make.height.equalTo(@(1));
    }];
    

    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLabel);
        make.right.equalTo(_phoneLabel);
        make.top.equalTo(_phoneLabel.mas_top).offset(-5);
        make.bottom.equalTo(_phoneLabel.mas_bottom).offset(5);
    }];
    _button = button;
    
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView2).offset(6);
    }];
    
    
    
    
}


@end
