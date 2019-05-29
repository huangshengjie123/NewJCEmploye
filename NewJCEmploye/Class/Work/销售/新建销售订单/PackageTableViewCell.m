//
//  PackageTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PackageTableViewCell.h"
#import "Macro.h"
@implementation PackageTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = JCColorBlue;
    titleLabel.font = JCFont14;
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(5);
        make.height.equalTo(@(16));
    }];
    _titleLabel = titleLabel;
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.font = JCFont14;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-7);
    }];
    _contentLabel.numberOfLines = 0;
    [_contentLabel sizeToFit];

    
  
    
    UILabel *label = [[UILabel alloc]init];
    label.font = JCFont14;
    label.textColor = JCColorMidGray;
    label.text = @"￥";
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(@(16));
        make.top.equalTo(_titleLabel);
    }];
    
    _totalLabel = [[UILabel alloc]init];
    _totalLabel.textColor = JCColorBlack;
    _totalLabel.font = JCFont14;
    [self addSubview:_totalLabel];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(label.mas_left).offset(-1);
        make.height.equalTo(@(16));
        make.top.equalTo(_titleLabel);
        
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.contentLabel sizeToFit];
}

@end
