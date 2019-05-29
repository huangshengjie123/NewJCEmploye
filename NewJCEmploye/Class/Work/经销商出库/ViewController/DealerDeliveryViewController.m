//
//  DealerDeliveryViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerDeliveryViewController.h"
#import "DataModels.h"
#import "Macro.h"
#import "InAndOutTableViewCell.h"
#import "JCRequest_readFranchiserInoutOrder1.h"
#import "OutboundViewController.h"

@interface DealerDeliveryViewController () <UITableViewDelegate,UITableViewDataSource,OperationCompletedDelegate>

@property (nonatomic,strong)UITableView  *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation DealerDeliveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"经销商出库";
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
    
    static NSString *identifier = @"InAndOutTableViewCell";
    InAndOutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[InAndOutTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    JCModel_InAndOutList *listData = _dataArray[indexPath.row];
    
    if ([listData.reason  isEqual: @"Probation"])
    {
        cell.useLaebl.text = @"送试用";
    }
    if ([listData.reason isEqualToString:@"Sale"])
    {
        cell.useLaebl.text = @"销售";
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.applicantName.text = listData.applicantInfo.name;
    
    cell.stateLabel.text = [JCTool dealerdelivery:listData.status] ;
    NSLog(@"%@",listData.status);
    cell.stateLabel.textColor = JCColorBlue;
    cell.timeLabel.text = listData.createTime;
    
    NSString *itemsString = @"";
    for (int i = 0; i < listData.items.count; i ++)
    {
        JCModel_InAndOutItems *items = listData.items[i];
        itemsString = [NSString stringWithFormat:@"%@ %@ x %d",itemsString,items.name,(int)items.num];
    }
    
    cell.materialLabel.text = itemsString;
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

-(void)readData {
    
    JCRequest_readFranchiserInoutOrder1 *request = [[JCRequest_readFranchiserInoutOrder1 alloc]init];
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
                                @"storeHouse":_warehouseId   //仓库ID
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readFranchiserInoutOrder1 *request) {
        //
        NSLog(@"成功获取出库单");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
        JCModel_InAndOutData * data = base.data;
        _dataArray = data.list;
        
        [self.tableView reloadData];
    } failure:^(__kindof JCRequest_readFranchiserInoutOrder1 *request, NSError *error) {
        NSLog(@"失败出库单 %@",error);
    }];
    
}
-(void)operationCompleted {
    
    [self readData];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_InAndOutList *listData = _dataArray[indexPath.row];
    OutboundViewController *outboundVC = [[OutboundViewController alloc]init];
    outboundVC.delegate = self;
    outboundVC.listData = listData;
    outboundVC.vcString = @"all";
    [self.navigationController pushViewController:outboundVC animated:YES];
     
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
