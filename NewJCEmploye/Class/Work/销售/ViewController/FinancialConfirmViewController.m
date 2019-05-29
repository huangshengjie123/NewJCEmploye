//
//  FinancialConfirmViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/23.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "FinancialConfirmViewController.h"
#import "Macro.h"
#import "DataModels.h"
@interface FinancialConfirmViewController ()
@property (nonatomic,strong )UITextField *cashTextfield; //现金
@property (nonatomic,strong )UITextField *transferTextfield;//转账
@property (nonatomic,strong )UITextField *creditTextfield;//信用卡
@property (nonatomic,strong )UITextField *checkTextfield;//支票

@end

@implementation FinancialConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.title = @"选择回款方式";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
    
    
    
}

-(void)addViews {
    UILabel*label1 = [[UILabel alloc]init];
    label1.text = @"现金:";
    label1.font = JCFont15;
    label1.textColor = JCColorBlack;
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.left.equalTo(self.view).offset(10);
    }];
    
    _cashTextfield = [[UITextField alloc]init];
    _cashTextfield.placeholder = @"请输入现金回款金额";
    _cashTextfield.textColor = JCColorBlack;
    _cashTextfield.font = JCFont15;
    [self.view addSubview:_cashTextfield];
    [_cashTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.right.equalTo(self.view).offset(-10);
        make.left.equalTo(label1.mas_right).offset(10);
    }];
    
    UILabel*label2 = [[UILabel alloc]init];
    label2.text = @"现金:";
    label2.font = JCFont15;
    label2.textColor = JCColorBlack;
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
    }];
    
    _transferTextfield = [[UITextField alloc]init];
    _transferTextfield.placeholder = @"请输入现金回款金额";
    _transferTextfield.textColor = JCColorBlack;
    _transferTextfield.font = JCFont15;
    [self.view addSubview:_cashTextfield];
    [_cashTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.left.equalTo(label1.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-10);
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
