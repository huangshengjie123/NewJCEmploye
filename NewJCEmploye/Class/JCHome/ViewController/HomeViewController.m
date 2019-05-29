//
//  HomeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "SDCycleScrollView.h"
#import "Macro.h"
#import "HomeTableViewCell.h"
#import "CBStoreHouseRefreshControl.h"
#import "JCTokenManager.h"
#import "DataModels.h"
#import "WorkGroupDetailsViewController.h"
#import "JCRequest_searchWorkGroupData.h"
#import "GenericModel.h"
#import "JCRequest_ReadAllSell.h"
#import "SellDetailsViewController.h"
#import "JCRequest_readMyProbationOrder.h"
#import "ProbationDetailsViewController.h"
#import "OutboundViewController.h"
#import "JCRequset_ReadinAndOutOrder.h"
#import "JCRequest_searchPurchaserOrders.h"
#import "StockDetailsViewController.h"
#import "WorkGroupDetailsViewController.h"
#import "JCRequest_readcomorder.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,ProbationDetailsSuccessDelegate,SellDetailsSuccessDelegate>


@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong) UITableView       *tableView;
@property (nonatomic,strong) NSArray           *dataArray;
@property (nonatomic,strong) NSArray           *data2Array;
@property (nonatomic,strong) NSString          *taskIDstring;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"洁澄水业";
    [self addViews];

    if ([JCTokenManager getToken] != nil)
    {
        [self requestDataList];
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    //判断是否登录
    if ([JCTokenManager getToken] == nil)
    {
        // 之前没有登录成功
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        loginVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController presentViewController:loginVC animated:NO completion:nil];
    }
    
}
-(void)requestDataList {
    
    [HttpTool getRequestWithURLStr:home_flow params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken] } success:^(NSDictionary *responseDic) {
        
//        NSLog(@"responseDic::::::::%@",responseDic);
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_BacklogBase *base = [[JCModel_BacklogBase alloc]initWithDictionary:responseDic];
            _dataArray = base.data;
            NSMutableArray *adArray = [NSMutableArray array];
            for (int i = 0; i< _dataArray.count; i ++)
            {
                JCModel_BacklogData *data = base.data[i];
                
                if (data.processBusinessId == nil)
                {
                    data.processBusinessId = @"";
                }
                
                NSString *string = data.processBusinessId;
                [adArray addObject:string];
            }
            _data2Array = adArray.mutableCopy;
            [_tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];
    [_tableView.mj_header endRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"WorkTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   
    JCModel_BacklogData *data = _dataArray[indexPath.row];
    if (data.processBusinessId == nil)
    {
        data.processBusinessId = @" ";
    }
    cell.classLabel.text = [NSString stringWithFormat:@"%@",data.processName];
    cell.userNameLabel.text = data.userName;
    cell.messageLabel.text = data.name;
    [cell.kImageView setImage:[UIImage imageNamed:@"待办"]];
    cell.timeLabel.text = data.createTime;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     //创建工作组的跳转   跳往工作组详情
     //销售订单
     //试用流程
     //跳转到出入库
     //送货详情
     //组员邀请
     //报销审批
     */
    JCModel_BacklogData *data = _dataArray[indexPath.row];
    _taskIDstring = data.taskId;
   
    //创建工作组的跳转   跳往工作组详情
    if ([data.status  isEqual: @"group_create_owner_check"])
    {
        [HttpTool postRequestWithURLStr:searchWorkGroup params:@{@"isAppLogin":@"true", @"jc4login":[JCTokenManager getToken], @"pageNum" :@"1", @"pageSize":@"100",@"type":@"all",@"id":data.params.workGroup,} success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                NSDictionary *dic = responseDic;
                JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
                JCModel_WorkGroupData *data = base.data;
                if (data.list.count > 0)
                {
                    JCModel_WorkGroupList *list = data.list[0];
                    WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
                    workGroupDetailsVC.workGrouplist = list;
                    workGroupDetailsVC.isHoom = YES;
                    workGroupDetailsVC.taskIDstring = _taskIDstring;
                    workGroupDetailsVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
                }
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    NSString *string = _data2Array[indexPath.row];
    //销售订单
    if ([data.processDefinitionKey  isEqual: @"Sale"] )
    {
        //去根据ID 查询销售单
        [HttpTool postRequestWithURLStr:getSaleOrdersByPageSearch params:@{ @"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken],@"pageNum" :@"1",@"pageSize":@"100",@"id":string,} success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                NSDictionary *dic = responseDic;
                JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
                JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
                data = base.data;
                if (data.list.count > 0)
                {
                    SellDetailsViewController *sellDetailsVc = [[SellDetailsViewController alloc]init];
                    sellDetailsVc.sellOrderList = data.list[0];
                    sellDetailsVc.signString = @"1";
                    sellDetailsVc.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:sellDetailsVc animated:YES];
                }
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    
    }
    
    //试用流程
    if ([data.processDefinitionKey  isEqual: @"Probation"])
    {
        
        [HttpTool postRequestWithURLStr:getProbationsByGuide params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken],@"pageNum":@"1", @"pageSize":@"100", @"id":string, } success:^(NSDictionary *responseDic) {

            if ([responseDic[@"code"] integerValue] == 200)
            {
                NSDictionary *dic =  responseDic;
                JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                JCModel_probationOrderData *data = base.data;
                
                if (data.list.count >0)
                {
                    JCModel_probationOrderList *list = data.list[0];
                    ProbationDetailsViewController *probationDetailsVC =[[ProbationDetailsViewController alloc]init];
                    probationDetailsVC.delegate = self;
                    probationDetailsVC.probationOrderList = list;
                    probationDetailsVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:probationDetailsVC animated:YES];
                    
                }
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {

        }];
    }
 
    //跳转到出入库
    if ([data.processDefinitionKey isEqualToString:@"OutStore"])
    {
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
                                    @"id":string,
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {
            //
            NSLog(@"成功获取出库单");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
            JCModel_InAndOutData * data = base.data;
            
            if (data.list.count > 0)
            {
                JCModel_InAndOutList *list = data.list[0];
                OutboundViewController *outVC =[[OutboundViewController alloc]init];
                outVC.listData = list;
                outVC.vcString = @"all";
                if ( [[JCTool determinesOutputStatusSringWith:outVC.listData.status]  isEqual: @"扫码出库"])
                {
                    outVC.vcString = @"my";
                }
                outVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:outVC animated:YES];
                
            }
            
       
        } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
            NSLog(@"失败出库单 %@",error);
        }];
    }
    
    
    if ([data.processDefinitionKey isEqualToString:@"PurchaseSend"]&&[data.status  isEqual: @"purchase_v_com_check"])
    {
        //送货详情
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
                                    @"id":string,
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
            //
            NSDictionary *dic = request.responseJSONObject;
            JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
            JCModel_searchPurchaserstabelData *data = base.data;
            if (data.list.count > 0)
            {
                JCModel_searchPurchaserstabelList *list = data.list[0];
                StockDetailsViewController *outVC =[[StockDetailsViewController alloc]init];
                outVC.listData = list;
                outVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:outVC animated:YES];
                
            }
            
            NSString *msg = [dic objectForKey:@"msg"];
            [self showInfo:msg];
        
        } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
            NSLog(@"失败出库单 %@",error);
        }];
        
    }
    
    if ([data.processDefinitionKey isEqualToString:@"PurchaseSend"] && [data.status  isEqual: @"purchase_com_check"] )
    {
        //送货详情
        JCRequest_readcomorder *request = [[JCRequest_readcomorder alloc]init];
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
                                    @"id":string,
                                    };
       
        [request startWithBlockSuccess:^(__kindof JCRequest_readcomorder *request) {
            
            NSDictionary *dic = request.responseJSONObject;
            NSLog(@"dic >>>>%@",dic);
            JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
            JCModel_searchPurchaserstabelData *data = base.data;
            
            if (data.list.count > 0)
            {
                JCModel_searchPurchaserstabelList *list = data.list[0];
                StockDetailsViewController *outVC =[[StockDetailsViewController alloc]init];
                outVC.listData = list;
                outVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:outVC animated:YES];
                
            }
            
            NSString *msg = [dic objectForKey:@"msg"];
            [self showInfo:msg];
            
        } failure:^(__kindof JCRequest_readcomorder *request, NSError *error) {
            NSLog(@"失败出库单 %@",error);
        }];
        
    }
    
      if ([data.processDefinitionKey isEqualToString:@"PullJoinWorkGroup"])
      {
        //组员邀请
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
              if (data.list.count > 0)
              {
                  JCModel_WorkGroupList *list = data.list[0];
                  WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
                  workGroupDetailsVC.workGrouplist = list;
                  workGroupDetailsVC.taskIDstring = _taskIDstring;
                  workGroupDetailsVC.isHoom = YES;
                  workGroupDetailsVC.hidesBottomBarWhenPushed = YES;
                  [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
              }
             
          } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
              
          }];
          
      }
    
      if ([data.processDefinitionKey isEqualToString:@"Scrap"]) {
       //报销审批
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
                                      @"id":string,
                                      };
          
          
          [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {
              //
              NSLog(@"成功获取出库单");
              NSDictionary *dic = request.responseJSONObject;
              JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
              JCModel_InAndOutData * data = base.data;
              
              if (data.list.count > 0)
              {
                  JCModel_InAndOutList *list = data.list[0];
                  OutboundViewController *outVC =[[OutboundViewController alloc]init];
                  outVC.listData = list;
                  outVC.vcString = @"all";
                  outVC.hidesBottomBarWhenPushed = YES;

                  [self.navigationController pushViewController:outVC animated:YES];
                  
              }
              
              
          } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
              NSLog(@"失败出库单 %@",error);
          }];

      }
}

//操作试用单 的返回
-(void)takeProbationSuccess {
    
    [self requestDataList];
}

//操作销售单 的返回
-(void)takeSellSuccess {
    
    [self requestDataList];
}
-(void)addViews {
    
    NSArray * array = @[@"WechatIMG1",@"bg1",@"bg2"];
    
    //创建轮播图，先不放网络图片
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, JCNew64,  KScreen_Width, KScreen_Width/2.3f ) imageNamesGroup:array];
    self.cycleScrollView.backgroundColor = JCColorWithe;
    [self.view addSubview:_cycleScrollView];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"消息与计划";
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = MidGrayColor;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(_cycleScrollView.mas_bottom).offset(10);
    }];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(label.mas_bottom).offset(5);
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestDataList)];
    
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
