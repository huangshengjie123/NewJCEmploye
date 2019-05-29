//
//  InterestIncomeDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/28.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "InterestIncomeDetailsViewController.h"
#import "DataModels.h"
#import "Macro.h"


@interface InterestIncomeDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation InterestIncomeDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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
