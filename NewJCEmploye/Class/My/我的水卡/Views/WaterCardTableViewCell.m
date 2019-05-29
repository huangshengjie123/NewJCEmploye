//
//  WaterCardTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WaterCardTableViewCell.h"
#import "Macro.h"
@implementation WaterCardTableViewCell
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
 
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = JCColorWithe;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.equalTo(@(150));
    }];
    view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(-4, 4);
    view.layer.shadowOpacity = 0.8;
    view.layer.shadowRadius = 10.0;
    view.layer.cornerRadius = 10.0;
    view.clipsToBounds = NO;
    
    UIImageView *logoImageView = [[UIImageView alloc]init];
    logoImageView.image = [UIImage imageNamed:@"JC_logo"];
    logoImageView.contentMode = UIViewContentModeScaleAspectFill;
    [view addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(20);
        make.top.equalTo(view).offset(10);
        make.height.equalTo(@(20));
        make.width.equalTo(@(20));
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont16;
    _titleLabel.textColor = JCColorBlack;
    [view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImageView.mas_right).offset(20);
        make.centerY.equalTo(logoImageView);
    }];
    
    
    _numLabel = [[UILabel alloc]init];
   
    _numLabel.font = [UIFont boldSystemFontOfSize:45];
    _numLabel.textColor = JCColorBlack;
    [view addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(20);
//        make.top.equalTo(_titleLabel.mas_bottom).offset(15);
        make.centerY.equalTo(view);
    }];
    
    UILabel *cardIDLabel = [[UILabel alloc]init];
    cardIDLabel.font = JCFont12;
    cardIDLabel.textColor = JCColorMidGray;
    cardIDLabel.text = @"Card ID:";
    [view addSubview:cardIDLabel];
    [cardIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-10);
        make.left.equalTo(view.mas_left).offset(10);
    }];
    
    _cardID = [[UILabel alloc]init];
    _cardID.textColor = JCColorMidGray;
    _cardID.font = JCFont12;
    [view addSubview:_cardID];
    [_cardID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardIDLabel.mas_right).offset(10);
        make.centerY.equalTo(cardIDLabel);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"二维码"] forState:UIControlStateNormal];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@(40));
        make.width.equalTo(@(40));
    }];
    
    
}
    

@end
