//
//  RepertoryChooseTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "RepertoryChooseTableViewCell.h"
#import "Macro.h"
#import "MBProgressHUD.h"
@implementation RepertoryChooseTableViewCell 

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
     _num = 1;
     _maxNum = 1;
    
    _kImageView = [[UIImageView alloc]init];
    [_kImageView setImage:[UIImage imageNamed:@"未选中"]];
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self);
        make.height.width.equalTo(@(20));
    }];
    _kImageView.userInteractionEnabled = YES;
    //初始化一个手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewAction)];
    [_kImageView addGestureRecognizer:tapGesture];
    _isSelected = NO;
  
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont14;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(8);
        make.centerY.equalTo(_kImageView);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(5);
        make.centerY.equalTo(_titleLabel);
    }];
    
    
    _rightButton = [[UIButton alloc]init];
    [_rightButton setImage:[UIImage imageNamed:@"加"] forState:UIControlStateNormal];
    [self addSubview:_rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.height.width.equalTo(@(30));
    }];
    [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _numTextField = [[UITextField alloc]init];
    _numTextField.textColor = JCColorBlack;
    _numTextField.delegate = self;
    _numTextField.textAlignment = NSTextAlignmentCenter;
    _numTextField.text = [NSString stringWithFormat:@"%d",_num];
    [self addSubview:_numTextField];
    [_numTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_rightButton.mas_left).offset(0);
        make.centerY.equalTo(_rightButton);
        make.width.equalTo(@(40));
        make.height.equalTo(@(30));
    }];
    
    _leftButton = [[UIButton alloc]init];
    [_leftButton setImage:[UIImage imageNamed:@"减"] forState:UIControlStateNormal];
    [self addSubview:_leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_numTextField.mas_left).offset(0);
        make.centerY.equalTo(self);
        make.height.width.equalTo(@(30));
    }];
    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    _leftButton.hidden = YES;
    _rightButton.hidden = YES;
    _numTextField.hidden = YES;
    
}

//图片按钮
-(void)imageViewAction {
    
    if (_isSelected == NO) {
        _isSelected = YES;
        [_kImageView setImage:[UIImage imageNamed:@"选中"]];
        _leftButton.hidden = NO;
        _rightButton.hidden = NO;
        _numTextField.hidden = NO;

    }else {
        _isSelected = NO;
        [_kImageView setImage:[UIImage imageNamed:@"未选中"]];
        _leftButton.hidden = YES;
        _rightButton.hidden = YES;
        _numTextField.hidden = YES;
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField.text.intValue >0) {
        _num = textField.text.intValue;
    }else {
        _num = 1;
    }
    
}


-(void)leftButtonAction {
    
    if (_num == 1) {

   
        
    }else {
        _num = _num - 1;
        
        if (_num == 1) {

        }
    }
    
    _numTextField.text = [NSString stringWithFormat:@"%d",_num];
}

-(void)rightButtonAction {
    
    if (_maxNum == 1) {
        _num = _num + 1;
        
        _numTextField.text = [NSString stringWithFormat:@"%d",_num];
    }else {
        
        if (_num < _maxNum) {
            _num = _num + 1;
            
            _numTextField.text = [NSString stringWithFormat:@"%d",_num];
        }else{
            //  选择过多的action
            
        }
        
    }
    
    
}

@end
