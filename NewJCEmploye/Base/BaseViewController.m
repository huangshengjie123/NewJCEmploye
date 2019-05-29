//
//  BaseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "Macro.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:JCColorBlue}];
}

-(void)addViews {
    
    
    
}

-(void)showInfo:(NSString *)string {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
    [self.view addSubview:hud];
    hud.label.text =string;
    hud.mode = MBProgressHUDModeText;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//15949191318
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
