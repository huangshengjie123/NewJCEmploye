//
//  CleanWaterViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CleanWaterViewController.h"
#import "Macro.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "LCNetworkConfig.h"
#import "WatercardDetailsViewController.h"
#import "JCRequest_ReadWaterCardDetails.h"
#import "SGActionView.h"
#import "MMAlertView.h"
#import "NewCleanOrderViewController.h"
#import "CleanWaterTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_ReadSearchDonationRecords.h"
#import "CleanDetailsViewController.h"

@interface CleanWaterViewController ()<WCQRCodeDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView  *tableView;
@property (nonatomic,strong) NSArray      *dataArray;

@end

@implementation CleanWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"水卡转赠";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"扫码"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    [self addViews];
    
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
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
    
    static NSString *identifier = @"CleanWaterTableViewCell";
    // 1.缓存中取
    CleanWaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[CleanWaterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_DonationRecordsList *listData  = _dataArray[indexPath.row];
    
    cell.timeLabel.text = listData.createTime;
    cell.contentLabel1.text = [NSString stringWithFormat:@"转出账号:%@",listData.fromCusName];
    cell.contentLabel2.text = [NSString stringWithFormat:@"转入账号:%@",listData.toCusName];
    
    
    NSString *itemString = @"";
    
    for (int i = 0; i< listData.donationRecordCosts.count; i ++)
    {
        JCModel_DonationRecordsDonationRecordCosts *cost  = listData.donationRecordCosts[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.itemName,(int)cost.num];
    }
    cell.contentLabel3.text = [NSString stringWithFormat:@"水:%@",itemString];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
}

-(void)readData {
    
    JCRequest_ReadSearchDonationRecords *request = [[JCRequest_ReadSearchDonationRecords alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userID = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"updater":userID,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadSearchDonationRecords *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_DonationRecordsBase *base = [[JCModel_DonationRecordsBase alloc]initWithDictionary:dic];
        JCModel_DonationRecordsData *data =base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadSearchDonationRecords *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_DonationRecordsList *listData  = _dataArray[indexPath.row];

    CleanDetailsViewController *vc = [[CleanDetailsViewController alloc]init];
    vc.listData = listData;
    [self.navigationController pushViewController:vc animated:YES];
}

//扫描水卡二维码
-(void)buttonAction {
    
    NSArray *array = @[@"输入卡号",@"扫描水卡"];
    MMPopupCompletionBlock completeBlock = ^(MMPopupView *popupView, BOOL finished){
        NSLog(@"animation complete");
    };
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择方式" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        if (index == 0)
        {
            MMAlertView *alertView = [[MMAlertView alloc]initWithInputTitle:@"输入客户水卡号码" detail:@"" placeholder:@"请填写正确的水卡号码" handler:^(NSString *text) {
                NSString *waterCardID =  text;
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
                    
//                    WatercardDetailsViewController *watercardDetailsVC = [[WatercardDetailsViewController alloc]init];
//                    watercardDetailsVC.waterCardID = waterCardID;
//                    watercardDetailsVC.base = base;
//                    NSLog(@"%@",base);
//                    [self.navigationController pushViewController:watercardDetailsVC animated:YES];
                    NewCleanOrderViewController *vc = [[NewCleanOrderViewController alloc]init];
                    vc.waterCardID =waterCardID;
                    vc.base = base;
                    [self.navigationController pushViewController:vc animated:YES];
                    
                } failure:^(__kindof JCRequest_ReadWaterCardDetails *request, NSError *error) {
                    NSLog(@"失败 %@",error);
                    
                    
                }];
                
                
            }];
            alertView.attachedView = self.view;
            alertView.attachedView.mm_dimBackgroundBlurEnabled = YES;
            alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
            [alertView showWithBlock:completeBlock];
        }
        
        if (index == 1)
        {
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
        
//        watercardDetailsVC.waterCardID = waterCardID;
//        watercardDetailsVC.base = base;
//
//        NSLog(@"%@",base);
//        [self.navigationController pushViewController:watercardDetailsVC animated:YES];
        NewCleanOrderViewController *vc = [[NewCleanOrderViewController alloc]init];
        vc.waterCardID =waterCardID;
        vc.base = base;
        [self.navigationController pushViewController:vc animated:YES];
        
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
