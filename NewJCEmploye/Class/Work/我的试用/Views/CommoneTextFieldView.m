//
//  CommoneTextFieldView.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CommoneTextFieldView.h"
#import "Macro.h"
@implementation CommoneTextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addViews];
        self.backgroundColor = JCColorWithe;
    }
    return self;
}

-(void)addViews {
 
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont14;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _textField = [[UITextField alloc]init];
    _textField.font = JCFont14;
    _textField.textColor = JCColorBlack;
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(80);
        make.centerY.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];
    
}
@end
