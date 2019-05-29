//
//  MyCustomer2TableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyCustomer2TableViewCell.h"
#import "Macro.h"
@implementation MyCustomer2TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        
    }
    return self;
}

-(void)addViews {
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont15;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont15;
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset (50);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1));
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    
    
}
@end
