//
//  CrateApplicationSupportViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CrateApplicationSupportViewController.h"
#import "Macro.h"
#import "SGActionView.h"
#import "MyCustomerViewController.h"
#import "ProbationCustomViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
@interface CrateApplicationSupportViewController ()<MyCustomerDelegate,SelectProbationCustomDelegate>
@property (nonatomic,strong)UILabel *buttonLabel;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) NSString *myCusmID;
@property (nonatomic,strong) NSString *probationCustmID;
@property (nonatomic,strong) UIButton *button3;
@end

@implementation CrateApplicationSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发起申请支持";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = JCColorWithe;
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"客户:";
    label.textColor = JCColorBlack;
    label.font = JCFont14;
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView);
        make.left.equalTo(backView.mas_left).offset(10);
    }];
    float w = JCScreen_Width - 10 - label.frame.size.width;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor clearColor];
    [backView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(0);
        make.top.bottom.equalTo(backView);
        make.width.equalTo(@(w));
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel *buttonLabel = [[UILabel alloc]init];
    buttonLabel.textColor = JCColorBlue;
    buttonLabel.font = JCFont14;
    [button addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        //        make.width.equalTo(@(w));
        make.left.equalTo(label.mas_right).offset(10);
        make.right.equalTo(button.mas_right).offset(-10);
    }];
    _buttonLabel = buttonLabel;
    
    _buttonLabel.text = @"请选择";
    
    UIView *backView2 = [[UIView alloc]init];
    backView2.backgroundColor = JCColorWithe;
    [self.view addSubview:backView2];
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    UILabel *remakeLabel = [[UILabel alloc]init];
    remakeLabel.text = @"备注:";
    remakeLabel.font = JCFont14;
    remakeLabel.textColor = JCColorBlack;
    [backView2 addSubview:remakeLabel];
    [remakeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView2);
        make.left.equalTo(backView2).offset(10);
    }];
    
    UITextField *remakeTextField = [[UITextField alloc]init];
    remakeTextField.placeholder = @"请填写备注";
    remakeTextField.textColor = JCColorBlack;
    remakeTextField.font = JCFont14;
    [backView2 addSubview:remakeTextField];
    [remakeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backView2.mas_right).offset(-10);
        make.left.equalTo(remakeLabel.mas_right).offset(5);
        make.centerY.equalTo(backView2);
    }];
    _textField = remakeTextField;
    

    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    _button3 = button2;
    
    UILabel *buttonLable2= [[UILabel alloc]init];
    buttonLable2.text = @"确定";
    buttonLable2.font = JCFont15;
    [button2 addSubview:buttonLable2];
    [buttonLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button2);
    }];
    
    
    
}
-(void)buttonAction2 {
    if (_probationCustmID == nil && _myCusmID == nil) {
        [self showInfo:@"请选择客户"];
        return;
    }
    
    if (_probationCustmID != nil && _myCusmID == nil) {
        _button3.userInteractionEnabled = NO;
        _button3.backgroundColor = JCColorGray;
        //选择了试用客户
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_crateProbationApplicationSupportBase *base = [[JCModel_crateProbationApplicationSupportBase alloc]init];
     
    
        base.command= @"start";
        base.isPre = true;
        JCModel_crateProbationApplicationSupportFranchiserOrder *order = [[JCModel_crateProbationApplicationSupportFranchiserOrder alloc]init];
        order.preId = _probationCustmID.doubleValue;
        order.comments = _textField.text;
        base.franchiserOrder = order;
       
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    
                    [self showInfo:@"发起成功"];
                    
//                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    
                    
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =[NSString stringWithFormat:@"%@",msg];
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
        
    }
    
    if (_probationCustmID == nil && _myCusmID != nil) {
        //选择了正式客户
        _button3.userInteractionEnabled = NO;
        _button3.backgroundColor = JCColorGray;
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_CrateCusApplicationSuppportBase *base = [[JCModel_CrateCusApplicationSuppportBase alloc]init];
        
        
        base.command= @"start";
        base.isPre = false;
        JCModel_CrateCusApplicationSuppportFranchiserOrder *order = [[JCModel_CrateCusApplicationSuppportFranchiserOrder alloc]init];
        order.customerId = _myCusmID.doubleValue;
        order.comments = _textField.text;
        base.franchiserOrder = order;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    
                    [self showInfo:@"发起成功"];
                    
                    //                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    
                    
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =[NSString stringWithFormat:@"%@",msg];
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
}


-(void)buttonAction {
    
    NSArray *array = @[@"正式客户",@"试用客户"];
    
    [SGActionView showSheetWithTitle:@"选择客户类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        if (index== 0) {
            //选择了正式客户
         
            //跳转到我的客户
            MyCustomerViewController *myCustomerVC  = [[MyCustomerViewController alloc]init];
            myCustomerVC.delegate = self;
            myCustomerVC.fromString = @"newCustomer";
            [self.navigationController pushViewController:myCustomerVC animated:YES];
     
        }
        
        if (index == 1) {
            //选择了试用客户
            ProbationCustomViewController *probationCustomVC = [[ProbationCustomViewController alloc]init];
            probationCustomVC.delegate = self;
            probationCustomVC.tpyeString = @"1";
            [self.navigationController pushViewController:probationCustomVC animated:YES];
            
        }
      
        
    }];
    
}

-(void)selectMyCustomerReturn:(JCModel_GetCustmerData *)custmerData {
    
    _buttonLabel.text = custmerData.name;
    
    _myCusmID = [NSString stringWithFormat: @"%d",(int)custmerData.dataIdentifier];
    
}

-(void)selectProbationReturn:(JCModel_ProabtionCustomList *)listData {
    
    _buttonLabel.text = listData.name;
    
    _probationCustmID = [NSString stringWithFormat:@"%d",(int)listData.listIdentifier];
    
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
