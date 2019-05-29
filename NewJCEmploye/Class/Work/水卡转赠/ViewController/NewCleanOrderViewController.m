//
//  NewCleanOrderViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewCleanOrderViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "MyCustomerViewController.h"
#import "RepertoryChooseViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "JCRequest_readWatercard.h"
#import "BindingViewController.h"

@interface NewCleanOrderViewController ()<UITableViewDataSource,UITableViewDelegate,MyCustomerDelegate,SelectItemsDelegate,BindlingSuccessDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *transferAccountsLabel;//转出账号
@property (nonatomic,strong) UILabel *intoAccountsLabel;//转入账号
@property (nonatomic,strong) UILabel *waterLabel;//水量
@property (nonatomic,strong) UITextField *remakeTextField;//备注

@property (nonatomic,strong) JCModel_WaterCardDetailsData *data;
@property (nonatomic,assign) double customerId; //客户ID
@property (nonatomic,strong) NSArray *waterArray;
@property (nonatomic,strong) NSString *cardIdString;//转入账户的水卡卡号

@end

@implementation NewCleanOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建水卡转赠";
    self.view.backgroundColor = JCBackgroundColor;
    
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
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
        make.top.equalTo(_tableView.mas_bottom).offset(20);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 0;
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"确定";
    lable.textColor = JCColorWithe;
    lable.font = JCFont14;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.centerX.equalTo(button);
    }];
    
    if (_base.data.count > 0) {
        JCModel_WaterCardDetailsData *data = _base.data[0];
        _data = data;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"NewProbationCustomTableViewCell";
    // 1.缓存中取
    NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"转出客户:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 1;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _transferAccountsLabel = cell.buttonLabel;
//
        _transferAccountsLabel.text = _data.username;
        
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"转入客户:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 2;

        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

        cell.buttonLabel.text = @"请选择";
        _intoAccountsLabel = cell.buttonLabel;
        
        
    }
    
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"水:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 3;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.buttonLabel.text = @"请选择";
        _waterLabel = cell.buttonLabel;

    }
    
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"备注:";
        cell.button.hidden = YES;
        cell.contentTextField.hidden = NO;
        cell.contentTextField.placeholder = @"请填写备注";
        _remakeTextField = cell.contentTextField;
    }
    
    return cell;
}

-(void)buttonAction:(UIButton *)button{
    
    if (button.tag == 2) {
        //选转出的对象
        
        MyCustomerViewController *myCustomerVC = [[MyCustomerViewController alloc]init];
        myCustomerVC.fromString = @"newCustomer";
        myCustomerVC.delegate = self;
        [self.navigationController pushViewController:myCustomerVC animated:YES];
        
    }
    if (button.tag == 3) {
        
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.isSimpleOutbound = YES;
        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if(button.tag == 0) {
        //确定转移
        
        if ([_cardIdString  isEqual: @"暂无绑定水卡"]) {
            //没有绑卡的情况  跳出绑卡界面
            BindingViewController *bindingVC = [[BindingViewController alloc]init];
            self.definesPresentationContext = YES; //self is presenting view controller
            bindingVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
            bindingVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
            bindingVC.delegate =  self;
            [self presentViewController:bindingVC animated:YES completion:nil];
            return;
        }
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@watercard/updateWaterCardItemsDonationByList.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_CleanWaterBase *base = [[JCModel_CleanWaterBase alloc]init];
        base.fromCardId = _waterCardID;
        base.toCardId = _cardIdString;
        base.toCusId = _customerId;
        base.needBind = false;
        
        
    
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:10];
        
        for (int i = 0; i < _waterArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *jsonCost = _waterArray[i];
            
            JCModel_CleanWaterItemXNums *item = [[JCModel_CleanWaterItemXNums alloc]init];;
        
            item.item = jsonCost.item;
            item.num = jsonCost.num;
            [mutableArray addObject:jsonCost];
        }
        base.itemXNums = mutableArray;
        
   
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
             
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    
                    
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =[NSString stringWithFormat:@"%@",msg];
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
//选择客户的返回
-(void)selectMyCustomerReturn:(JCModel_GetCustmerData *)custmerData {
    
    _intoAccountsLabel.text = custmerData.name;
    _customerId = custmerData.dataIdentifier;
    
    
    JCRequest_readWatercard *request = [[JCRequest_readWatercard alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    NSString *str = [NSString stringWithFormat:@"%d",(int)custmerData.dataIdentifier];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"owner": str,
                                };
    NSLog(@">>>>>>>>>>>>>>%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof JCRequest_readWatercard *request) {
        //
        NSLog(@"成功查询绑定水卡");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_WaterCardBase *base = [[JCModel_WaterCardBase alloc]initWithDictionary:dic];
        if (base.data.count == 0) {
            
            _cardIdString = @"暂无绑定水卡";
          
            
        }else {
            
            JCModel_WaterCardData *data = base.data[0];
            _cardIdString = data.dataIdentifier;
     
            
        }
        
    } failure:^(__kindof JCRequest_readWatercard *request, NSError *error) {
        NSLog(@"失败查询绑定水卡 %@",error);
    }];
    
}

-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    _waterArray = repertoryItemArray;    
    NSString *str = @"";
    
    for (int i = 0; i <_waterArray.count; i++) {
        JCModel_NewProbationOrderJsonCosts *jsonCost = _waterArray[i];
        
        str = [NSString stringWithFormat:@"%@ %@ x %d",str,jsonCost.name,(int)jsonCost.num];
    }
    
    _waterLabel .text = str;
    
}

-(void)bindlingSuccess:(NSString *)string {
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@watercard/updateWaterCardItemsDonationByList.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    JCModel_CleanWaterBase *base = [[JCModel_CleanWaterBase alloc]init];
    base.fromCardId = _waterCardID;
    base.toCardId = string;
    base.toCusId = _customerId;
    base.needBind = true;
    
    
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < _waterArray.count; i ++) {
        JCModel_NewProbationOrderJsonCosts *jsonCost = _waterArray[i];
        
        JCModel_CleanWaterItemXNums *item = [[JCModel_CleanWaterItemXNums alloc]init];;
        
        item.item = jsonCost.item;
        item.num = jsonCost.num;
        [mutableArray addObject:jsonCost];
    }
    base.itemXNums = mutableArray;
    
    
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
                
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }else {
                
                
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =[NSString stringWithFormat:@"%@",msg];
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
