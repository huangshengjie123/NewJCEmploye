//
//  WatercardtopupViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardtopupViewController.h"
#import "Macro.h"
#import "JCRequest_ReadCusWaterCardInfo.h"
#import "DataModels.h"
#import "WatercardDetail2TableViewCell.h"
#import "JCRequest_getMyWaterCards2.h"
#import "RepertoryChooseViewController.h"
#import "LCNetworkConfig.h"
#import "JCModel_getWaterCardsByUowner1.h"
#import "JCRequest_ReadOrg2.h"
@interface WatercardtopupViewController ()<UITableViewDelegate,UITableViewDataSource,SelectItemsDelegate>

@property (nonatomic,strong) UILabel *itemsLabel;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *repertoryWaterArray;
@property (nonatomic,strong)  NSString *str;
@property (nonatomic,strong) NSString *cardidSTring;
@property (nonatomic,strong) NSString *orgID;//进货单位ID

@property (nonatomic,strong) NSString *myCardiDSring;//我的卡号

@end

@implementation WatercardtopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"充值水卡";
    self.view.backgroundColor = JCColorWithe;
    [self addViews];
    [self readData];
    [self readData2];
    if (_isFinancial == YES) {
        [self readData3];
    }
}

-(void)addViews {
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(5));
        make.top.equalTo(self.view).offset(JCNew64);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"物品:";
    label.font = JCFont15;
    label.textColor = JCColorBlack;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
    }];
    
    
    _itemsLabel = [[UILabel alloc]init];
    _itemsLabel.font = JCFont15;
    _itemsLabel.textColor = JCColorBlue;
    [self.view addSubview:_itemsLabel];
    [_itemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.left.equalTo(label.mas_right).offset(10);
        make.top.equalTo(label.mas_top);
    }];
    _itemsLabel.numberOfLines = 0;
    _itemsLabel.text = @"请选择";
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(5));
        make.top.equalTo(_itemsLabel.mas_bottom).offset(7);
    }];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.bottom.equalTo(lineView2.mas_top);
        make.left.right.equalTo(self.view);
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
        make.right.left.equalTo(self.view);
        make.top.equalTo(lineView2.mas_bottom).offset(0);
    }];
    
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.numberOfLines = 0;
    label2.textColor = JCColorBlack;
    label2.font = JCFont15;
    [topView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.right.equalTo(topView).offset(-10);
        make.centerY.equalTo(topView);
    }];
    label2.text = @"该列表为主管账号，分发给业务员的数量不能超过下方列表物品的各个数量";
    
    
    
    self.tableview = [[UITableView alloc]init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [button2 setTitle:@"充值" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-10);
    }];
    button2.titleLabel.font = JCFont14;
    button2.titleLabel.textColor = JCColorWithe;
    [button2 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
   
    
}

-(void)buttonAction {
    RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
    repertoryChooseVC.typeString = @"1";
    repertoryChooseVC.delegate = self;
    _str = @"请选择";
    repertoryChooseVC.isSimpleOutbound = YES;
    
    _repertoryWaterArray = nil;
    
    [self.navigationController pushViewController:repertoryChooseVC animated:YES];
}

