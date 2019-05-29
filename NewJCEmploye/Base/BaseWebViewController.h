//
//  BaseWebViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  基础Web

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseWebViewController : BaseViewController <UIWebViewDelegate>

@property (nonatomic,strong) NSString *webUrlString;

@end
