//
//  WorikGroupViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorikGroupViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_searchWorkGroupData.h"
#import "WorkGroupTableViewCell.h"
#import "WorkGroupDetailsViewController.h"
#import "SGActionView.h"
#import "MyItemsViewController.h"
#import "AttributeViewController.h"
#import "JCRequest_ReadgetAccountsWithGroupBySearc.h"
#import "WorkLogViewController.h"
#import "ProbationViewController.h"
#import "SellViewController.h"
#import "BeyondbacklogViewController.h"
#import "WaterCardViewController.h"
#import "MyCustomerViewController.h"
#import "WarningViewController.h"
#import "ProbationCustomViewController.h"
#import "DealerBaseViewController.h"
#import "MyItemsViewController.h"
#import "JCRequest_readGroupJurisdiction.h"
#import "WorkGroupSearchToolViewController.h"

@interface WorikGroupViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray     *dataArray2;
@property (nonatomic,assign) BOOL        isTwo; //是否显示两个cell


@end

@implementation WorikGroupViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    [self addViews];
    [self readMyData];
    self.title = @"工作组";
    self.view.backgroundColor = JCBackgroundColor;
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索工作组";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    _searchBar.delegate = self;
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.searchBar.mas_bottom).offset(7);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0)
    {
        return _dataArray.count;
    }
    else
    {
        return _dataArray2.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"WorkGroupTableViewCell";
        WorkGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[WorkGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        JCModel_WorkGroupList *list = _dataArray[indexPath.row];
        cell.titelLabel.text = list.name;
        cell.categoryLabel.text =[JCTool conversionWorkGroup:list.type];
        
        if ([[JCTool conversionWorkGroup:list.type] isEqualToString:@"销售组"])
        {
            cell.button.hidden = NO;
            [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            cell.button.tag = indexPath.row;
        }
        else
        {
            cell.button.hidden = YES;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        static NSString *identifier = @"WorkGroupTableViewCell";
        WorkGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[WorkGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        JCModel_GroupEMPList *list = _dataArray2[indexPath.row];
        cell.titelLabel.text = list.name;
        cell.categoryLabel.text =list.orgName;
        //    cell.contentLabel.text = [JCTool conversionWorkGroup:list.type];
        cell.button.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0)
    {
        JCModel_WorkGroupList *list = _dataArray[indexPath.row];
        JCRequest_readGroupJurisdiction *request = [[JCRequest_readGroupJurisdiction alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"groupId":list.listIdentifier
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_readGroupJurisdiction *request) {
            //
            NSDictionary *dic = request.responseJSONObject;
            NSString *result = [dic objectForKey:@"result"];
            if ([result  isEqual: @"success"])
            {
                WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
                workGroupDetailsVC.workGrouplist = list;
                [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
            }
            else
            {
                [self showInfo:@"您没有权限查看该组"];
            }
            
        } failure:^(__kindof JCRequest_readGroupJurisdiction *request, NSError *error) {
            NSLog(@"失败 %@",error);
        
        }];

    }
    else
    {
        JCModel_GroupEMPList *list = _dataArray2[indexPath.row];
        if (list.saleGroupId == NULL || list.saleGroupId.length == 0)
        {
            //不是销售组的成员
            [self showInfo:@"该员工不是业务员"];
        }
        else
        {
            JCRequest_readGroupJurisdiction *request = [[JCRequest_readGroupJurisdiction alloc]init];
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
          
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"groupId":list.saleGroupId
                                        };
            
            [request startWithBlockSuccess:^(__kindof JCRequest_readGroupJurisdiction *request) {
                //
                NSLog(@"成功");
                NSDictionary *dic = request.responseJSONObject;
                NSString *result = [dic objectForKey:@"result"];
                
                if ([result  isEqual: @"success"])
                {
                    WorkGroupSearchToolViewController *vc =[[WorkGroupSearchToolViewController alloc]init];
                    vc.list = list;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else
                {
                    [self showInfo:@"您没有权限查看员工"];
                }
                
            } failure:^(__kindof JCRequest_readGroupJurisdiction *request, NSError *error) {
                NSLog(@"失败 %@",error);
            
            }];
        }
    }
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}

-(void)buttonAction:(UIButton *)button {
    
    JCModel_WorkGroupList *list = _dataArray[button.tag];
    JCRequest_readGroupJurisdiction *request = [[JCRequest_readGroupJurisdiction alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"groupId":list.listIdentifier
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readGroupJurisdiction *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        NSString *result = [dic objectForKey:@"result"];
        if ([result  isEqual: @"success"])
        {
            NSArray *array = @[@"试用报表",@"销售报表",@"物品统计"];
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择表类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                if (index == 2)
                {
                    MyItemsViewController *myItemsVC = [[MyItemsViewController alloc]init];
                    myItemsVC.sting = @"工作组";
                    myItemsVC.groupId = list.listIdentifier;
                    NSLog(@"%@",list.listIdentifier);
                    [self.navigationController pushViewController:myItemsVC animated:YES];
                }
                else
                {
                    AttributeViewController *attribute = [[AttributeViewController alloc]init];
                    attribute.titleString = array[index];
                    attribute.workGroupIdString = [NSString stringWithFormat:@"%@",list.listIdentifier];
                    attribute.isALL = YES;
                    [self.navigationController pushViewController:attribute animated:YES];
                }
                
            }];
            
        }
        else
        {
            [self showInfo:@"您没有权限查看该组"];
        }
        
    } failure:^(__kindof JCRequest_readGroupJurisdiction *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
        
    }];
}


-(void)readMyData {
    
    JCRequest_searchWorkGroupData *request = [[JCRequest_searchWorkGroupData alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString  *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"type":@"my"
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchWorkGroupData *request) {
        //
        NSLog(@"不是搜索的成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
        JCModel_WorkGroupData *data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
    }];
    
}
/* 搜索的 */
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if (searchText.length>0)
    {
        JCRequest_searchWorkGroupData *request = [[JCRequest_searchWorkGroupData alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"type":@"all",
                                    @"searchString":searchText
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchWorkGroupData *request) {
            //
            NSLog(@"搜索的1成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
            JCModel_WorkGroupData *data = base.data;
            _dataArray = data.list;
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
        }];
        
        JCRequest_ReadgetAccountsWithGroupBySearc *request2 = [[JCRequest_ReadgetAccountsWithGroupBySearc alloc]init];
        LCRequestAccessory *requestAccessory2 = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request2 addAccessory:requestAccessory2];
        NSString *token2 = [JCTokenManager getToken];
        NSString  *pageNum2 = [NSString stringWithFormat:@"1"];
        NSString  *pageSize2 = [NSString stringWithFormat:@"100"];
        request2.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token2,
                                    @"pageNum" :pageNum2,
                                    @"size":pageSize2,
                                    @"name":searchText
                                    };
    
        [request2 startWithBlockSuccess:^(__kindof JCRequest_ReadgetAccountsWithGroupBySearc *request) {
            //
            NSLog(@"搜索的2成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_GroupEMPBase *base = [[JCModel_GroupEMPBase alloc]initWithDictionary:dic];
            JCModel_GroupEMPData *data = base.data;
            _dataArray2 = data.list;
            [_tableView reloadData];
            NSLog(@"_dataArray2:::::%lu",(unsigned long)_dataArray2.count);
            
        } failure:^(__kindof JCRequest_ReadgetAccountsWithGroupBySearc *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
    }
    else
    {
        [self readMyData];
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
