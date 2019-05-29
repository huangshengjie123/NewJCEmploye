//
//  RecyclingTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/16.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RecyclingTableViewCell.h"
#import "Macro.h"
@implementation RecyclingTableViewCell

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
    _titleLabel.textColor = JCColorBlue;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _button = [[UIButton alloc]init];
    [_button setTitle:@"回收" forState:UIControlStateNormal];
    [_button setTitleColor:JCColorWithe forState:UIControlStateNormal];
    _button.backgroundColor = JCColorBlue;
    _button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(@(50));
        make.height.equalTo(@(25));
        make.centerY.equalTo(self);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
}

@end
