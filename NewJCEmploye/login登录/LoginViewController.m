//
//  LoginViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "JCLoginRequest.h"
#import "DataModels.h"
#import "Macro.h"
#import "LCRequestAccessory.h"
#import "AFNetworking.h"
#import "JCTokenManager.h"
#import "JCReadUserByAccoutRequest.h"
#import "JCRequest_getFranchiserByUid1.h"
#import "ChangePasswordViewController.h"
#import <UMPush/UMessage.h>
#import "JCRequest_login2.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton    *loginButton;
@property (nonatomic,strong) UILabel     *buttonlabel;
@property (nonatomic,strong) UILabel     *buttonlabel2;
@property (nonatomic,strong) UIButton    *fetgetButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addviews];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)addviews {
    
    UIImageView *backImageView = [[UIImageView alloc]init];
    [backImageView setImage:[UIImage imageNamed:@"登录背景"]];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.65];
    [backImageView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(backImageView);
    }];
    
    UIButton *button2 =  [[UIButton alloc] init];
    button2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(20);
        make.width.equalTo(@(100));
        make.height.equalTo(@(30));
    }];
    
    _buttonlabel2 = [[UILabel alloc]init];
    _buttonlabel2.text= @"切换经销商员工";
    _buttonlabel2.font = JCFont14;
    _buttonlabel2.textColor = JCColorWithe;
    [button2 addSubview:_buttonlabel2];
    [_buttonlabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button2);
    }];
    [button2 addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"洁澄云";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:40];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(-140);
        make.left.equalTo(self.view).offset(40);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = [UIColor grayColor];
    [backView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView.mas_left).offset(40);
        make.top.equalTo(label.mas_bottom).offset(50);
        make.right.equalTo(backView.mas_right).offset(-40);
        make.height.equalTo(@(2));
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = [UIColor grayColor];
    [backView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView.mas_left).offset(40);
        make.right.equalTo(backView.mas_right).offset(-40);
        make.height.equalTo(@(2));
        make.top.equalTo(lineView1.mas_bottom).offset(116/2);
    }];
    
    _loginButton = [[UIButton alloc]init];
    [self.view addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).offset(30);
        make.left.right.equalTo(lineView2);
        make.height.equalTo(@(35));
    }];
    [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.backgroundColor = MidGrayColor;
    _loginButton.alpha = 0.65;
    _loginButton.layer.masksToBounds = YES;
    _loginButton.layer.cornerRadius = 4;
    
    _buttonlabel = [[UILabel alloc]init];
    _buttonlabel.text = @"登录";
    _buttonlabel.font = [UIFont boldSystemFontOfSize:16];
    _buttonlabel.textColor = [UIColor darkGrayColor];
    [_loginButton addSubview:_buttonlabel];
    [_buttonlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_loginButton);
        make.centerY.equalTo(_loginButton);
    }];
  
    _userNameTextField = [[UITextField alloc]init];
    _userNameTextField.textColor = [UIColor whiteColor];
    _userNameTextField.font = JCFont16;
    _userNameTextField.placeholder = @"请输入账号";
    [_userNameTextField setValue:MidGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:_userNameTextField];
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1.mas_left);
        make.right.equalTo(lineView1.mas_right);
        make.bottom.equalTo(lineView1.mas_top).offset(-6);
         make.height.equalTo(@(30));
    }];
    
    _passwordTextField = [[UITextField alloc]init];
    _passwordTextField.placeholder =  @"请输入密码";
    _passwordTextField.textColor = [UIColor whiteColor];
    [_passwordTextField setValue:MidGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    _passwordTextField.font = JCFont16;
    [self.view addSubview:_passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1.mas_left);
        make.right.equalTo(lineView1.mas_right);
        make.bottom.equalTo(lineView2.mas_top).offset(-6);
        make.height.equalTo(@(30));
    }];
    _passwordTextField.secureTextEntry = YES;
    
    _passwordTextField.delegate = self;
    _userNameTextField.delegate = self;
    
    UIButton *button = [[UIButton alloc]init];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginButton);
        make.top.equalTo(_loginButton.mas_bottom).offset(15);
        make.height.equalTo(@(20));
        make.width.equalTo(@(80));
    }];
    _fetgetButton = button;
    
    UILabel *buttonLabel2 = [[UILabel alloc]init];
    buttonLabel2.text = @"忘记密码";
    buttonLabel2.textColor = MidGrayColor;
    buttonLabel2.font = [UIFont systemFontOfSize:14];
    [button addSubview:buttonLabel2];
    [buttonLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button.mas_left);
        make.centerY.equalTo(button.mas_centerY);
    }];
    
    [button addTarget:self action:@selector(changePassWrod) forControlEvents:UIControlEventTouchUpInside];
}

//修改密码
-(void)changePassWrod {
    
    ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}

