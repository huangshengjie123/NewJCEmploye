//
//  NewDistributionViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDistributionViewController.h"
#import "Macro.h"
#import "NewDistributionTableViewCell.h"
#import "JCRequest_getDistributionByParamsWithPage.h"
#import "DataModels.h"
#import "NewDistributionDetailsViewController.h"
#import "WCQRCodeScanningVC.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "JCRequest_ReadWaterCardDetails.h"
#import "WatercardDetailsViewController.h"
#import "SGActionView.h"
#import "MMAlertView.h"

@interface NewDistributionViewController () <UITableViewDelegate,UITableViewDataSource,WCQRCodeDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation NewDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 100;
    
    self.title = @"配送";
    self.view.backgroundColor = JCBackgroundColor;
    
    
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"扫码"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    
    UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn2 addTarget:self action:@selector(buttonaction2) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn2 setTitle:@"切换" forState:UIControlStateNormal];
    [informationCardBtn2 setTitleColor:JCColorBlack forState:UIControlStateNormal];
    
    [informationCardBtn2 sizeToFit];
    UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem,informationCardItem2];
    
    [self addViews];
    
    [self readData];
}
-(void)buttonaction2 {
//    distribution_on_road
    
    [self readdeterminedData];
}

-(void)buttonAction {
    NSArray *array = @[@"输入卡号",@"扫描水卡"];
    MMPopupCompletionBlock completeBlock = ^(MMPopupView *popupView, BOOL finished){
        NSLog(@"animation complete");
    };
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择方式" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        if (index == 0) {
            MMAlertView *alertView = [[MMAlertView alloc]initWithInputTitle:@"输入客户水卡号码" detail:@"" placeholder:@"请填写正确的水卡号码" handler:^(NSString *text) {
                
                
                
                NSString *waterCardID =  text;
                
                //先去查询卡信息
                
                JCRequest_ReadWaterCardDetails *request = [[JCRequest_ReadWaterCardDetails alloc]init];
                
                LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                [request addAccessory:requestAccessory];
                NSString *token = [JCTokenManager getToken];
                NSLog(@"%@",waterCardID);
                request.requestArgument = @{
                                            @"isAppLogin":@"true",
                                            @"jc4login":token,
                                            @"id":waterCardID,
                                            };
                
                
                [request startWithBlockSuccess:^(__kindof JCRequest_ReadWaterCardDetails *request) {
                    //
                    NSLog(@"成功");
                    NSDictionary *dic = request.responseJSONObject;
                    NSLog(@"dic%@",dic);
                    
                    JCModel_WaterCardDetailsBase *base = [[JCModel_WaterCardDetailsBase alloc]initWithDictionary:dic];
                    
                    WatercardDetailsViewController *watercardDetailsVC = [[WatercardDetailsViewController alloc]init];
                    watercardDetailsVC.waterCardID = waterCardID;
                    watercardDetailsVC.base = base;
                    NSLog(@"%@",base);
                    [self.navigationController pushViewController:watercardDetailsVC animated:YES];
                    
                    
                } failure:^(__kindof JCRequest_ReadWaterCardDetails *request, NSError *error) {
                    NSLog(@"失败 %@",error);
                    
                    
                }];
                
                
            }];
            alertView.attachedView = self.view;
            alertView.attachedView.mm_dimBackgroundBlurEnabled = YES;
            alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
            [alertView showWithBlock:completeBlock];
        }
        
        if (index == 1) {
            
            WCQRCodeScanningVC *wcVC = [[WCQRCodeScanningVC alloc]init];
            wcVC.delegate = self;
            [self QRCodeScanVC:wcVC];
        }
        
    }];
    
    
}
//扫描二维码结果
-(void)scanOfdata:(NSString *)str {
    NSRange range = [str rangeOfString:@"="];
    
    NSString *waterCardID =  [str substringFromIndex:range.location + 1];
    
    //先去查询卡信息
    
    JCRequest_ReadWaterCardDetails *request = [[JCRequest_ReadWaterCardDetails alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSLog(@"<><><><><%@",waterCardID);
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":waterCardID,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadWaterCardDetails *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        NSLog(@"dic%@",dic);
        
        JCModel_WaterCardDetailsBase *base = [[JCModel_WaterCardDetailsBase alloc]initWithDictionary:dic];
        
        WatercardDetailsViewController *watercardDetailsVC = [[WatercardDetailsViewController alloc]init];
        watercardDetailsVC.waterCardID = waterCardID;
        watercardDetailsVC.base = base;
        NSLog(@"%@",base);
        [self.navigationController pushViewController:watercardDetailsVC animated:YES];
        
        
    } failure:^(__kindof JCRequest_ReadWaterCardDetails *request, NSError *error) {
        NSLog(@"失败 %@",error);
        
        
    }];
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
    
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"NewDistributionTableViewCell";
    // 1.缓存中取
    NewDistributionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewDistributionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_NewDostribution1List *listData = _dataArray[indexPath.row];
    
    
    
    cell.nameLabel.text = listData.customer.name;
//    cell.typeLabel.text  = listData.status;
    cell.typeLabel.text  = [JCTool newDistributionDetails:listData.status];

    cell.timeLabel.text  =listData.createTime;
    cell.phoneLabel.text = listData.customer.customerDetail.mobile;
    if (listData.customer.customerAddressList.count > 0) {
        JCModel_NewDostribution1CustomerAddressList *addressListData = listData.customer.customerAddressList[0];
        
        cell.addressLabel.text = addressListData.address;

    }
    
    NSString *itemString = @"";
    
    
    
    if (listData.items.count >0) {
        for (int i = 0; i < listData.items.count; i ++) {
            JCModel_NewDostribution1Items *itemData = listData.items[i];
            itemString = [NSString stringWithFormat:@"%@ %@ x %d",itemString,itemData.itemName,(int)itemData.num];
        }
    }
    
    cell.itemsLabel.text = itemString;

    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_NewDostribution1List *listData = _dataArray[indexPath.row];

    NewDistributionDetailsViewController *vc = [[NewDistributionDetailsViewController alloc]init];
    vc.idString = listData.listIdentifier;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readdeterminedData {
    
    JCRequest_getDistributionByParamsWithPage *request = [[JCRequest_getDistributionByParamsWithPage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
  
        NSString *ueserString = [JCTokenManager getUserID];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"staff":ueserString,
                                    @"status":@"distribution_on_road"
                                    };

    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getDistributionByParamsWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_NewDostribution1Base *base = [[JCModel_NewDostribution1Base alloc]initWithDictionary:dic];
        JCModel_NewDostribution1Data *data = [[JCModel_NewDostribution1Data alloc]init];
        data = base.data;
        
        _dataArray =  data.list;
        
        [_tableView  reloadData];
        
        
    } failure:^(__kindof JCRequest_getDistributionByParamsWithPage *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)readData {
    
    JCRequest_getDistributionByParamsWithPage *request = [[JCRequest_getDistributionByParamsWithPage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    if (_carId != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"carId":_carId
                                    };
    }else {
        NSString *ueserString = [JCTokenManager getUserID];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"staff":ueserString
                                    };
    }
 
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getDistributionByParamsWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_NewDostribution1Base *base = [[JCModel_NewDostribution1Base alloc]initWithDictionary:dic];
        JCModel_NewDostribution1Data *data = [[JCModel_NewDostribution1Data alloc]init];
        data = base.data;
        
        _dataArray =  data.list;
        
        [_tableView  reloadData];
        
        
    } failure:^(__kindof JCRequest_getDistributionByParamsWithPage *request, NSError *error) {
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
