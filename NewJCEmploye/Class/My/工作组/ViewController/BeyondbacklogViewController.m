//
//  BeyondbacklogViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BeyondbacklogViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_getnumbertodolistovertime.h"
#import "HomeTableViewCell.h"
#import "JCRequest_searchWorkGroupData.h"
#import "WorkGroupDetailsViewController.h"
#import "JCRequest_ReadAllSell.h"
#import "SellDetailsViewController.h"
#import "JCRequest_readMyProbationOrder.h"
#import "ProbationDetailsViewController.h"
#import "JCRequset_ReadinAndOutOrder.h"
#import "OutboundViewController.h"
#import "JCRequest_searchPurchaserOrders.h"
#import "StockDetailsViewController.h"
@interface BeyondbacklogViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSString *taskIDstring;

@end

@implementation BeyondbacklogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"超期待办";
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
        make.top.equalTo(self.view).offset(JCNew64 +10);
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
    static NSString *identifier = @"WorkTableViewCell";
    // 1.缓存中取
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_BacklogData *data = _dataArray[indexPath.row];

    
    cell.classLabel.text = [NSString stringWithFormat:@"%@",data.processName];
    cell.userNameLabel.text = data.userName;
    cell.messageLabel.text = data.name;
    cell.timeLabel.text = data.createTime;
    [cell.kImageView setImage:[UIImage imageNamed:@"待办"]];
    
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_BacklogData *data = _dataArray[indexPath.row];
    
    _taskIDstring = data.taskId;
    NSLog(@"%@",data);
    
    //创建工作组的跳转   跳往工作组详情
    if ([data.status  isEqual: @"group_create_owner_check"]) {
        
        
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
                                    @"id":data.params.workGroup,
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchWorkGroupData *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
            JCModel_WorkGroupData *data = base.data;
            if (data.list.count > 0) {
                JCModel_WorkGroupList *list = data.list[0];
                WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
                workGroupDetailsVC.workGrouplist = list;
                workGroupDetailsVC.taskIDstring = _taskIDstring;
                workGroupDetailsVC.isBeyoud = YES;
                [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
                
                
                
            }
            NSLog(@"dic %@",dic);
            
            
            
        } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
            NSLog(@"失败 %@",error);
            
            
        }];
        
    }
    NSString *string = _dataArray[indexPath.row];
    
    //销售订单
    if ([data.processDefinitionKey  isEqual: @"Sale"] ) {
        
        
        //去根据ID 查询销售单
        JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
        
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
                                    @"id":data.processBusinessId,
                                    };
        
        NSLog(@">>>>%@",request.requestArgument);
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
            JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
            data = base.data;
            if (data.list.count > 0) {
                SellDetailsViewController *sellDetailsVc = [[SellDetailsViewController alloc]init];
                sellDetailsVc.sellOrderList = data.list[0];
                sellDetailsVc.signString = @"1";
                sellDetailsVc.isReadOfLeader = YES;
                [self.navigationController pushViewController:sellDetailsVc animated:YES];
            }
            
            
        } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }
    
    //试用流程
    if ([data.processDefinitionKey  isEqual: @"Probation"]) {
        
        
        JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"id":data.processBusinessId,
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
            //
            NSLog(@"成功获取试用单");
            NSDictionary *dic =  request.rawJSONObject;
            JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
            JCModel_probationOrderData *data = base.data;
            
            
            if (data.list.count >0) {
                
                JCModel_probationOrderList *list = data.list[0];
                
                ProbationDetailsViewController *probationDetailsVC =[[ProbationDetailsViewController alloc]init];
                
                probationDetailsVC.probationOrderList = list;
                probationDetailsVC.isReadOfLeader= YES;
                
                [self.navigationController pushViewController:probationDetailsVC animated:YES];
                
            }
            
        } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
            NSLog(@"失败获取试用单 %@",error);
        }];
        
        
    }
    
    //跳转到出入库
    if ([data.processDefinitionKey isEqualToString:@"OutStore"]) {
        
        JCRequset_ReadinAndOutOrder *request = [[JCRequset_ReadinAndOutOrder alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"id":data.processBusinessId,
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {
            //
            NSLog(@"成功获取出库单");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
            JCModel_InAndOutData * data = base.data;
            
            if (data.list.count > 0) {
                
                JCModel_InAndOutList *list = data.list[0];
                
                OutboundViewController *outVC =[[OutboundViewController alloc]init];
                outVC.listData = list;
                outVC.vcString = @"all";
                outVC.isBeyound = YES;
                [self.navigationController pushViewController:outVC animated:YES];
                
            }
            
            
        } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
            NSLog(@"失败出库单 %@",error);
        }];
    }
    
    
    if ([data.processDefinitionKey isEqualToString:@"PurchaseSend"]) {
        //送货详情
        
        //        JCRequest_searchPurchasers
        
        JCRequest_searchPurchaserOrders *request = [[JCRequest_searchPurchaserOrders alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"id":data.processBusinessId,
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
            //
            
            NSDictionary *dic = request.responseJSONObject;
            NSLog(@"dic >>>>%@",dic);
            JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
            JCModel_searchPurchaserstabelData *data = base.data;
            
            if (data.list.count > 0) {
                
                JCModel_searchPurchaserstabelList *list = data.list[0];
                
                StockDetailsViewController *outVC =[[StockDetailsViewController alloc]init];
                outVC.listData = list;
                
                outVC.isBeyound = YES;
                [self.navigationController pushViewController:outVC animated:YES];
                
            }
            
            
        } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
            NSLog(@"失败出库单 %@",error);
        }];
        
    }
    
}


-(void)readData {
    JCRequest_getnumbertodolistovertime *request = [[JCRequest_getnumbertodolistovertime alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"number":_numberString,
                                @"groupId":_groupId
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getnumbertodolistovertime *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_BacklogBase *base = [[JCModel_BacklogBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getnumbertodolistovertime *request, NSError *error) {
        NSLog(@"失败 %@",error);
        
        
        
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
