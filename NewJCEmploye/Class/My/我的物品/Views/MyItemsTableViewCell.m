//
//  MyItemsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyItemsTableViewCell.h"
#import "Macro.h"
@implementation MyItemsTableViewCell

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
    
    _titelLabel = [[UILabel alloc]init];
    _titelLabel.font = JCFont14;
    _titelLabel.textColor = JCColorBlack;
    [self addSubview:_titelLabel];
    [_titelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

@end
