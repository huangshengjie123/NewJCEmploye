//
//  UpdateViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  修改

#import "UpdateViewController.h"
#import "Macro.h"
#import "SGAlertMenu.h"
#import "JCRequest_updateMyInfo.h"
#import "MBProgressHUD.h"
@interface UpdateViewController ()
@property (nonatomic,strong) UITextField *textField;
@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改资料";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(44));
    }];
    
    _textField = [[UITextField alloc]init];
    _textField.text = _oldString;
    _textField.textColor = JCColorBlack;
    _textField.font = JCFont14;
    [self.view addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).offset(10);
        make.centerY.equalTo(backView);
        make.right.equalTo(backView).offset(-10);
    }];
}
-(void)buttonAction {
    [SGActionView showAlertWithTitle:@"是否确定" message:nil leftButtonTitle:@"确定" rightButtonTitle:@"取消" selectedHandle:^(NSInteger index) {
        if (index == 0) {
            //确定
            
            
            JCRequest_updateMyInfo *request = [[JCRequest_updateMyInfo alloc]init];
            
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            NSString *userId = [JCTokenManager getUserID];
            
            
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"id":userId,
                                        _nameString:_textField.text
                                        };
            
            NSLog(@"%@",request.requestArgument);
            [request startWithBlockSuccess:^(__kindof JCRequest_updateMyInfo *request) {
                //
                NSLog(@"成功");
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"修改成功";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                
            
            } failure:^(__kindof JCRequest_updateMyInfo *request, NSError *error) {
                NSLog(@"失败 %@",error);
            }];
            
        }
        
        if (index == 1) {
            //取消
            
        }
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
