//
//  BaseNavigationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
//        button.frame = CGRectMake(0, 0, 33, 33);
//        // 让按钮内部的所有内容左对齐
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        // 修改导航栏左边的item
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//        // 隐藏tabbar
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
//    [super pushViewController:viewController animated:animated];
//}
//
//- (void)back{
//    
//    [self popViewControllerAnimated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
