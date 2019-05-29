//
//  NewProbationCustomTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewProbationCustomTableViewCell.h"
#import "Macro.h"
@implementation NewProbationCustomTableViewCell

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
    _titleLabel.textColor = JCColorBlack;
    _titleLabel.font = JCFont14;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.font = JCFont14;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(10);
        make.centerY.equalTo(_titleLabel);
    }];
    _contentLabel.hidden = YES;
    
    
    _contentTextField = [[UITextField alloc]init];
    _contentTextField.placeholder = @"请输入";
    _contentTextField.font = JCFont14;
    _contentTextField.textColor = JCColorBlack;
    [self addSubview:_contentTextField];
    [_contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(60);
        
        make.centerY.equalTo(self);
        make.height.equalTo(@(40));
    }];
    
    _button = [[UIButton alloc]init];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(60);
        make.right.equalTo(self).offset(0); 
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    _button.hidden = YES;
    
    _buttonLabel = [[UILabel alloc]init];
    _buttonLabel.text = @"请选择";
    _buttonLabel.font = JCFont14;
    _buttonLabel.textColor = JCColorBlue;
    [_button addSubview:_buttonLabel];
    [_buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(80);
        make.centerY.equalTo(_button);
    }];
    
    
}


@end
