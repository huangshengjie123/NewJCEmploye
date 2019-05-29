//
//  JCSelectView.h
//  JCEmployee
//
//  Created by 让让 on 2017/9/2.
//  Copyright © 2017年 xiaoqiTnT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JCSelectViewDelegate <NSObject>

-(void)buttonAction:(int) buttonNum;

@end

@interface JCSelectView : UIView

@property (nonatomic,assign) float buttonW;
@property (nonatomic,assign) float buttonH;
@property (nonatomic,strong) NSArray *buttonArray;

@property (nonatomic,assign) int selectedButtonNum;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) NSMutableArray *buttonObjectArray;
@property (nonatomic,weak)id<JCSelectViewDelegate>delegate;



- (id)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray;



@end
