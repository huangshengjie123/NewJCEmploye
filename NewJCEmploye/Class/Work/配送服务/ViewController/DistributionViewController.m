//
//  DistributionViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DistributionViewController.h"
#import "SellTableViewCell.h"
#import "DataModels.h"
#import "Macro.h"
#import "JCRequest_ReadDistribution.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "LCNetworkConfig.h"
#import "WatercardDetailsViewController.h"
#import "JCRequest_ReadWaterCardDetails.h"
#import "SGActionView.h"
#import "MMAlertView.h"
@interface DistributionViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,WCQRCodeDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation DistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"快捷配送";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    [self addViews];
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"扫码"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索配送单(包含历史配送)";
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
        make.top.equalTo(self.searchBar.mas_bottom);
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
    
    
    static NSString *identifier = @"SellTableViewCell";
    // 1.缓存中取
    SellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_DistributionList *list = _dataArray[indexPath.row];
    
  
    
    cell.nameLabel.text = list.customer.name;
    cell.stateLabel.hidden = YES;
    cell.phoneLabel.text = list.customer.customerDetail.phone;
    cell.timeLabel.text = list.createTime;
    
    
    JCModel_DistributionCustomerAddressList *address = [[JCModel_DistributionCustomerAddressList alloc]init];
    if (list.customer.customerAddressList.count > 0) {
        address = list.customer.customerAddressList[0];
        
    }
    
    cell.addressLabel.text = [NSString stringWithFormat:@"%@%@",address.xpath,address.address];
    cell.addressLabel.textColor = JCColorBlack;
    NSString *itemString = @"";
    
    for (int i = 0; i< list.items.count; i ++) {
        JCModel_DistributionItems *cost  = list.items[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.itemName,(int)cost.num];
    }
    cell.itemsLabel.text = itemString;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(void)readData {
    JCRequest_ReadDistribution *request = [[JCRequest_ReadDistribution alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userId = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"staff":userId,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadDistribution *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        
        NSLog(@"dic%@",dic);
        JCModel_DistributionBase *base = [[JCModel_DistributionBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        
        [self.tableView reloadData];
        
        
    } failure:^(__kindof JCRequest_ReadDistribution *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

//扫描水卡二维码
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
