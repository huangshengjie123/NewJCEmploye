//
//  SimpleOutboundViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SimpleOutboundViewController.h"
#import "Macro.h"
#import "RepertoryChooseViewController.h"
#import "LCNetworkConfig.h"
#import "JCRequest_readMyWaterInfo.h"
#import "DataModels.h"
#import "CustomerAddressListViewController.h"
#import "WatercardDetails2ViewController.h"
@interface SimpleOutboundViewController () <SelectItemsDelegate,MyCustomerAddressListDelegate>
@property (nonatomic,strong) UILabel *buttonLabel;
@property (nonatomic,strong) UILabel *addressbuttonLabel;
@property (nonatomic,strong) NSArray *waterArray;
@property (nonatomic,strong) NSString *selfCardIDString;
@property (nonatomic, assign) double addressId;
@property (nonatomic,assign) BOOL isRequesting;

@property (nonatomic,strong) UIButton *button;

@end

@implementation SimpleOutboundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_tpyeString  isEqual: @"2"]) {
        self.title = @"选择消费水种类";
        
    }else {
        self.title = @"配送简易出库";
    }
    self.view.backgroundColor = JCBackgroundColor;
    [self readMywatarCardData];
    [self addViews];
    NSLog(@"%@",_tpyeString);
    
}
-(void)readMywatarCardData {
    
    JCRequest_readMyWaterInfo *request = [[JCRequest_readMyWaterInfo alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userID = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"uowner":userID,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readMyWaterInfo *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_MyWaterCardInformationBase *base = [[JCModel_MyWaterCardInformationBase alloc]initWithDictionary:dic];
        for (int i = 0; i < base.data.count; i++) {
            JCModel_MyWaterCardInformationData *data =  base.data[i];
            if ((int)data.type == 4) {
                //如果是配送卡则取出卡号
                _selfCardIDString = data.dataIdentifier;
            }
        }
        
        
    } failure:^(__kindof JCRequest_readMyWaterInfo *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)addViews {
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = JCColorWithe;
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"物品:";
    label.textColor = JCColorBlack;
    label.font = JCFont14;
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView);
        make.left.equalTo(backView.mas_left).offset(10);
    }];
    float w = JCScreen_Width - 10 - label.frame.size.width;

    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor clearColor];
    [backView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(0);
        make.top.bottom.equalTo(backView);
        make.width.equalTo(@(w));
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel *buttonLabel = [[UILabel alloc]init];
    buttonLabel.textColor = JCColorBlue;
    buttonLabel.font = JCFont14;
    [button addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
//        make.width.equalTo(@(w));
        make.left.equalTo(label.mas_right).offset(10);
        make.right.equalTo(button.mas_right).offset(-10);
    }];
    _buttonLabel = buttonLabel;
    
    _buttonLabel.text = @"请选择";
    
    
    UIView *backView2 = [[UIView alloc]init];
    backView2.backgroundColor = JCColorWithe;
    [self.view addSubview:backView2];
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"地址:";
    label3.textColor = JCColorBlack;
    label3.font = JCFont14;
    [backView2 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView2);
        make.left.equalTo(backView2.mas_left).offset(10);
    }];
    
    UIButton *button3 = [[UIButton alloc]init];
    button3.backgroundColor = [UIColor clearColor];
    [backView2 addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(0);
        make.top.bottom.equalTo(backView2);
        make.width.equalTo(@(w));
    }];
    [button3 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel *buttonLabel3 = [[UILabel alloc]init];
    buttonLabel3.textColor = JCColorBlue;
    buttonLabel3.font = JCFont14;
    [button3 addSubview:buttonLabel3];
    [buttonLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button3);
        //        make.width.equalTo(@(w));
        make.left.equalTo(label3.mas_right).offset(10);
        make.right.equalTo(button3.mas_right).offset(-10);
    }];
    _addressbuttonLabel = buttonLabel3;
    
    _addressbuttonLabel.text = @"请选择";
    
    
    
    
    
//    UILabel *label2 = [[UILabel alloc]init];
//    label2.text = @"地址";
//    label2.textColor = JCColorBlack;
//    label2.font = JCFont14;
//    [backView addSubview:label2];
//    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
//
//    }];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    _button = button2;
    
    UILabel *label2= [[UILabel alloc]init];
    label2.textColor = JCColorWithe;
    label2.font = JCFont14;
    label2.text = @"确定";
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button2);
    }];
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 4.0;
    
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    _isRequesting = NO;
    
    
      if ([_tpyeString  isEqual: @"2" ] && _isRequesting == NO) {
          backView2.hidden = NO;

      }else {
          backView2.hidden = YES;
      }
    
}

