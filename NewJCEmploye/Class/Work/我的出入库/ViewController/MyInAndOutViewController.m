//
//  MyInAndOutViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  我的出入库记录

#import "MyInAndOutViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "DataModels.h"
#import "InAndOutTableViewCell.h"
#import "JCRequset_ReadinAndOutOrder.h"
#import "OutboundViewController.h"
#import "QQPopMenuView.h"
#import "SGActionView.h"
#import "JCRequest_ReadStorehouseInfo.h"
#import "InAndOutViewController.h"
#import "Request_readMyWarehouse.h"
#import "CommonInOutViewController.h"

@interface MyInAndOutViewController ()<JCSelectViewDelegate,UITableViewDelegate,UITableViewDataSource,OperationCompletedDelegate,CommonInOutDelegate>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSArray        *dataArray;
@property (nonatomic,strong) NSMutableArray *warehouseArray;
@property (nonatomic, assign) NSInteger     type;//类型区分
@property (nonatomic, assign) NSInteger     page;


@end

@implementation MyInAndOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的出入库";
    [self addViews];
    [self requestDataList];
    self.type = 0;
    self.page = 1;
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}

-(void)addButtonAction {
    
    [QQPopMenuView showWithItems:@[@{@"title":@"新建出库单",@"imageName":@"出库"},@{@"title":@"新建入库单",@"imageName":@"入库"},]width:150 triangleLocation:CGPointMake([UIScreen mainScreen].bounds.size.width-30, 64+5) action:^(NSInteger index) {
        
        NSLog(@"点击了第%ld行",index);
        [self readMywarehouse:index];
        
    }];
}

//先查自己所在仓库
-(void)readMywarehouse:(NSInteger )index2
{
    
    [HttpTool getRequestWithURLStr:getStoreHouseByUp params:@{@"isAppLogin":@"true", @"jc4login":[JCTokenManager getToken]} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            NSLog(@"成功获取自己仓库");
            NSDictionary *dic = responseDic;
            JCModel_MyWarehouseBase *base = [[JCModel_MyWarehouseBase alloc]initWithDictionary:dic];
            _warehouseArray = [NSMutableArray arrayWithCapacity:20];
            
            for (int i = 0; i < base.data.count;i++)
            {
                JCModel_StoreHouseInfoData *data = base.data[i];
                [_warehouseArray addObject:data.name];
            }
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:_warehouseArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                if (index2 == 0)
                {
                    CommonInOutViewController *commonInOutVC = [[CommonInOutViewController alloc]init];
                    JCModel_StoreHouseInfoData *data = base.data[index];
                    commonInOutVC.typeString = @"1";
                    commonInOutVC.warehouseName = data.name;
                    commonInOutVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
                    commonInOutVC.delegate = self;
                    [self.navigationController pushViewController:commonInOutVC animated:YES];
                }
                
                if (index2 == 1)
                {
                    CommonInOutViewController *commonInOutVC = [[CommonInOutViewController alloc]init];
                    commonInOutVC.typeString = @"2";
                    JCModel_StoreHouseInfoData *data = base.data[index];
                    commonInOutVC.warehouseName = data.name;
                    commonInOutVC.delegate = self;
                    commonInOutVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
                    [self.navigationController pushViewController:commonInOutVC animated:YES];
                }
                
            }];
            
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[@"出库单",@"入库单"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(jcselectView.mas_bottom);
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
    
    cell.stateLabel.text = [JCTool determinesOutputStatusSringWith:listData.status] ;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_InAndOutList *listData = _dataArray[indexPath.row];
    OutboundViewController *outVC = [[OutboundViewController alloc]init];
    outVC.vcString = @"my";
    outVC.listData = listData;
    outVC.delegate = self;
    [self.navigationController pushViewController:outVC animated:YES];
    
}

-(void)requestDataList {
    
    // 0 是出库单   1 是入库单
    [HttpTool postRequestWithURLStr:getInOutOrdersAdvance params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken],@"pageNum":@"1",@"pageSize":@"100",@"type" : @(_type),@"applicant": [JCTokenManager getUserID] } success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            NSDictionary *dic = responseDic;
            JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
            JCModel_InAndOutData * data = base.data;
            _dataArray = data.list;
            [self.tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}

//出库入库 切换
-(void)buttonAction:(int)buttonNum {

    self.type = buttonNum;
    [self requestDataList];

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