//切换登录模式
-(void)change {
    
    if ([_buttonlabel2.text  isEqual: @"切换经销商员工"])
    {
        _buttonlabel2.text = @"切换员工";
        _fetgetButton.hidden = YES;
        [_loginButton addTarget:self action:@selector(loginAction2) forControlEvents:UIControlEventTouchUpInside];

    }
    else
    {
        _buttonlabel2.text = @"切换经销商员工";
        _fetgetButton.hidden = NO;
        [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];

    }

}
-(void)loginAction2 {
    
    //经销商员工登录
    JCRequest_login2 *request = [[JCRequest_login2 alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    request.requestArgument = @{
                                @"account":_userNameTextField.text,
                                @"password":_passwordTextField.text
                                };
    
    NSLog(@"%@",request);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_login2 *request) {
        
//        NSLog(@"request1:::::::::%@",request.responseJSONObject);
        
        JCModel_LoginBase *base = [[JCModel_LoginBase alloc]initWithDictionary:request.responseJSONObject];
        
        if ([base.result isEqualToString:@"loginSuccess"]) {
            //登录成功
            NSLog(@"======================登录成功");
            [JCTokenManager saveToken:base.msg];
            [JCTokenManager saveDealerstaff:@"经销商员工"];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            [self readUserInfo];
        }
        else if ([base.result  isEqualToString:@"appFirstLogin"])
        {
            ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
            [self presentViewController:vc animated:YES completion:nil];
            
        }else {
            //登录失败
            NSLog(@"======================登录失败");
            if ([base.msg  isEqual: @"user not found or password error"]) {
                [self showInfo:@"用户密码错误"];
            }
        }
        
    } failure:NULL];
    
}

//登录按钮事件
-(void)loginAction {

    JCLoginRequest *request = [[JCLoginRequest alloc]init];
   
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];

    request.requestArgument = @{
                                @"account":_userNameTextField.text,
                                @"password":_passwordTextField.text
                                };
    
     NSLog(@"%@",request);
    
    [request startWithBlockSuccess:^(__kindof JCLoginRequest *request) {

        
//        NSLog(@"request2:::::::::%@",request.responseJSONObject);
        
        JCModel_LoginBase *base = [[JCModel_LoginBase alloc]initWithDictionary:request.responseJSONObject];

        if ([base.result isEqualToString:@"loginSuccess"]) {
            //登录成功
            NSLog(@"======================登录成功");
            [JCTokenManager saveToken:base.msg];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];

            [self dismissViewControllerAnimated:YES completion:nil];

            [self readUserInfo];
            
        }
        else if ([base.result  isEqualToString:@"appFirstLogin"])
        {
            
            ChangePasswordViewController *vc = [[ChangePasswordViewController alloc]init];
            [self presentViewController:vc animated:YES completion:nil];
            
            
        }else {
            //登录失败
            NSLog(@"======================登录失败");
            if ([base.msg  isEqual: @"user not found or password error"]) {
                [self showInfo:@"用户密码错误"];
            }
        }

    } failure:NULL];


 
}

//读取用户信息
-(void)readUserInfo {
    
    
    JCReadUserByAccoutRequest *request = [[JCReadUserByAccoutRequest alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                };
    [request startWithBlockSuccess:^(__kindof JCReadUserByAccoutRequest *request) {
        
        NSDictionary *dic = request.responseJSONObject;
//        NSLog(@"dic::::::::::%@",dic);
        JCModel_UserBase *base = [[JCModel_UserBase alloc]initWithDictionary:dic];
        JCModel_UserData *data = base.data;
        NSLog(@"获取用户信息成功 用户ID%f",data.dataIdentifier);
        [JCTokenManager saveUser:[NSString stringWithFormat:@"%d",(int)data.dataIdentifier]];
        [JCTokenManager saveUserOrg:[NSString stringWithFormat:@"%@",data.orgId]];
        [JCTokenManager saveUserType:data.type];
        
        //绑定别名
        [UMessage setAlias:[JCTokenManager getUserID] type:@"ANDROID_JIECHENGOA" response:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
            
            
        }];
        
        //如果是经销商 查询其对应的业务员
        if ([data.type  isEqual: @"franchiser"])
        {
        
            [JCTokenManager saveDealer:@"franchiser"];
            JCRequest_getFranchiserByUid1 *request = [[JCRequest_getFranchiserByUid1 alloc]init];
            
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            NSString *uid = [JCTokenManager getUserID];
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"uid":uid
                                        };
            
            [request startWithBlockSuccess:^(__kindof JCRequest_getFranchiserByUid1 *request) {
                //
                NSLog(@"成功");
                NSDictionary *dic = request.responseJSONObject;
                JCModel_FranchiserByUid1Base *base = [[JCModel_FranchiserByUid1Base alloc]initWithDictionary:dic];
                [JCTokenManager saveUserID:[NSString stringWithFormat:@"%d",(int)base.data.guide]];
                NSLog(@"dic >>>>>>%@",dic);
                
            } failure:^(__kindof JCRequest_getFranchiserByUid1 *request, NSError *error) {
                NSLog(@"失败 %@",error);
            }];
            
            
        }
        
    } failure:^(__kindof JCReadUserByAccoutRequest *request, NSError *error) {
        
        NSLog(@"获取用户信息失败 %@",error);
        
    }];
}

//textField delegate
-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (_userNameTextField.text.length > 0 && _passwordTextField.text.length > 0)
    {
        _loginButton.backgroundColor = JCColorBlue;
        _buttonlabel.textColor = [UIColor whiteColor];
        _loginButton.userInteractionEnabled = YES;
    }
    else
    {
        _loginButton.backgroundColor = MidGrayColor;
        _buttonlabel.textColor = [UIColor darkGrayColor];
        _loginButton.userInteractionEnabled = NO;
    }
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
