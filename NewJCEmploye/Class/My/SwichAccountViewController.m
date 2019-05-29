//
//  SwichAccountViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SwichAccountViewController.h"
#import "Macro.h"
#import "MyItemsTableViewCell.h"
#import "JCRequest_bindOtherAccount.h"
#import "Request_getBindAccounts.h"
#import "DataModels.h"
#import "Request_changeLoginAccount.h"
#import "JCReadUserByAccoutRequest.h"
#import <UMPush/UMessage.h>
#import "JCRequest_getFranchiserByUid1.h"
#import "JCRequest_unbindOtherAccount.h"
@interface SwichAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITextField *accountTextfield;
@property (nonatomic,strong) UITextField *passwordTestfield;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation SwichAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"切换登录";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
    
    [self readData];
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(JCNew64 + 20);
        make.height.equalTo(@(120));
    }];
    
    topView.layer.cornerRadius = 2;
    
    topView.layer.masksToBounds = YES;
    
    //给图层添加一个有色边框
    
    topView.layer.borderWidth = 1;
    
    topView.layer.borderColor = [JCColorBlue CGColor];
  
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"账号:";
    label1.textColor = JCColorBlack;
    label1.font = JCFont14;
    [topView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.top.equalTo(topView.mas_top).offset(20);
    }];
    
    UILabel *label2= [[UILabel alloc]init];
    label2.text = @"密码:";
    label2.textColor = JCColorBlack;
    label2.font = JCFont14;
    [topView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.top.equalTo(label1.mas_bottom).offset(10);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [topView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).offset(10);
        make.left.equalTo(topView).offset(10);
        make.right.equalTo(topView).offset(-10);
        make.height.equalTo(@(35));
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"添加可切换账号";
    label3.font = JCFont15;
    label3.textColor = JCColorWithe;
    [button addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(addBindOtherAccout) forControlEvents:UIControlEventTouchUpInside];
    
    
    topView.backgroundColor = JCColorGray;
    
    _accountTextfield = [[UITextField alloc]init];
    _accountTextfield.placeholder = @"请输入要切换的账号";
    _accountTextfield.backgroundColor = JCColorWithe;
    [topView addSubview:_accountTextfield];
    [_accountTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView.mas_right).offset(-10);
        make.left.equalTo(label1.mas_right).offset(10);
        make.centerY.equalTo(label1);
        make.height.equalTo(@(20));
    }];
    _accountTextfield.font = JCFont14;

    
    _passwordTestfield = [[UITextField alloc]init];
    _passwordTestfield.placeholder = @"请输入密码";
    _passwordTestfield.backgroundColor = JCColorWithe;
    [topView addSubview:_passwordTestfield];
    [_passwordTestfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.right.equalTo(topView.mas_right).offset(-10);
        make.centerY.equalTo(label2);
        make.height.equalTo(@(20));
    }];
    _passwordTestfield.font = JCFont14;
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = JCBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    
}

-(void)readData {
    Request_getBindAccounts *request = [[Request_getBindAccounts alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof Request_getBindAccounts *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =request.responseJSONObject;
        
        JCModel_getBindAccountsBase *base = [[JCModel_getBindAccountsBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        [self.tableView  reloadData];
      
        
    } failure:^(__kindof Request_getBindAccounts *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
    
}
-(void)addBindOtherAccout {
    
    JCRequest_bindOtherAccount *request = [[JCRequest_bindOtherAccount alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"bindAct":_accountTextfield.text,
                                @"password":_passwordTestfield.text,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_bindOtherAccount *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =request.responseJSONObject;
        
        NSString *result = [dic objectForKey:@"result"];
        
        if ([result  isEqual: @"success"]) {
             [self readData];
            [self showInfo:@"成功添加"];
            
        }

        
    } failure:^(__kindof JCRequest_bindOtherAccount *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_getBindAccountsData *data = _dataArray[indexPath.row];
    
    Request_changeLoginAccount *request = [[Request_changeLoginAccount alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"bindAct":data.account
                                };
    
    NSLog(@"%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof Request_changeLoginAccount *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =request.responseJSONObject;
        NSString *result = [dic objectForKey:@"result"];
        NSString *msg = [dic objectForKey:@"msg"];
        if ([result  isEqual: @"loginSuccess"]) {
            
            [JCTokenManager saveToken:msg];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            [self readUserInfo];
            
        }

        
    } failure:^(__kindof Request_changeLoginAccount *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MyItemsTableViewCell";
    MyItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MyItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    JCModel_getBindAccountsData *data = _dataArray[indexPath.row];
    
    cell.titelLabel.text = data.account;
    cell.contentLabel.text = data.xpath;
    
    return cell;
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
        if ([data.type  isEqual: @"franchiser"]) {
            
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
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      
        JCModel_getBindAccountsData *data = _dataArray[indexPath.row];

        JCRequest_unbindOtherAccount *request = [[JCRequest_unbindOtherAccount alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"bindAct":data.account
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_unbindOtherAccount *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            
            NSString *result = [dic objectForKey:@"result"];
            
            if ([result  isEqual: @"success"]) {
                [self showInfo:@"解除绑定成功"];
                [self readData];
            }
            
        } failure:^(__kindof JCRequest_unbindOtherAccount *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
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
