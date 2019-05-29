//
//  DealerOutputViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerOutputViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "LCRquest_searchFranchiserInOutOrders.h"
#import "InAndOutTableViewCell.h"
#import "NewDealerOutputViewController.h"
#import "Request_readMyWarehouse.h"
#import "SGActionView.h"
#import "OutboundViewController.h"
@interface DealerOutputViewController ()<UITableViewDelegate,UITableViewDataSource,OperationCompletedDelegate,NewFOutputSuccessDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSMutableArray *warehouseArray;

@end

@implementation DealerOutputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViews];
    [self readInAndOut];
    self.title = @"经销商出库";
    
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
}

-(void)buttonAction {
    

        Request_readMyWarehouse *request = [[Request_readMyWarehouse alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token
                                    };
        
        [request startWithBlockSuccess:^(__kindof Request_readMyWarehouse *request) {
            //
            NSLog(@"成功获取自己仓库");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_MyWarehouseBase *base = [[JCModel_MyWarehouseBase alloc]initWithDictionary:dic];
            
            _warehouseArray = [NSMutableArray arrayWithCapacity:20];
            
            for (int i = 0; i < base.data.count;i++) {
                JCModel_StoreHouseInfoData *data = base.data[i];
                [_warehouseArray addObject:data.name];
            }
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:_warehouseArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                
                NewDealerOutputViewController *new = [[NewDealerOutputViewController alloc]init];
                JCModel_StoreHouseInfoData *data = base.data[index];
                new.warehouseName = data.name;
                new.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
//                commonInOutVC.delegate = self;
                new.delegate = self;
                [self.navigationController pushViewController:new animated:YES];
                
            }];
            
            //在刷新前清空 所有储存的cell
            
        } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
            NSLog(@"失败获取自己仓库 %@",error);
        }];
  
    
   
    
    
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
    
    static NSString *identifier = @"InAndOutTableViewCell";
    // 1.缓存中取
    InAndOutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[InAndOutTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    JCModel_InAndOutList *listData = _dataArray[indexPath.row];
    
    NSLog(@"%@",listData.reason);
    
    if ([listData.reason  isEqual: @"Probation"]) {
        cell.useLaebl.text = @"送试用";
    }
    if ([listData.reason isEqualToString:@"Sale"]) {
        cell.useLaebl.text = @"销售";
    }

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.applicantName.text = listData.applicantInfo.name;
    
    cell.stateLabel.text = [JCTool determinesOutputStatusSringWith:listData.status] ;
    cell.stateLabel.textColor = JCColorBlue;
    cell.timeLabel.text = listData.createTime;
    
    NSString *itemsString = @"";
    for (int i = 0; i < listData.items.count; i ++) {
        JCModel_InAndOutItems *items = listData.items[i];
        
        itemsString = [NSString stringWithFormat:@"%@ %@ x %d",itemsString,items.name,(int)items.num];
        
    }
//    英文
    
    cell.materialLabel.text = itemsString;
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(void)readInAndOut {
    LCRquest_searchFranchiserInOutOrders *request = [[LCRquest_searchFranchiserInOutOrders alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSString *userId = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"type" : @"0",// 0 是出库单   1 是入库单
                                @"applicant": userId  // 用户ID
                                };
    
    [request startWithBlockSuccess:^(__kindof LCRquest_searchFranchiserInOutOrders *request) {
        //
        NSLog(@"成功获取出库单");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
        JCModel_InAndOutData * data = base.data;
        _dataArray = data.list;
        
        [self.tableView reloadData];
    } failure:^(__kindof LCRquest_searchFranchiserInOutOrders *request, NSError *error) {
        NSLog(@"失败出库单 %@",error);
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_InAndOutList *listData = _dataArray[indexPath.row];
    
    OutboundViewController *outVC = [[OutboundViewController alloc]init];
    outVC.vc = @"经销商";
    outVC.vcString = @"my";
    outVC.listData = listData;
    outVC.delegate = self;
    [self.navigationController pushViewController:outVC animated:YES];
    
}

//返回刷新
-(void)operationCompleted {
    [self readInAndOut];
}
-(void)newFOutputSuccess {
    [self readInAndOut];
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
