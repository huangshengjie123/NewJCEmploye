//
//  NewProbationView.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewProbationView.h"
#import "Macro.h"
@implementation NewProbationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
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
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    _button = [[UIButton alloc]init];
    [_button setTitle:@"请选择" forState:UIControlStateNormal];
    [_button setTitleColor:JCColorBlue forState:UIControlStateNormal];
    _button.titleLabel.font = JCFont14;
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(48);
        make.height.equalTo(@(20));
        make.width.equalTo(@(100));
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = JCColorBlue;
    _contentLabel.font = JCFont14;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(_titleLabel.mas_right).offset(10);
    }];
    
    _contentLabel.hidden = YES;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = GrayColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

@end