-(void)button2Action {
    
  
    
    if ([_tpyeString  isEqual: @"2" ] && _isRequesting == NO) {
        // 请求头
        
        
        if ([_addressbuttonLabel.text  isEqual: @"请选择"]) {
            [self showInfo:@"请选择要配送的地址"];
            _button.userInteractionEnabled = YES;
            _button.backgroundColor = JCColorBlue;
        }else {
            
            _button.userInteractionEnabled = NO;
            _button.backgroundColor = JCColorMidGray;
            
            _isRequesting = YES;
            
            
            
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@watercard/changeWaterCardCusPointLoop.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_WaterConsumptionCardBase *base = [[JCModel_WaterConsumptionCardBase alloc]init];
            
            JCModel_WaterConsumptionCardDistribution *distribution = [[JCModel_WaterConsumptionCardDistribution alloc]init];
            distribution.items = _waterArray;
            
            
            distribution.cusId = _userID2;
            distribution.addrId = _addressId;
            
            base.distribution = distribution;
            
            NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:10];
            
            for (int i = 0; i < _waterArray.count; i ++) {
                JCModel_NewProbationOrderJsonCosts *jsonCost = _waterArray[i];
                
                JCModel_WaterConsumptionCardWaterCardChangeList *list = [[JCModel_WaterConsumptionCardWaterCardChangeList alloc]init];
                list.staffCardId = _selfCardIDString;
                list.item = jsonCost.item;
                list.num = jsonCost.num;
                list.cusCardId = _waterCardId;
                [mutableArray addObject:list];
            }
            base.waterCardChangeList = mutableArray;
            NSDictionary *params = base.dictionaryRepresentation;
            
            NSLog(@">>>>>>>>>>>>>>>>%@",params);
            
            AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
            request.timeoutInterval = 10.f;
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
            NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                if (!error) {
                    
                    NSArray *responseDictionary = (NSArray *)responseObject;
                    //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    NSString *result = [dic objectForKey:@"result"];
                    NSString *msg = [dic objectForKey:@"msg"];
                    if ([result isEqualToString:@"success"]) {
                        //消费成功
                        //
                        [self showInfo:@"消费成功"];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            
                            WatercardDetails2ViewController *vc = [[WatercardDetails2ViewController alloc]init];
                            vc.idSring = _waterCardId;
                            vc.userId =  [NSString stringWithFormat:@"%d",(int)_userID2];
                            [self.navigationController pushViewController:vc animated:YES];
                            
                        });
                        
                        _isRequesting = NO;
                        
                        
                        
                    }else {
                        MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                        [self.view addSubview:hud];
                        hud.label.text =msg;
                        hud.mode = MBProgressHUDModeText;
                        [hud showAnimated:YES];
                        [hud hideAnimated:YES afterDelay:1];
                        _isRequesting = NO;
                    }
                } else {
                    NSLog(@"请求失败error=%@", error);
                    _isRequesting = NO;
                }
            }];
            
            [task resume];
            
            
        }
        
        
       
        
    }else {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@distribution/doSimpleDistributionOutStore.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SimpleOutboundBase *base = [[JCModel_SimpleOutboundBase alloc]init];
        
        base.storeHouseId = _warehouseId.doubleValue;
        
        base.distributor = _userId.doubleValue;
        
        base.itemXNums = _waterArray;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                
                if ([result isEqualToString:@"success"]) {
                    
                    //出库成功
                    [self.delegate simpleOutboundSuceess];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =@"操作失败";
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];

                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
        
    }
    
}

-(void)buttonAction {
    
    
    RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
    repertoryChooseVC.typeString = @"1";
    repertoryChooseVC.delegate = self;
    repertoryChooseVC.warehouseString = _warehouseName;
    repertoryChooseVC.warehouseId = _warehouseId;
    repertoryChooseVC.isSimpleOutbound = YES;
    
    [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    
    
}
-(void)buttonAction2 {
    CustomerAddressListViewController *vc = [[CustomerAddressListViewController alloc]init];
    vc.userID = [NSString stringWithFormat:@"%d",(int)_userID2];
    vc.delegate =self;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {

    _waterArray = repertoryItemArray;
    NSLog(@">>>>>>>>>>%@",repertoryItemArray);
    
    NSString *str = @"";
    
    for (int i = 0; i <_waterArray.count; i++) {
        JCModel_NewProbationOrderJsonCosts *jsonCost = _waterArray[i];
        
       str = [NSString stringWithFormat:@"%@ %@ x %d",str,jsonCost.name,(int)jsonCost.num];
    }
    
    _buttonLabel .text = str;
   
}

-(void)selectMyCustomerAddressListReturn:(JCModel_customerAddressListData *)custmerData {
    
    _addressbuttonLabel.text = [NSString stringWithFormat:@"%@%@",custmerData.xpath,custmerData.address];
    
    _addressId = custmerData.addressId;
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
