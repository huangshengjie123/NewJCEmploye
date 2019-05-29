//
//  PersonViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PersonViewController.h"
#import "Macro.h"
#import "Masonry.h"
#import "LCNetwork.h"
#import "TestRequest.h"
#import "LCRequestAccessory.h"
#import "JCLoginOutRequest.h"
#import "JCTokenManager.h"
#import "LoginViewController.h"
#import "PersonTableViewCell.h"
#import "ProbationCustomViewController.h"
#import "MyItemsViewController.h"
#import "WaterCardViewController.h"
#import "JCReadUserByAccoutRequest.h"
#import "DataModels.h"
#import "PersonDetailsViewController.h"
#import "SettingViewController.h"
#import "MyCustomerViewController.h"
#import "WorikGroupViewController.h"
#import "DealerBaseViewController.h"
#import "UserCodeViewController.h"
#import "DealerAccountViewController.h"
#import "MyCooperationViewController.h"
#import "SwichAccountViewController.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView       *topView;
@property (nonatomic,strong) UIImageView  *topImageView;
@property (nonatomic,strong) UILabel      *nameLabel;
@property (nonatomic,strong) UILabel      *memberLabel;
@property (nonatomic,strong) NSString     *tableviewType;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JCBackgroundColor;
    self.tabBarController.delegate = self;
    [self readMyData];
    [self addViews];

}

-(void)addViews {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(150,0, 0, 0);
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = JCBackgroundColor;
    
    _topImageView = [[UIImageView alloc] init];
    _topImageView.frame = CGRectMake(0, -150, [UIScreen mainScreen].bounds.size.width, 150);
    _topImageView.contentMode = UIViewContentModeScaleAspectFill;
    _topImageView.image = [UIImage imageNamed:@"顶部图"];
    _topImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    _topImageView.clipsToBounds = YES;
    _topImageView.tag = 101;
    _topImageView.userInteractionEnabled = YES;
    
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.alpha = 0.7;
    [_topImageView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_topImageView.mas_centerX);
        make.width.equalTo(@(JCScreen_Width - 70));
        make.height.equalTo(@(50));
        make.bottom.equalTo(_topImageView.mas_bottom).offset(-50);
    }];
    
    UIImageView *imageView= [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"默认头像男"];
    [_topImageView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView.mas_left).offset(20);
        make.centerY.equalTo(backView.mas_centerY);
        make.width.equalTo(@(70));
        make.height.equalTo(@(70));
    }];
    imageView.layer.masksToBounds = NO;
    
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowOpacity = 0.8f;
    imageView.layer.shadowOffset = CGSizeMake(1,1);
    imageView.layer.shadowRadius = 4.f;
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    [backView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(15);
        make.top.equalTo(backView.mas_top).offset(7);
    }];
    
    _memberLabel = [[UILabel alloc]init];
    _memberLabel.textColor = [UIColor darkGrayColor];
    _memberLabel.text = @"";
    _memberLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_memberLabel];
    [_memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(5);
    }];
    
    UIButton *clearButton = [[UIButton alloc]init];
    [_topImageView addSubview:clearButton];
    [clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView.mas_left);
        make.top.equalTo(imageView.mas_top);
        make.bottom.equalTo(imageView.mas_bottom);
        make.right.equalTo(backView.mas_right);
    }];
    [clearButton addTarget:self action:@selector(pushMyVC) forControlEvents:UIControlEventTouchUpInside];
    
    [_tableView addSubview:_topImageView];
    
    UIButton *codeImageViewButton  = [[UIButton alloc]init];
    [codeImageViewButton setImage:[UIImage imageNamed:@"二维码"] forState:UIControlStateNormal];
    [clearButton addSubview:codeImageViewButton];
    [codeImageViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(clearButton.mas_centerY);
        make.right.equalTo(clearButton.mas_right).offset(-10);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    [codeImageViewButton addTarget:self action:@selector(codeButtonACtion) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *settingButton = [[UIButton alloc]init];
    [settingButton setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    [self.view addSubview:settingButton];
    [settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset([[UIApplication sharedApplication] statusBarFrame].size.height + 5);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(35));
        make.width.equalTo(@(35));
    }];
    [settingButton addTarget:self action:@selector(settingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *marketButton = [[UIButton alloc]init];
    [marketButton setTitle:@"市场" forState:UIControlStateNormal];
    [marketButton setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [self.view addSubview:marketButton];
    [marketButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset([[UIApplication sharedApplication] statusBarFrame].size.height + 5);
        make.left.equalTo(self.view).offset(10);
        make.height.equalTo(@(35));
        make.width.equalTo(@(35));
    }];
    marketButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [marketButton addTarget:self action:@selector(switchAccount) forControlEvents:UIControlEventTouchUpInside];

}

-(void)switchAccount{
    

    if ([[JCTokenManager sgetDealerstaffl]  isEqual: @"经销商员工"])
    {
        [self showInfo:@"没有此权限"];
    }
    else
    {
        SwichAccountViewController *swVC = [[SwichAccountViewController alloc]init];
        swVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:swVC animated:YES];
    }

}

-(void)codeButtonACtion {
    
    UserCodeViewController *userCodeVC = [[UserCodeViewController alloc]init];
    self.definesPresentationContext = YES; //self is presenting view controller
    userCodeVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    userCodeVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:userCodeVC animated:YES completion:nil];
}

