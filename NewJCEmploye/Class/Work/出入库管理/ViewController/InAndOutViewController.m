//
//  InAndOutViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "InAndOutViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "InAndOutTableViewCell.h"
#import "QQPopMenuView.h"
#import "OutboundViewController.h"
#import "TotalViewController.h"
#import "JCRequset_ReadinAndOutOrder.h"
#import "DataModels.h"
#import "JCTool.h"
#import "Request_readMyWarehouse.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "LCNetworkConfig.h"
#import "RepertoryChooseViewController.h"
#import "SimpleOutboundViewController.h"

@interface InAndOutViewController ()<JCSelectViewDelegate,UITableViewDelegate,UITableViewDataSource,OperationCompletedDelegate,WCQRCodeDelegate,SelectItemsDelegate,SimpleOutboundDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) NSArray     *warehouseArray;

@end

@implementation InAndOutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = JCBackgroundColor;
    self.title = _warehouseName;
    [self addViews];
    [self readInAndOut];
}

-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[@"出库单",@"入库单"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(jcselectView.mas_bottom);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(functionalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"列表"] forState:UIControlStateNormal];
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}
//导航栏总计功能按钮
-(void)functionalButtonAction {

    NSArray *array = @[@{@"title":@"出库总计",@"imageName":@"出库"},
                       @{@"title":@"入库总计",@"imageName":@"入库"},
                       @{@"title":@"快速出库",@"imageName":@"快速出库"},];
    [QQPopMenuView showWithItems:array width:130 triangleLocation:CGPointMake([UIScreen mainScreen].bounds.size.width-30, 64+5) action:^(NSInteger index) {
        
        if (index == 0)
        {
            TotalViewController *totalVC = [[TotalViewController alloc]init];
            totalVC.warehouseId = _warehouseId;
            totalVC.inoutSring = @"out";
            [self.navigationController pushViewController:totalVC animated:YES];
        }
        
        if (index == 1)
        {
            TotalViewController *totalVC = [[TotalViewController alloc]init];
            totalVC.warehouseId = _warehouseId;
            totalVC.inoutSring = @"in";
            [self.navigationController pushViewController:totalVC animated:YES];
        }
        
        if (index == 2 )
        {
            WCQRCodeScanningVC *wcVC = [[WCQRCodeScanningVC alloc]init];
            wcVC.delegate = self;
            [self QRCodeScanVC:wcVC];
        }
    }];
    
}
#pragma mark - UITableview代理 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"InAndOutTableViewCell";
    // 1.缓存中取
    InAndOutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
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
    if ([listData.reason isEqualToString:@"CooPoint"])
    {
        cell.useLaebl.text = @"合作点";
    }
    if ([listData.reason isEqualToString:@"CooPointAll"])
    {
        cell.useLaebl.text = @"合作点";
    }
    if ([listData.reason isEqualToString:@"Office"])
    {
        cell.useLaebl.text = @"其他";
    }
    if ([listData.reason isEqualToString:@"Distribution"])
    {
        cell.useLaebl.text = @"配送";
    }
    if ([listData.reason isEqualToString:@"Normal"])
    {
        cell.useLaebl.text = @"普通";
    }
    if ([listData.reason isEqualToString:@"Visit"])
    {
        cell.useLaebl.text = @"回访";
    }
    if ([listData.reason isEqualToString:@"PurchaseSend"])
    {
        cell.useLaebl.text = @"进货";
    }
    if ([listData.reason isEqualToString:@"FranGrantSale"])
    {
        cell.useLaebl.text = @"经销商支持出库";
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
    OutboundViewController *outboundVC = [[OutboundViewController alloc]init];
    outboundVC.delegate = self;
    outboundVC.listData = listData;
    outboundVC.vcString = @"all";
    [self.navigationController pushViewController:outboundVC animated:YES];
    
}
-(void)operationCompleted {
    //完成操作 刷新
    
    [self readInAndOut];
}

//先查自己所在仓库
-(void)readMywarehouse {
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
        _warehouseArray = base.data;
        
        [_tableView reloadData];
        
//        [self readInAndOut];
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}

-(void)readInAndOut {
    
    JCRequset_ReadinAndOutOrder *request = [[JCRequset_ReadinAndOutOrder alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"type" : @"0",// 0 是出库单   1 是入库单
                                @"storeHouse":_warehouseId   //仓库ID
                                };
    
    NSLog(@"%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {

        NSDictionary *dic = request.responseJSONObject;
        JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
        JCModel_InAndOutData * data = base.data;
        _dataArray = data.list;
        
        [self.tableView reloadData];
    } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
      

        
        
    }];
    
}

//出库入库 切换
-(void)buttonAction:(int)buttonNum {
    
    NSString *numTpye = [NSString stringWithFormat: @"%d",buttonNum];
    
    JCRequset_ReadinAndOutOrder *request = [[JCRequset_ReadinAndOutOrder alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"20"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"type" : numTpye,// 0 是出库单   1 是入库单
                                @"storeHouse":_warehouseId   //仓库ID
                                };
    
    NSLog( @"%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {
        //
        NSLog(@"成功获取出入库单");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
        JCModel_InAndOutData * data = base.data;
        _dataArray = data.list;
        
        [self.tableView reloadData];
    } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
        NSLog(@"失败出入库单 %@",error);
    }];
    
}
//
////导航栏搜索按钮
//-(void)searchButtonAction {
//
//
//}


//扫描二维码结果
-(void)scanOfdata:(NSString *)str {
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (str.length > 0) {
            
            SimpleOutboundViewController *simpleOutboundVC = [[SimpleOutboundViewController alloc]init];
            simpleOutboundVC.warehouseName = _warehouseName;
            simpleOutboundVC.warehouseId = _warehouseId;
            simpleOutboundVC.userId = str;
            simpleOutboundVC.delegate = self;
            [self.navigationController pushViewController:simpleOutboundVC animated:YES];
        }
        
        
    });
    
   
}

-(void)simpleOutboundSuceess {
    
    [self readInAndOut];
    
}

- (void)QRCodeScanVC:(UIViewController *)scanVC {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            [self.navigationController pushViewController:scanVC animated:YES];
                        });
                        NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
                        NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                [self.navigationController pushViewController:scanVC animated:YES];
                break;
            }
            case AVAuthorizationStatusDenied: {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                NSLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
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
