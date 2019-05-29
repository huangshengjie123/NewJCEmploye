//
//  MembersTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MembersTableViewCell.h"
#import "Macro.h"
@implementation MembersTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCColorWithe ;
    }
    return self;
}

-(void)addViews {
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = JCColorBlack;
    _titleLabel.font = JCFont14;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
    
    _mainLabel = [[UILabel alloc]init];
    _mainLabel.textColor = JCColorBlue;
    _mainLabel.font = JCFont14;
    [self addSubview:_mainLabel];
    [_mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(5);
        make.centerY.equalTo(self);
    }];
    
    
    _button = [[UIButton alloc]init];
    [_button setImage:[UIImage imageNamed:@"报表"] forState:UIControlStateNormal];
//    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@(33));
        make.width.equalTo(@(38));
    }];
    
    
}

-(void)buttonAction {
    
    
}

@end