-(void)buttonAction1 {
    //确定充值
    
    
    
    if (_isFinancial == YES) {
        //如果是财务充值
        if ([_itemsLabel.text  isEqual: @"请选择"] || [_itemsLabel.text  isEqual: @""]) {
            [self showInfo:@"请选择物品"];
            return;
        }
        
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/doRechargeToWaterCard.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        
        // 请求参数字典
        
        
        JCModel_FinancialPrepaidBase *base = [[JCModel_FinancialPrepaidBase alloc]init];
        base.purid = _orgID;
        base.waterCardId =_idString33;
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        
        for (int i = 0; i<_repertoryWaterArray.count; i++) {
            JCModel_NewProbationOrderJsonCosts *jsonCosts = _repertoryWaterArray[i];
            
            
            JCModel_chongzhiUPWaterCardChangeList *listData = [[JCModel_chongzhiUPWaterCardChangeList alloc]init];;
            
            listData.num = jsonCosts.num;
            listData.item = jsonCosts.item;

            [array addObject:listData];
        }
        
        
        
        
        base.itemXNums = array;
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
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    
                    [self showInfo:@"充值成功"];
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }else {
        
        if ([_itemsLabel.text  isEqual: @"请选择"] || [_itemsLabel.text  isEqual: @""]) {
            [self showInfo:@"请选择物品"];
            return;
        }
        
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@watercard/changeUserWaterCardAddLoop.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        
        // 请求参数字典
        JCModel_groupLeaderTransferwaterBase *base = [[JCModel_groupLeaderTransferwaterBase alloc]init];
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        
        for (int i = 0; i<_repertoryWaterArray.count; i++) {
            JCModel_NewProbationOrderJsonCosts *jsonCosts = _repertoryWaterArray[i];
            
            
            JCModel_groupLeaderTransferwaterWaterCardChangeList *listData = [[JCModel_groupLeaderTransferwaterWaterCardChangeList alloc]init];;
            
            listData.num = jsonCosts.num;
            listData.item = jsonCosts.item;
            
            listData.staffCardId = _myCardiDSring;
            listData.cusCardId = _idString33;
            [array addObject:listData];
        }

        base.waterCardChangeList = array;
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
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    
                    [self showInfo:@"充值成功"];
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return _dataArray.count;
 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"WatercardDetail2TableViewCell";
    // 1.缓存中取
    WatercardDetail2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[WatercardDetail2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
 
        JCModel_CusWaterInfoWaterCardItems *items = _dataArray[indexPath.row];
        
        cell.titleLabel.text = items.itemName;
        cell.contenLabel.text = [NSString stringWithFormat:@"x  %d",(int)items.num];
//        _idString2 = items.waterCardItemsIdentifier;
  
    
    return cell;
}


-(void)readData {
    JCRequest_getMyWaterCards2 *request = [[JCRequest_getMyWaterCards2 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getMyWaterCards2 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_CusWaterInfoBase *base = [[JCModel_CusWaterInfoBase alloc]initWithDictionary:dic];
        if (base.data.count > 0) {
            JCModel_CusWaterInfoData *data = base.data[0];
            
            _dataArray = data.waterCardItems;
            
            _myCardiDSring = data.dataIdentifier;
        }
        [_tableview reloadData];
        
        NSLog(@"%@",dic);
        
    } failure:^(__kindof JCRequest_getMyWaterCards2 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

-(void)readData2 {
//    JCModel_getWaterCardsByUowner1
    JCModel_getWaterCardsByUowner1 *request = [[JCModel_getWaterCardsByUowner1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"uowner":_numstring
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCModel_getWaterCardsByUowner1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
        JCModel_EmpWaterCardInfoBase *base = [[JCModel_EmpWaterCardInfoBase alloc]initWithDictionary:dic];
        if (base.data.count >0) {
            JCModel_EmpWaterCardInfoData *data= [[JCModel_EmpWaterCardInfoData alloc]init];
            data = base.data[0];
            _cardidSTring = data.dataIdentifier;
        }
        
    } failure:^(__kindof JCModel_getWaterCardsByUowner1 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

-(void)readData3 {
    JCRequest_ReadOrg2 *request = [[JCRequest_ReadOrg2 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCModel_getWaterCardsByUowner1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
        JCModel_searchOrg2Base *base = [[JCModel_searchOrg2Base alloc]initWithDictionary:dic];
        JCModel_searchOrg2Data *data = [[JCModel_searchOrg2Data alloc]init];
        data = base.data;
        _orgID = data.dataIdentifier;
        
    } failure:^(__kindof JCModel_getWaterCardsByUowner1 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}



//选择仓库
-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    if ([typeString  isEqual: @"1"]) {
        //水
        
        if ([_str  isEqual: @"请选择"] || _str == nil) {
            _str = @"";
        }
        if (repertoryItemArray.count == 0 ) {
            _repertoryWaterArray = @[];
            
            _itemsLabel.text = @"请选择";
            
        }else {
            _repertoryWaterArray = repertoryItemArray;
            for (int i = 0; i < repertoryItemArray.count; i ++ ) {
                JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
                
                _str = [NSString stringWithFormat:@"%@ %@ X %d",_str,costs.name,(int)costs.num];
                _itemsLabel.text = _str;
        
            }
        }

    }
    
}
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
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
