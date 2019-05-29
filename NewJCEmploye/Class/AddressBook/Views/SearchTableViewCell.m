//
//  SearchTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Macro.h"
#import "DataModels.h"

@implementation SearchTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _kImageView = [[UIImageView alloc]init];
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).offset(15);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = BlackColor;
    _nameLabel.font = JCFont12;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.top.equalTo(_kImageView.mas_top).offset(4);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = BlackColor;
    _phoneLabel.font = JCFont12;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(6);
    }];
    
    _button = [[UIButton alloc]init];
    [_button setImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-20);
        make.centerY.equalTo(self);
        make.height.width.equalTo(@(30));
    }];
    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
}
//  JCModel_employeeInfoData
- (void)configCellWithModel:(JCModel_employeeInfoData *)model {
    
    JCModel_employeeInfoData *userData = model;
    if ([userData.sex  isEqual: @"0"])
    {
        self.kImageView.image = [UIImage imageNamed:@"默认头像男"];
    }
    else
    {
        self.kImageView.image = [UIImage imageNamed:@"默认头像女"];
    }
    self.nameLabel.text = [NSString stringWithFormat:@"%@",userData.name];
    self.phoneLabel.text = [NSString stringWithFormat:@"%@",userData.mbPhone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)buttonAction {
    
    NSMutableString *str=[[NSMutableString alloc]initWithFormat:@"tel:%@",_phoneLabel.text];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    

}

@end
