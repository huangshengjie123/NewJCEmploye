//
//  ChangePasswordViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "Macro.h"
#import "JCRequest_updateUserPasswdByIdCode.h"
#import "JCRequest_updateUserPasswdByMbPhone.h"

@interface ChangePasswordViewController ()

@property (nonatomic, strong) UIView     *stateView;
@property (nonatomic, strong) UIView     *naView;

@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton    *button;
@property (nonatomic,strong) UIButton    *button1;
@property (nonatomic,strong) UITextField *passwordTextfield;
@property (nonatomic,strong) UITextField *codeTextfield;

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"填写绑定手机号";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
}


-(void)addViews {
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"手机号:";
    label.font = JCFont15;
    label.textColor = JCColorBlack;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(JCNew64 + 100);
    }];
    
    _textField = [[UITextField alloc]init];
    _textField.font = JCFont15;
    _textField.textColor = JCColorBlack;
    _textField.backgroundColor = JCColorWithe;

    [self.view addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(30));
        make.left.equalTo(label.mas_right).offset(10);
        make.centerY.equalTo(label);
  
    }];
    _textField.placeholder = @"请填写你的手机号码";
    
    _button = [[UIButton alloc]init];
    [self.view addSubview:_button];
    _button.backgroundColor = JCColorBlue;
    [_button setTitle:@"确认，并获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    
    _button.titleLabel.font = JCFont14;
    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"新密码:";
    label1.font = JCFont15;
    label1.textColor = JCColorBlack;
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(_button.mas_bottom).offset(10);
    }];
    
    
    _passwordTextfield = [[UITextField alloc]init];
    _passwordTextfield.font = JCFont15;
    _passwordTextfield.backgroundColor = JCColorWithe;
    _passwordTextfield.textColor = JCColorBlack;
    [self.view addSubview:_passwordTextfield];
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(30));
        make.left.equalTo(label1.mas_right).offset(10);
        make.centerY.equalTo(label1);
        make.width.equalTo(_textField);

    }];
    _passwordTextfield.placeholder = @"请填写你的新的密码";
    
    
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"验证码:";
    label2.font = JCFont15;
    label2.textColor = JCColorBlack;
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(label1.mas_bottom).offset(10);
    }];
    
    
    _codeTextfield = [[UITextField alloc]init];
    _codeTextfield.font = JCFont15;
    _codeTextfield.textColor = JCColorBlack;
    _codeTextfield.backgroundColor = JCColorWithe;
    [self.view addSubview:_codeTextfield];
    [_codeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(30));
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
        make.width.equalTo(_textField);
    }];
    _codeTextfield.placeholder = @"请填写你收到的验证码";
    
    

    UIButton *button2= [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [button2 setTitle:@"确认修改" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    button2.titleLabel.font = JCFont14;
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _button1 = [[UIButton alloc]init];
    [self.view addSubview:_button1];
    _button1.backgroundColor = JCColorBlue;
    [_button1 setTitle:@"退出密码找回" forState:UIControlStateNormal];
    [self.view addSubview:_button1];
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button2.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    _button1.titleLabel.font = JCFont14;

    [_button1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];

    
}
-(void)buttonAction2 {
    
    if (_codeTextfield.text.length!=6)
    {
        [self showInfo:@"验证码填入错误"];
        return;
    }
    
    if (_textField.text.length!= 11)
    {
        [self showInfo:@"手机号码有误"];
        return;
    }
    
    if (_passwordTextfield.text.length == 0)
    {
        [self showInfo:@"填写新的密码"];
        return;
    }
    
    JCRequest_updateUserPasswdByMbPhone *request = [[JCRequest_updateUserPasswdByMbPhone alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"MbPhone":_textField.text,
                                @"passwd":_passwordTextfield.text,
                                @"code":_codeTextfield.text
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_updateUserPasswdByMbPhone *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        NSString *success  = [dic objectForKey:@"result"];
        NSString *msg  = [dic objectForKey:@"msg"];

        if ([success  isEqual: @"success"])
        {
            [self showInfo:@"修改成功"];
        }
        else
        {
            [self showInfo:msg];
        }
        
    } failure:^(__kindof JCRequest_updateUserPasswdByMbPhone *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}


-(void)buttonAction {
    
    if (self.textField.text.length == 11)
    {
        JCRequest_updateUserPasswdByIdCode *request = [[JCRequest_updateUserPasswdByIdCode alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"MbPhone":_textField.text
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_updateUserPasswdByIdCode *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSString *success  = [dic objectForKey:@"result"];
            if ([success  isEqual: @"success"])
            {
                //跳转
                //倒计时时间 - 60S
                __block NSInteger timeOut = 59;
//                self.timeOut = timeOut;
                //执行队列
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                //计时器 -》 dispatch_source_set_timer自动生成
                dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
                dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
                dispatch_source_set_event_handler(timer, ^{
                    
                    if (timeOut <= 0)
                    {
                        dispatch_source_cancel(timer);
                        //主线程设置按钮样式
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // 倒计时结束
                            [_button setTitle:@"重发验证码" forState:UIControlStateNormal];
                            [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                            [_button setEnabled:YES];
                            [_button setUserInteractionEnabled:YES];
                        });
                    }
                    else
                    {
                        //开始计时
                        //剩余秒数 seconds
                        NSInteger seconds = timeOut % 60;
                        NSString *strTime = [NSString stringWithFormat:@"%.1ld", seconds];
                        //主线程设置按钮样式
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [UIView beginAnimations:nil context:nil];
                            [UIView setAnimationDuration:1.0];
                            NSString *title = [NSString stringWithFormat:@"%@",strTime];
                            [_button setTitle:title forState:UIControlStateNormal];
                            //              [yourButton.titleLabel setTextAlignment:NSTextAlignmentRight];
                            // 设置按钮title居中 上面注释的方法无效
                            [_button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
                            [_button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                            [UIView commitAnimations];
                            //计时器间不允许点击
                            [_button setUserInteractionEnabled:NO];
                        });
                        timeOut--;
                    }
                });
                dispatch_resume(timer);
                
            }
            
        } failure:^(__kindof JCRequest_updateUserPasswdByIdCode *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    
    }
    else
    {
        [self showInfo:@"手机号格式不对"];
    }
}

-(void)buttonAction1 {
    
    
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
