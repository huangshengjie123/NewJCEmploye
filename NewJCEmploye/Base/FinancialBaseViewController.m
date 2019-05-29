//
//  FinancialBaseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/7.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "FinancialBaseViewController.h"
#import "Macro.h"
@interface FinancialBaseViewController ()<UISearchBarDelegate>

@end

@implementation FinancialBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCBackgroundColor;
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorBlue;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(150));
    }];
    _topView = topView;
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = JCColorWithe;
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [topView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView);
        make.top.equalTo(topView).offset(60);
    }];
    
    _leftButton = [[UIButton alloc]init];
    [_leftButton setImage:[UIImage imageNamed:@"新返回"] forState:UIControlStateNormal];
    [topView addSubview:_leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.centerY.equalTo(_titleLabel);
    }];
    
    _rightButton = [[UIButton alloc]init];
    [_rightButton setImage:[UIImage imageNamed:@"新加号"] forState:UIControlStateNormal];
    [topView addSubview:_rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(-10);
        make.centerY.equalTo(_titleLabel);
    }];
    
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.delegate =self;
//    _searchBar.backgroundColor = JCColorBlue;
    _searchBar.barTintColor = JCColorBlue;
    [topView addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.top.equalTo(_titleLabel.mas_bottom).offset(12);
        make.right.equalTo(topView.mas_right).offset(-10);
        make.height.equalTo(@(44));
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = JCColorBlue;
    [topView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_searchBar.mas_top).offset(2);
        make.right.left.equalTo(topView);
        make.height.equalTo(@(5));
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCColorBlue;
    [topView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_searchBar.mas_bottom).offset(-2);
        make.right.left.equalTo(topView);
        make.height.equalTo(@(10));
    }];
    
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
