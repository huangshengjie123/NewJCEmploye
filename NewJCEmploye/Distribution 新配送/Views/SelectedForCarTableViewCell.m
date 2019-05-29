//
//  SelectedForCarTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SelectedForCarTableViewCell.h"
#import "Macro.h"
@implementation SelectedForCarTableViewCell

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
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = JCFont15;
    _nameLabel.textColor = JCColorBlack;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(5));
        make.bottom.equalTo(self);
    }];
    
    
    
    
}

@end
