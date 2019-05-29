//
//  UserCodeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "UserCodeViewController.h"
#import "Macro.h"
#import "SGQRCode.h"
@interface UserCodeViewController ()

@end

@implementation UserCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViews];
}



-(void)addViews {
    
    UILabel *Label = [[UILabel alloc]init];
    Label.text = [JCTokenManager getUserID];
    Label.textColor = JCColorWithe;
    Label.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 50);
    }];
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(JCScreen_Width * 0.75));
        make.height.equalTo(@(JCScreen_Width * 0.75));
        make.centerX.equalTo(self.view);
        make.top.equalTo(Label.mas_bottom).offset(20);
    }];
    
    CGFloat imageViewW =  JCScreen_Width * 0.75;
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeGenerateManager generateWithDefaultQRCodeData:[JCTokenManager getUserID] imageViewWidth:imageViewW];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)buttonAction {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
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
