//
//  NewDealerTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDealerTableViewCell.h"
#import "Macro.h"
@implementation NewDealerTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        
    }
    return self;
}

-(void)addViews {
    
    _baseLabel = [[UILabel alloc]init];
    _baseLabel.textColor = JCColorBlack;
    _baseLabel.font = JCFont15;
    [self addSubview:_baseLabel];
    [_baseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont15;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel.hidden = YES;
    
    
    _textField = [[UITextField alloc]init];
    _textField.textColor = JCColorBlack;
    _textField.font = JCFont15;
    _textField.textAlignment =  NSTextAlignmentRight;
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(@(200));
        make.centerY.equalTo(self);
    }];
    _textField.hidden = YES;

    
    _cellButton = [[UIButton alloc]init];
    [self addSubview:_cellButton];
    [_cellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.height.equalTo(@(30));
    }];
    _cellButton.hidden = YES;
    
    _buttonLabel = [[UILabel alloc]init];
    [_cellButton addSubview:_buttonLabel];
    [_buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_cellButton);
        make.right.equalTo(_cellButton);
    }];
    _buttonLabel.textColor = JCColorBlue;
    _buttonLabel.font = JCFont15;
    _buttonLabel.hidden = YES;
    _buttonLabel.text = @"请选择";

    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo (self);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(1));
    }];
}


@end
