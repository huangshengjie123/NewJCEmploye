//
//  SettingViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SettingViewController.h"
#import "Macro.h"
#import "JCLoginOutRequest.h"
#import "LoginViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}
-(void)addViews {
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64);
        make.bottom.equalTo(self.view);
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.font = JCFont14;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"清理缓存";
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = JCColorGray;
        [cell.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cell.contentView);
            make.bottom.equalTo(cell.contentView);
            make.height.equalTo(@(1));
        }];
    }
    NSString* strVersion = [[UIDevice currentDevice] systemVersion];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    

    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    float version = [strVersion floatValue];
    NSLog(@"version:%f", version);

    if (indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"版本号:%@",appCurVersion];
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = JCColorGray;
        [cell.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cell.contentView);
            make.bottom.equalTo(cell.contentView);
            make.height.equalTo(@(1));
        }];
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"退出登录";
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = JCColorGray;
        [cell.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cell.contentView);
            make.bottom.equalTo(cell.contentView);
            make.height.equalTo(@(1));
        }];

    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
 
            JCLoginOutRequest *request = [[JCLoginOutRequest alloc]init];
            
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
            [request addAccessory:requestAccessory];
        
            NSString *token = [JCTokenManager getToken];
            
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token
                                        };
            [request startWithBlockSuccess:^(__kindof JCLoginOutRequest *request) {
                //
                NSLog(@"登出成功");
                
                [JCTokenManager cleanToken];
                [JCTokenManager cleanUserID];
                [JCTokenManager cleanUserOrgID];
                [JCTokenManager cleanUserType];
                [JCTokenManager cleanFinancial];
                [JCTokenManager cleanUID];
                [JCTokenManager cleanDealerstaff];
                [JCTokenManager cleanDealer];
                
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                loginVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController presentViewController:loginVC animated:NO completion:nil];
                
            } failure:^(__kindof JCLoginOutRequest *request, NSError *error) {
                NSLog(@"登出失败 %@",error);
            }];
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
