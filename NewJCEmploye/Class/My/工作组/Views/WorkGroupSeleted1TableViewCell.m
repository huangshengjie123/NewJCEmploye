//
//  WorkGroupSeleted1TableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupSeleted1TableViewCell.h"
#import "Macro.h"
@implementation WorkGroupSeleted1TableViewCell
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
    
    _nameLabel  = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont15;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _kImageView = [[UIImageView alloc]init];
    _kImageView.image = [UIImage imageNamed:@"确认"];
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.width.height.equalTo(@(20));
        make.centerY.equalTo(self);
    }];
   
    _kImageView .hidden = YES;
    _isSeleted = NO;
    _button = [[UIButton alloc]init];
    _button .backgroundColor = [UIColor clearColor];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

-(void)buttonAction {
    
    
    if (_isSeleted == NO) {
        _kImageView.hidden = NO;
        _isSeleted = YES;
    }else {
         _kImageView.hidden = YES;
        _isSeleted = NO;
    }
}
@end
