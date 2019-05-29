//
//  ShowCodeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ShowCodeViewController.h"
#import "Macro.h"
#import "SGQRCode.h"
@interface ShowCodeViewController ()

@end

@implementation ShowCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"展示二维码";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorBlack;
    label.text = _codeString;
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 20);
    }];
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
   
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(JCScreen_Width * 0.75));
        make.height.equalTo(@(JCScreen_Width * 0.75));
        make.centerX.equalTo(self.view);
        make.top.equalTo(label.mas_bottom).offset(20);
    }];
    
    CGFloat imageViewW =  JCScreen_Width * 0.75;
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeGenerateManager generateWithDefaultQRCodeData:_codeString imageViewWidth:imageViewW];
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
