//
//  DealerBaseTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerBaseTableViewCell.h"
#import "Macro.h"
@implementation DealerBaseTableViewCell

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
    _nameLabel.font = JCFont15;
    _nameLabel.textColor = JCColorBlack;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(7);
    }];
    
    _stastLabel = [[UILabel alloc]init];
    _stastLabel.font = JCFont15;
    _stastLabel.textColor = JCColorBlue;
    [self addSubview:_stastLabel];
    [_stastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_nameLabel);
        make.left.equalTo(_nameLabel.mas_right).offset(15);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont15;
    _phoneLabel.textColor = JCColorMidGray;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_nameLabel);
        make.right.equalTo(self).offset(-10);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(8);
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = JCFont15;
    _addressLabel.textColor = JCColorBlack;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(7);
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(10));
        make.top.equalTo(_addressLabel.mas_bottom).offset(8);
    }];
    
    
    
    
}

@end
