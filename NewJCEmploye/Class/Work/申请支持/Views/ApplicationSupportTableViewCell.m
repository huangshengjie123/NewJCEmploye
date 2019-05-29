//
//  ApplicationSupportTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ApplicationSupportTableViewCell.h"
#import "Macro.h"
@implementation ApplicationSupportTableViewCell

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
    _nameLabel.font = JCFont14;
    _nameLabel.textColor = JCColorBlack;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(7);
    }];
    
    _stastLabel = [[UILabel alloc]init];
    _stastLabel.font = JCFont14;
    _stastLabel.textColor = JCColorBlue;
    [self addSubview:_stastLabel];
    [_stastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(5);
        make.centerY.equalTo(_nameLabel);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont14;
    _phoneLabel.textColor = JCColorBlack;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(7);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_nameLabel.mas_bottom).offset(7);
        make.height.equalTo(@(1));
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(7);
        make.right.equalTo(self).offset(-10);
    }];
    
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_addressLabel.mas_bottom).offset(7);
    }];
    
    _contentLabel1 = [[ UILabel alloc]init];
    _contentLabel1.font = JCFont14;
    _contentLabel1.textColor = JCColorBlack;
    [self addSubview:_contentLabel1];
    [_contentLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(_timeLabel.mas_bottom).offset(7);
    }];
    
    _contentLabel2 = [[UILabel alloc]init];
    _contentLabel2.font = JCFont14;
    _contentLabel2.textColor = JCColorBlack;
    [self addSubview:_contentLabel2];
    [_contentLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(_contentLabel1.mas_bottom).offset(7);
    }];
    
    
    UIView *lineVie2= [[UIView alloc]init];
    lineVie2.backgroundColor = JCBackgroundColor;
    [self addSubview:lineVie2];
    [lineVie2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
}

@end
