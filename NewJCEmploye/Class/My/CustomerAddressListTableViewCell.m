//
//  CustomerAddressListTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CustomerAddressListTableViewCell.h"
#import "Macro.h"
@implementation CustomerAddressListTableViewCell

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
    
    
    _contenLabel = [[UILabel alloc]init];
    _contenLabel.font = JCFont14;
    _contenLabel.textColor = JCColorBlack;
    [self addSubview:_contenLabel];
    [_contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
    }];
    _contenLabel.numberOfLines = 0;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = GrayColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}

@end
