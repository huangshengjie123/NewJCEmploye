//
//  JCSelectView.m
//  JCEmployee
//
//  Created by 让让 on 2017/9/2.
//  Copyright © 2017年 xiaoqiTnT. All rights reserved.
//

#import "JCSelectView.h"
#import "Masonry.h"
#import "Macro.h"

@implementation JCSelectView

- (id)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        
        _buttonW = frame.size.width / titleArray.count;
        _buttonH = frame.size.height;
        _buttonArray = titleArray;
        [self addViewsWithNumButton:(int)titleArray.count];

    }
    return self;
}

-(void)addViewsWithNumButton:(int)num {
    
    
    _buttonObjectArray = [NSMutableArray arrayWithCapacity:20];

    _selectedButtonNum = 0;
    
    for (int i = 0; i < num; i ++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0 + i *_buttonW , 0, _buttonW, _buttonH)];
        [self addSubview:button];
        button.tag = i;
        button.backgroundColor = JCColorBlue;
        [button setTitle:_buttonArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = JCFont14;
        button.backgroundColor = JCColorWithe;
        if (_selectedButtonNum == i) {
            [button setTitleColor:JCColorBlue forState:UIControlStateNormal];

        }else {
            [button setTitleColor:JCColorBlack forState:UIControlStateNormal];
        }
        
        [button addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonObjectArray addObject:button];
    }
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 36.5, _buttonW, 2.5)];
    _lineView.backgroundColor = BlueColor;
    [self addSubview:_lineView];

}


-(void)mapBtnClick:(UIButton *)sender{

    //遍历所有button
    for (UIButton *btn in _buttonObjectArray) {
        if (btn.tag == sender.tag) {
            [btn setTitleColor:JCColorBlue forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:JCColorBlack forState:UIControlStateNormal];
        }
    }

    [UIView animateWithDuration:0.3f animations:^{
        [_lineView setFrame:CGRectMake(0 + (int)sender.tag * _buttonW, 36.5, _buttonW, 3.5)];
    }];
    
    //代理
    [self.delegate buttonAction:(int)sender.tag];
    
}


//根据外面需求改变标题
-(void)ModifyButtonTitle:(NSArray *)array{
    
    
    
}




@end
