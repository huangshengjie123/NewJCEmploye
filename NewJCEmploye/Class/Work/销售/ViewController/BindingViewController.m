//
//  BindingViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BindingViewController.h"
#import "Macro.h"
#import "SellDetailsViewController.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
@interface BindingViewController ()<WCQRCodeDelegate>
@property(nonatomic,strong) UITextField *textField;

@end

@implementation BindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addViews];
}

-(void)addViews {
    
    UIView *midView = [[UIView alloc]init];
    midView.backgroundColor = JCColorWithe;
    [self.view addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(210));
        make.height.equalTo(@(100));
        make.centerX.centerY.equalTo(self.view);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"填写要绑定的卡号";
    titleLabel.textColor = JCColorBlue;
    titleLabel.font = JCFont14;
    [midView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(midView);
        make.top.equalTo(midView.mas_top).offset(5);
    }];
    
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = @"输入卡号";
    [midView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(midView.mas_left).offset(10);
        make.right.equalTo(midView.mas_right).offset(-10);
        make.height.equalTo(@(33));
        make.top.equalTo(titleLabel.mas_bottom).offset(6);
    }];
    textField.textColor = JCColorBlack;
    textField.font = JCFont14;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    _textField = textField;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [midView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(midView.mas_bottom).offset(-5);
        make.width.equalTo(@(90));
        make.right.equalTo(midView.mas_right).offset(-10);
        make.height.equalTo(@(33));
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor = JCColorWithe;
    lable.text  = @"确定";
    lable.font = JCFont14;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    
    UIButton *sweepButton = [[UIButton alloc]init];
    sweepButton.backgroundColor = JCColorBlue ;
    [midView addSubview:sweepButton];
    [sweepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(midView.mas_bottom).offset(-5);
        make.width.equalTo(@(90));
        make.left.equalTo(midView.mas_left).offset(10);
        make.height.equalTo(@(33));
    }];
    [sweepButton addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    UILabel *sweepLabel = [[UILabel alloc]init];
    sweepLabel.textColor = JCColorWithe;
    sweepLabel.font = JCFont14;
    sweepLabel.text = @"扫码";
    [sweepButton addSubview:sweepLabel];
    [sweepLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(sweepButton);
    }];
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 2.5f;
    
    sweepButton.layer.masksToBounds  = YES;
    sweepButton.layer.cornerRadius = 2.5f;

    midView.layer.masksToBounds = YES;
    midView.layer.cornerRadius = 3.0f;
}

-(void)buttonAction {
    
    [self.delegate bindlingSuccess:_textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];

}

//扫描水卡二维码
-(void)button1Action {
    
//    WCQRCodeScanningVC *wcVC = [[WCQRCodeScanningVC alloc]init];
//    wcVC.delegate = self;
//    [self QRCodeScanVC:wcVC];
    
    
    [self.delegate bindlingSuccess:@"扫码"];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];

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
