//
//  PersonDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PersonDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "JCReadUserByAccoutRequest.h"
#import "DataModels.h"
#import "UpdateViewController.h"
@interface PersonDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *departmentLabel;
@property (nonatomic,strong) UILabel *positionLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *wxLabel;
@property (nonatomic,strong) UIImageView *kImageView;

@end

@implementation PersonDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人资料";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readMyData];
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
    return 7;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"头像";
        cell.kImageView.hidden = NO;
        cell.arrowImageView.hidden = YES;
        _kImageView = cell.kImageView;
    }
    
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"姓名";
        cell.arrowImageView.hidden = YES;
       _nameLabel =  cell.contentLabel ;
    }
    
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"部门";
        cell.arrowImageView.hidden = YES;
       _departmentLabel = cell.contentLabel;
    }
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"职位";
        cell.arrowImageView.hidden = YES;
      _positionLabel =  cell.contentLabel;
    }
    if (indexPath.row == 4) {
        cell.titleLabel.text = @"手机";
        _phoneLabel = cell.contentLabel;
    }
    if (indexPath.row == 5) {
        cell.titleLabel.text = @"地址";
       _addressLabel =  cell.contentLabel;
    }
    if (indexPath.row == 6) {
        cell.titleLabel.text = @"微信";
        _wxLabel  =cell.contentLabel;
    }

    return  cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 66.0;
    }else {
        return 44;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        UpdateViewController *update = [[UpdateViewController alloc]init];
        update.oldString = _phoneLabel.text;
        update.nameString = @"MbPhone";
        [self.navigationController pushViewController:update animated:YES];
    }
    
    if (indexPath.row == 5) {
        UpdateViewController *update = [[UpdateViewController alloc]init];
        update.oldString = _addressLabel.text;
        update.nameString = @"address";
        [self.navigationController pushViewController:update animated:YES];
    }
    
    if (indexPath.row == 6) {
        UpdateViewController *update = [[UpdateViewController alloc]init];
        update.oldString = _wxLabel.text;
        update.nameString = @"weChat";
        [self.navigationController pushViewController:update animated:YES];
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
        NSLog(@"获取用户信息成功 用户ID%@",dic);
        _nameLabel.text = data.name;
        _departmentLabel.text = data.orgName;
        _positionLabel.text = @"暂无";
        _phoneLabel.text = data.mbPhone;
        _addressLabel.text = data.address;
        _wxLabel.text = data.weChat;
        
        if ([data.sex  isEqual: @"0"]) {
            [_kImageView setImage:[UIImage imageNamed:@"默认头像男"]];
        }else {
            [_kImageView setImage:[UIImage imageNamed:@"默认头像女"]];
        }
        
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCReadUserByAccoutRequest *request, NSError *error) {
        
        NSLog(@"获取用户信息失败 %@",error);
        
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
