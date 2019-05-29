//
//  AddressListViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "AddressListViewController.h"
#import "Macro.h"
#import "AddressListTableViewCell.h"
#import "SearchViewController.h"
#import "JCAddressList_Read.h"
#import "DataModels.h"
#import "JCAddressList_ReadCount.h"
#import "JCAddressList_ReadOfOrgId.h"
#import "SearchTableViewCell.h"
#import "JCRequest_ReadMainOrg.h"
#import "SearchDetailsViewController.h"
#import "CBStoreHouseRefreshControl.h"

@interface AddressListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) JCModel_DepartmentData *departmentData;
@property (nonatomic,strong) NSArray *countDataArray;
@property (nonatomic,strong) NSArray *userDataArray;
@property (nonatomic,strong) UITableView *tableView2; //各部门主要联系负责人电话
@property (nonatomic,strong) NSArray     *dataArray2;

@end

@implementation AddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"通讯录";
    [self addViews];
    [self requestDataList];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestDataList)];

}
- (void)requestDataList {
    
    [self readData];
    [self readOtherData];
    [self readCount];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return _dataArray.count;
    }
    else
    {
        return _dataArray2.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_dataArray2.count == 0)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"AddressListTableViewCell";
        AddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[AddressListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        _departmentData = _dataArray[indexPath.row];
        cell.titleLabel.text = _departmentData.orgName;
        for (int i = 0; i < _countDataArray.count; i ++)
        {
            JCModel_DepartmentCountData *data = _countDataArray[i];
            if (_departmentData.orgId == data.orgId)
            {
                cell.numLabel.text = [NSString stringWithFormat:@" (%d人)",(int)data.num];
            }
        }
        return cell;
    }
    else
    {
        static NSString *identifier = @"SearchTableViewCell";
        SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_employeeInfoData *data = _dataArray2[indexPath.row];
        cell.nameLabel.text = data.name;
        cell.phoneLabel.text = data.mbPhone;
        if ([data.sex  isEqual: @"0"])
        {
            [cell.kImageView setImage:[UIImage imageNamed:@"默认头像男"]];
        }
        else
        {
            [cell.kImageView setImage:[UIImage imageNamed:@"默认头像女"]];
        }
        
        return cell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return 5;
    }
    else
    {
        return 25;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = JCColorMidGray;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    if (section == 1)
    {
        label.text = @"部门主要联系人";
    }
    return view ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0)
    {
        JCAddressList_ReadOfOrgId *request = [[JCAddressList_ReadOfOrgId alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        _departmentData = _dataArray[indexPath.row];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"orgId":_departmentData.orgId,
                                    };
        NSLog(@"%@",request.requestArgument);
        
        [request startWithBlockSuccess:^(__kindof JCAddressList_Read *request) {
            
            NSDictionary *dic = request.responseJSONObject;
            JCModel_employeeInfoBase *base = [[JCModel_employeeInfoBase alloc]initWithDictionary:dic];
            _userDataArray = base.data;
           
            SearchViewController *searchVC = [[SearchViewController alloc]init];
            searchVC.userDataArray = _userDataArray;
            searchVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:searchVC animated:YES];
            
        } failure:^(__kindof JCAddressList_Read *request, NSError *error) {
            
           
        }];
    }
    
    if (indexPath.section == 1)
    {
        //直接跳转到用户详情
        SearchDetailsViewController *searchDetailsVC = [[SearchDetailsViewController alloc]init];
        searchDetailsVC.infoData = _dataArray2[indexPath.row];
        searchDetailsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:searchDetailsVC animated:YES];
    }

}

//读取数据
-(void)readData {
    
    [HttpTool getRequestWithURLStr:address_list params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken]} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_DepartmentBase *base = [[JCModel_DepartmentBase alloc]initWithDictionary:responseDic];
            if (base.data.count > 0)
            {
                JCModel_DepartmentData *data = base.data[0];
                if (data.parentId == NULL)
                {
                    _dataArray = data.nodes;
                }
                else
                {
                    _dataArray = base.data;
                }
            }
            [self.tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
       
    } failure:^(NSError *error) {
                                                             
        
    }];

    [self.tableView.mj_header endRefreshing];
}

-(void)readOtherData {
    
    [HttpTool postRequestWithURLStr:getOrgUserExInfo params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken]} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_employeeInfoBase *base = [[JCModel_employeeInfoBase alloc]initWithDictionary:responseDic];
            _dataArray2 = base.data;
            [self.tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
      
    } failure:^(NSError *error) {
        
    }];

    [self.tableView.mj_header endRefreshing];
}

//读取每个部门人数
-(void)readCount {
    
    [HttpTool getRequestWithURLStr:getOrgUserExtInfoNum params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken]} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_DepartmentCountBase *base = [[JCModel_DepartmentCountBase alloc]initWithDictionary:responseDic];
            _countDataArray = base.data;
            [self.tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
    [self.tableView.mj_header endRefreshing];
    
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