//跳转到设置界面
-(void)settingButtonAction {
    
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([[JCTokenManager sgetDealer]  isEqual: @"franchiser"])
    {
        return 5;
    }
    else
    {
        return 7;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonTableViewCell";
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([[JCTokenManager sgetDealer]  isEqual: @"franchiser"])
    {
        if (indexPath.row == 0)
        {
            cell.contentLabel.text = @"我的客户";
            cell.kImageView.image = [UIImage imageNamed:@"我的客户"];
        }
        if (indexPath.row == 1)
        {
            cell.contentLabel.text = @"我的试用名单";
            cell.kImageView.image = [UIImage imageNamed:@"我的试用客户"];
        }
        if (indexPath.row == 2)
        {
            cell.contentLabel.text = @"我的水卡";
            cell.kImageView.image = [UIImage imageNamed:@"我的水卡"];
        }
        if (indexPath.row == 3)
        {
            cell.contentLabel.text = @"我的物品";
            cell.kImageView.image = [UIImage imageNamed:@"我的物品"];
        }
        if (indexPath.row == 4)
        {
            cell.contentLabel.text = @"我的账户";
            cell.kImageView.image = [UIImage imageNamed:@"我的经销商"];
        }
        
    }
    else
    {
        if (indexPath.row == 0)
        {
            cell.contentLabel.text = @"我的客户";
            cell.kImageView.image = [UIImage imageNamed:@"我的客户"];
        }
        if (indexPath.row == 1)
        {
            cell.contentLabel.text = @"我的试用名单";
            cell.kImageView.image = [UIImage imageNamed:@"我的试用客户"];
        }
        if (indexPath.row == 2)
        {
            cell.contentLabel.text = @"我的水卡";
            cell.kImageView.image = [UIImage imageNamed:@"我的水卡"];
        }
        if (indexPath.row == 3)
        {
            cell.contentLabel.text = @"我的物品";
            cell.kImageView.image = [UIImage imageNamed:@"我的物品"];
        }
        
        if (indexPath.row == 4)
        {
            cell.contentLabel.text = @"我的工作组";
            cell.kImageView.image = [UIImage imageNamed:@"我的工作组"];
        }
        
        if (indexPath.row == 5)
        {
            cell.contentLabel.text = @"我的经销商";
            cell.kImageView.image = [UIImage imageNamed:@"我的经销商"];
        }
        
        if (indexPath.row == 6)
        {
            cell.contentLabel.text = @"我的合作点";
            cell.kImageView.image = [UIImage imageNamed:@"我的合作点"];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        //跳转到我的客户
        MyCustomerViewController *myCustomerVC  = [[MyCustomerViewController alloc]init];
        myCustomerVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myCustomerVC animated:YES];
    }
    
    if (indexPath.row == 1)
    {
        //跳转我的试用客户
        ProbationCustomViewController *probationCustomVC = [[ProbationCustomViewController alloc]init];
        probationCustomVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:probationCustomVC animated:YES];
    }
    
    if (indexPath.row == 2)
    {
        //跳转到我的水卡
        WaterCardViewController *waterCardViewController = [[WaterCardViewController alloc]init];
        waterCardViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:waterCardViewController animated:YES];
    }
    if (indexPath.row == 3)
    {
        //跳转我的物品
        MyItemsViewController *myItemsVC = [[MyItemsViewController alloc]init];
        if ([_tableviewType  isEqual: @"franchiser"])
        {
            myItemsVC.sting = @"franchiser";
        }
        else
        {
            
        }
        myItemsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myItemsVC animated:YES];
    }
    if (indexPath.row == 4)
    {
        if ([[JCTokenManager sgetDealer]  isEqual: @"franchiser"])
        {
            if ([[JCTokenManager sgetDealerstaffl]  isEqual: @"经销商员工"])
            {
                
                [self showInfo:@"没有此权限"];
            }
            else
            {
                DealerAccountViewController *vc = [[DealerAccountViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
        else
        {
            WorikGroupViewController *workGroup = [[WorikGroupViewController alloc]init];
            workGroup.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:workGroup animated:YES];
        }
    }
    
    if(indexPath.row == 5)
    {
        DealerBaseViewController *dealerVC = [[DealerBaseViewController alloc]init];
        dealerVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dealerVC animated:YES];
    }
    
    if (indexPath.row == 6)
    {
        MyCooperationViewController *vc = [[MyCooperationViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -150)
    {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
}

-(void)readMyData {
    
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
        _nameLabel.text = data.name;
        _memberLabel.text = data.orgName;
        [_tableView reloadData];
        [JCTokenManager saveUser:[NSString stringWithFormat:@"%d",(int)data.dataIdentifier]];
        
    } failure:^(__kindof JCReadUserByAccoutRequest *request, NSError *error) {
        
        NSLog(@"获取用户信息失败 %@",error);
        
    }];
}

-(void)buttonAction {
    
    TestRequest *request = [[TestRequest alloc]init];

    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];

    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                 @"jc4login":token
                                };
    [request startWithBlockSuccess:^(__kindof TestRequest *request) {
        //
        NSLog(@"成功");

    } failure:^(__kindof TestRequest *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

/**
 跳转到个人信息修改界面
 */
-(void)pushMyVC {
    
    NSLog(@"跳转到个人中心修改界面");
    PersonDetailsViewController *personDetailsVC = [[PersonDetailsViewController alloc]init];
    [self.navigationController pushViewController:personDetailsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    [self readMyData];

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
