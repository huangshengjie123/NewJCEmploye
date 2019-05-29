//
//  WorkGroupSeletedViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupSeletedViewController.h"
#import "Macro.h"
#import "JCAddressList_Read.h"
#import "DataModels.h"
#import "AddressListTableViewCell.h"
#import "JCAddressList_ReadOfOrgId.h"
#import "WorkGroupSeletedPNextViewController.h"

@interface WorkGroupSeletedViewController () <UITableViewDelegate,UITableViewDataSource,NewMyGroup1Delegate>

@property (nonatomic,strong) UITableView            *tableView;
@property (nonatomic,strong) NSArray                *dataArray;
@property (nonatomic,strong) JCModel_DepartmentData *departmentData;
@property (nonatomic,strong) NSArray                *countDataArray;
@property (nonatomic,strong) NSArray                *userDataArray;
@property (nonatomic,strong) UITableView            *tableView2; //各部门主要联系负责人电话
@property (nonatomic,strong) NSArray                *dataArray2;


@end

@implementation WorkGroupSeletedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择人员";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *identifier = @"AddressListTableViewCell";
    AddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[AddressListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    //显示各部门名称
    _departmentData = _dataArray[indexPath.row];
    cell.titleLabel.text = _departmentData.orgName;
    
    
    //加入部门人数
    for (int i = 0; i < _countDataArray.count; i ++) {
        
        JCModel_DepartmentCountData *data = _countDataArray[i];
        
        if (_departmentData.orgId == data.orgId) {
            
            cell.numLabel.text = [NSString stringWithFormat:@" (%d人)",(int)data.num];
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
        
        NSLog(@"获取某个部门员工信息成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_employeeInfoBase *base = [[JCModel_employeeInfoBase alloc]initWithDictionary:dic];
        _userDataArray = base.data;
        NSLog(@"员工信息 %@",_userDataArray);
        
        //跳转
//        SearchViewController *searchVC = [[SearchViewController alloc]init];
//        searchVC.userDataArray = _userDataArray;
//        [self.navigationController pushViewController:searchVC animated:YES];
        WorkGroupSeletedPNextViewController *vc = [[WorkGroupSeletedPNextViewController alloc]init];
        vc.userDataArray = _userDataArray;
        vc.delegate = self;
        if (_fromSring.length >0) {
            vc.fromSring = _fromSring;
        }
        vc.ismMultiselect = _ismMultiselect;
        [self.navigationController pushViewController:vc animated:YES];
        
    } failure:^(__kindof JCAddressList_Read *request, NSError *error) {
        
        NSLog(@"获取某个部门员工信息失败 %@",error);
        
    }];
}


//读取数据
-(void)readData {
    
    JCAddressList_Read *request = [[JCAddressList_Read alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    [request startWithBlockSuccess:^(__kindof JCAddressList_Read *request) {
        
        NSLog(@"获取通讯一级分类成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_DepartmentBase *base = [[JCModel_DepartmentBase alloc]initWithDictionary:dic];
        if (base.data.count > 0) {
            JCModel_DepartmentData *data = base.data[0];
            if (data.parentId == NULL) {
                _dataArray = data.nodes;
                
            }else {
                _dataArray = base.data;
            }
        }
        
        
        
        [self.tableView reloadData];
        
    } failure:^(__kindof JCAddressList_Read *request, NSError *error) {
        
        NSLog(@"获取通讯一级分类失败 %@",error);
        
    }];
    
}


-(void)NewMyGroup:(JCModel_employeeInfoData *)data {

    [self.delegate NewMyGroup:data];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)NewMyGroupArray:(NSArray *)array {
    
    [self.delegate NewMyGroupArray:array];
    [self.navigationController popViewControllerAnimated:YES];

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
