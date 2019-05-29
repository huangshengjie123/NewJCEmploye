//
//  StockDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "StockDetailsViewController.h"
#import "Macro.h"
#import "JCTool.h"
#import "ItemsTableViewCell.h"
#import "LCNetworkConfig.h"
#import "JCRequst_getStoreHouseCom.h"
#import "SGActionView.h"
#import "NewStockViewController.h"
#import "JCRequest_getStoreHouseFac.h"
#import "JCRequest_getPurDisList.h"
@interface StockDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UILabel *nameLabel; //姓名
@property (nonatomic,strong) UILabel *phoneLabel; //手机
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UILabel *salesmanNameLabel;//业务员姓名
@property (nonatomic,strong) UILabel *stateLabel; //状态
@property (nonatomic,strong) UILabel *remakeLabel; //备注
@property (nonatomic,strong) UIView *midView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *timeLabel;//时间
@property (nonatomic,strong) UILabel *allLabel;// 商品总额
@property (nonatomic,strong) UILabel *realLabel;//实收金额
@property (nonatomic,strong) UILabel *numberLabel;//编号
@property (nonatomic,strong) UILabel *typeLabel;//客户类型

@property (nonatomic,strong) NSString *storeHouseIdString;//仓库id

@property (nonatomic,strong) NSString *distributerString;  //水仓库ID
@property (nonatomic,strong) NSString *storeHouseIdStringIDDD; // 配送ID

@end

@implementation StockDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"进货详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    
    [topView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.top.equalTo(topView.mas_top).offset(10);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = JCColorBlack;
    _phoneLabel.font = JCFont14;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView.mas_right).offset(-10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    _addressLabel.numberOfLines = 0;
    [topView addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.right.equalTo(topView).offset(-10);
        make.top.equalTo(_nameLabel.mas_bottom).offset(6);
    }];
    
    [topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.bottom.equalTo(_addressLabel.mas_bottom).offset(10);
    }];
    
    
    _midView = [[UIView alloc]init];
    _midView.backgroundColor = JCColorWithe;
    [self.view addSubview:_midView];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.height.equalTo(@(90+20 ));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorMidGray;
    label2.font = JCFont14;
    label2.text = @"类别:";
    [_midView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(_midView).offset(10);
    }];
    
    
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorBlack;
   
    _stateLabel.font = [UIFont boldSystemFontOfSize:12];
    [_midView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];

    
    UILabel*label11 = [[UILabel alloc]init];
    label11.text = @"配送员:";
    label11.font = JCFont14;
    label11.textColor = JCColorMidGray;
    [_midView addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(7);
    }];
    
    _salesmanNameLabel = [[UILabel alloc]init];
    _salesmanNameLabel.textColor = JCColorBlack;
    _salesmanNameLabel.font = JCFont14;
    [_midView addSubview:_salesmanNameLabel];
    [_salesmanNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label11.mas_right).offset(10);
        make.centerY.equalTo(label11);
    }];
    

    
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"订单编号:";
    label4.textColor = JCColorMidGray;
    label4.font = JCFont14;
    [_midView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label11.mas_bottom).offset(7);
    }];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.textColor = JCColorBlack;
    _numberLabel.font = JCFont14;
    [_midView addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.centerY.equalTo(label4);
    }];
    
   
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorMidGray;
    label.font = JCFont14;
    label.text = @"物品:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label4.mas_bottom).offset(7);
    }];
    
    _nameLabel.text = _listData.purchaserDetail.name;
    _phoneLabel.text = [JCTool changePurchaserOrder:_listData.status];
    _phoneLabel.textColor = JCColorBlue;
    
    _addressLabel.text = _listData.createTime;
    _addressLabel.textColor = JCColorMidGray;
    
    if ([_listData.type  isEqual: @"recharge"]) {
        _stateLabel.text = @"虚拟充值";
    }
    if ([_listData.type  isEqual: @"send"]) {
        _stateLabel.text = @"实体进货";
    }
    
    _numberLabel.text = _listData.listIdentifier;
    
    _salesmanNameLabel.text = [NSString stringWithFormat:@"%@",_listData.distributer];
    
    [self addTableView];
    [self addremakeView];
    
    
    if (_isBeyound == YES) {
        //如果是超期待办 就不添加任何按钮
    }else {
        
        
        //分公司的总监的审批按钮
        if ([_listData.status  isEqual: @"purchase_v_com_check"] || [_listData.status  isEqual: @"purchase_com_check"] ) {
            
            [self addBranchApprovalButton];
            
        }
        
        
        //总公司财务审批
        if ([_listData.status   isEqual: @"purchase_v_finance_check"] ||[_listData.status   isEqual: @"purchase_finance_check"]  ) {
            
            [self addFinanceCheckButton];
            
        }
        
        
        //充值重填
        if ([_listData.status   isEqual: @"purchase_v_rewrite"]) {
            
            
            [self addReWriteButton];
        }
        
        
        //配送主管确认
        if ([_listData.status isEqualToString:@"purchase_distribute_check"]) {
            
            [self adddistributeCheckButton];
            
        }
        
        NSString *userString = [JCTokenManager getUserID];
        
        //配送员确认
        if ([_listData.status isEqualToString:@"purchase_distribute_confirm"] && [ userString isEqualToString:[NSString stringWithFormat:@"%@",_listData.distributer]]) {
            
            [self distribute_confirmButton];
            
        }
        
        //配送主管确认
        if ([_listData.status isEqualToString:@"purchase_distributing"]) {
            
            [self distribute_confirmButton22];
            
        }
        
    }
    
   
}
-(void)distribute_confirmButton22{
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"完成配送";
    lable.textColor = JCColorWithe;
    lable.font = JCFont15;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.centerY.equalTo(button);
    }];
    
    button.tag = 11;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

//配送员确认
-(void)distribute_confirmButton {
    float w = (JCScreen_Width - 60)/2;
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"无法配送" forState:UIControlStateNormal];
    button.backgroundColor = JCColorWithe;
    [button setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button.tag = 9;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setTitle:@"下一步" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [button1 setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button1.tag = 10;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



//配送主管审核按钮
-(void)adddistributeCheckButton {
    
    float w = (JCScreen_Width - 60)/2;
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"不通过" forState:UIControlStateNormal];
    button.backgroundColor = JCColorWithe;
    [button setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button.tag = 7;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setTitle:@"选择配送员" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [button1 setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button1.tag = 8;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

//分公司审批按钮
-(void)addBranchApprovalButton{
    
    float w = (JCScreen_Width - 60)/2;
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"驳回" forState:UIControlStateNormal];
    button.backgroundColor = JCColorWithe;
    [button setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button.tag = 1;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setTitle:@"同意" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [button1 setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button1.tag = 2;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

//财务审批按钮
-(void)addFinanceCheckButton {
    float w = (JCScreen_Width - 80)/3;
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"驳回" forState:UIControlStateNormal];
    button.backgroundColor = JCColorWithe;
    [button setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button.tag = 3;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setTitle:@"打回修改" forState:UIControlStateNormal];
    button2.backgroundColor = JCColorWithe;
    [button2 setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.left.equalTo(button.mas_right).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button2.tag = 4;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setTitle:@"同意" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [button1 setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    button1.tag = 5;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addReWriteButton {
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"重填单据";
    lable.textColor = JCColorWithe;
    lable.font = JCFont15;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.centerY.equalTo(button);
    }];
    
    button.tag = 6;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)addremakeView {
    
    UIView *remakeView = [[UIView alloc]init];
    remakeView.backgroundColor = JCColorWithe;
    [self.view addSubview:remakeView];
    [remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"备注:";
    label4.font = JCFont14;
    label4.textColor = JCColorBlack;
    [remakeView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(remakeView).offset(10);
        make.top.equalTo(remakeView).offset(10);
    }];
    
    _remakeLabel = [[UILabel alloc]init];
    if ([_listData.comments  isEqual:@""]  || _listData.comments == nil ) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;
        
    }else {
        _remakeLabel.text = _listData.comments;
        
    }
    _remakeLabel.font = JCFont14;
    _remakeLabel.textColor = JCColorBlack;
    _remakeLabel.numberOfLines = 0;
    [remakeView addSubview:_remakeLabel];
    [_remakeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.right.equalTo(remakeView.mas_right).offset(-10);
        make.top.equalTo(label4);
    }];
    
    [remakeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
        make.bottom.equalTo(_remakeLabel.mas_bottom).offset(10);
    }];
    
}


-(void)addTableView {
    
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
            make.height.equalTo(@((self.listData.purchaserOrderCosts.count) * (25)));
        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
 
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listData.purchaserOrderCosts.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ItemsTableViewCell1";
    // 1.缓存中取
    ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    JCModel_searchPurchaserstabelPurchaserOrderCosts *probationCosts = _listData.purchaserOrderCosts[indexPath.row];
    
    
            cell.contentLabel.text = probationCosts.name;
            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
    
    
    return cell;
    
}

//按钮
-(void)buttonAction:(UIButton *)button {
    
    
    if (button.tag == 1) {
        //取消订单
        
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_stopPurchaserOrderBase *base = [[JCModel_stopPurchaserOrderBase alloc]init];
        
        base.command = @"stop";
        base.current = _listData.status ;
        JCModel_stopPurchaserOrderPurchaserOrder *order = [[JCModel_stopPurchaserOrderPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    NSLog(@"??>>>>>>>>>>>>>>>>>%@",dic);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
    }
    
    if (button.tag == 2) {
        // 请求头
        
        JCRequst_getStoreHouseCom *request = [[JCRequst_getStoreHouseCom alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequst_getStoreHouseCom *request) {
            //
            NSLog(@"成功");
            
            NSDictionary *dic = request.responseJSONObject;
            
            JCModel_getStoreHouseComBase *base = [[JCModel_getStoreHouseComBase alloc]initWithDictionary:dic];
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
            
            if (base.data.count >0) {
                
                for (int i = 0; i < base.data.count; i ++) {
                    JCModel_getStoreHouseComData *data = base.data[i];
                    [array addObject:data.name];
                }
                
            }
            
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                JCModel_getStoreHouseComData *data = base.data[index];
                _storeHouseIdString = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
                
                                   
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                
                        // 请求参数字典
                        JCModel_BranchApprovalBase *base = [[JCModel_BranchApprovalBase alloc]init];
                
                        base.command = @"next";
                        base.current = _listData.status;
                        JCModel_BranchApprovalPurchaserOrder *order = [[JCModel_BranchApprovalPurchaserOrder alloc]init];
                        order.purchaserOrderIdentifier = _listData.listIdentifier;
                        order.inStoreHouseId = _storeHouseIdString;
                        base.purchaserOrder = order;
                
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
                                    //取消销售成功 跳转回去
                                    [self.delegate takeSellSuccess];
                                    [self.navigationController popViewControllerAnimated:YES];
                
                                }else {
                                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                                    [self.view addSubview:hud];
                                    hud.label.text =msg;
                                    hud.mode = MBProgressHUDModeText;
                                    [hud showAnimated:YES];
                                    [hud hideAnimated:YES afterDelay:1];
                                    NSLog(@"??>>>>>>>>>>>>>>>>>%@",dic);
                                }
                            } else {
                                NSLog(@"请求失败error=%@", error);
                            }
                        }];
                
                        [task resume];

            }];
            
            
            
            
            
            
            NSLog(@"dic >>> %@",dic);
            
        } failure:^(__kindof JCRequst_getStoreHouseCom *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];

    }
    
    if (button.tag == 3) {
        //财务取消
        
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_stopPurchaserOrderBase *base = [[JCModel_stopPurchaserOrderBase alloc]init];
        
        base.command = @"stop";
        base.current = _listData.status ;
        JCModel_stopPurchaserOrderPurchaserOrder *order = [[JCModel_stopPurchaserOrderPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    NSLog(@"??>>>>>>>>>>>>>>>>>%@",dic);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    if (button.tag == 4) {
            //财务打回
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_FinanceCheckBase *base = [[JCModel_FinanceCheckBase alloc]init];
        
        base.command = @"next";
        base.current = _listData.status ;
        base.financeCheck = @"false";
        
        JCModel_FinanceCheckPurchaserOrder *order = [[JCModel_FinanceCheckPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    NSLog(@"??>>>>>>>>>>>>>>>>>%@",dic);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    
    if (button.tag == 5) {
        //财务同意
    
        
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_FinanceCheckBase *base = [[JCModel_FinanceCheckBase alloc]init];
        
        base.command = @"next";
        base.current = _listData.status ;
        base.financeCheck = @"true";
        
        JCModel_FinanceCheckPurchaserOrder *order = [[JCModel_FinanceCheckPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    NSLog(@"??>>>>>>>>>>>>>>>>>%@",dic);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    if (button.tag == 6) {
        //进入重填充值界面
        
        NewStockViewController *newVC = [[NewStockViewController alloc]init];
        newVC.reWritetypeString = @"v_rewrite";
        newVC.orderIdSring = _listData.listIdentifier;
        [self.navigationController pushViewController:newVC animated:YES];
        
        
    }
    
    
    //配送主管不同意
    if (button.tag == 7) {
        
    }
    
    //配送主管同意  先查仓库，再查配送员
    if (button.tag == 8) {
        JCRequest_getStoreHouseFac *request = [[JCRequest_getStoreHouseFac alloc]init];
        
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
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getStoreHouseFac *request) {
            //
            NSLog(@"成功");
            
            NSDictionary *dic = request.responseJSONObject;
            
            JCModel_getStoreHouseFacBase *base = [[JCModel_getStoreHouseFacBase alloc]initWithDictionary:dic];
            JCModel_getStoreHouseFacData *data = base.data;
       
            
            NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:10];
            if (data.list.count > 0) {
                for (int i = 0; i < data.list.count; i ++) {
                    JCModel_getStoreHouseFacList *listData = data.list[i];
                    
                    [array2 addObject:listData.name];
                }
            }
            
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array2 selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                JCModel_getStoreHouseFacList *listData = data.list[index];
                _storeHouseIdStringIDDD = [NSString stringWithFormat:@"%d",(int)listData.listIdentifier];
                
                
                JCRequest_getPurDisList *request = [[JCRequest_getPurDisList alloc]init];
                
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
                                            };
                
                
                [request startWithBlockSuccess:^(__kindof JCRequest_getPurDisList *request) {
                    //
                    NSLog(@"成功");
                    
                    NSDictionary *dic =request.responseJSONObject;
                    JCModel_getPurDisListBase *base = [[JCModel_getPurDisListBase alloc]initWithDictionary:dic];
                    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
                    if (base.data.count >0) {
                        for (int i = 0; i < base.data.count; i ++) {
                            JCModel_getPurDisListData *data = base.data[i];
                            [array addObject:data.name];
                        }
                    }
                    
                    
                    //设置选择框  -1 是为了什么都不选
                    [SGActionView showSheetWithTitle:@"选择配送员" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
                        JCModel_getPurDisListData *data = base.data[index];
                        _distributerString = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];


                        if (_storeHouseIdStringIDDD.length == 0) {
                            [self showInfo:@"请选择仓库"];
                            return ;
                        }
                        
                        if (_distributerString.length == 0) {
                            [self showInfo:@"请选择配送员"];
                            return ;
                        }
                        
                        
                        
                        // 请求头
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                        
                        // 请求参数字典
                        JCModel_distribute_checkBase *base = [[JCModel_distribute_checkBase alloc]init];
                        
                        base.command = @"next";
                        base.current = @"purchase_distribute_check" ;
                        base.distributeCheck = @"true";
                        
                        JCModel_distribute_checkPurchaserOrder *order = [[JCModel_distribute_checkPurchaserOrder alloc]init];
                        order.purchaserOrderIdentifier = _listData.listIdentifier;
                        order.distributer = _distributerString;
                        order.storeHouseId = _storeHouseIdStringIDDD;
                        base.purchaserOrder = order;
                        
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
                                    //取消销售成功 跳转回去
                                    [self.delegate takeSellSuccess];
                                    [self.navigationController popViewControllerAnimated:YES];
                                    
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
                        
                        
                    }];
                    
                    
                    
                } failure:^(__kindof JCRequest_getPurDisList *request, NSError *error) {
                    NSLog(@"失败 %@",error);
                }];
                
                
                
            }];
            
            
            
            
            
            
            
        } failure:^(__kindof JCRequest_getStoreHouseFac *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }
    
    
    if (button.tag == 9) {
        //无法配送
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_distribute_confirmBase *base = [[JCModel_distribute_confirmBase alloc]init];
        
        base.command = @"next";
        base.current = @"purchase_distribute_confirm" ;
        base.getStoreCheck = @"false";
        
        JCModel_distribute_confirmPurchaserOrder *order = [[JCModel_distribute_confirmPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
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
    
    
    if (button.tag == 10) {
        //配送下一步
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_distribute_confirmBase *base = [[JCModel_distribute_confirmBase alloc]init];
        
        base.command = @"next";
        base.current = @"purchase_distribute_confirm" ;
        base.getStoreCheck = @"true";
        
        JCModel_distribute_confirmPurchaserOrder *order = [[JCModel_distribute_confirmPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
    
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
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
    
    if (button.tag == 11) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_distribute_confirmBase *base = [[JCModel_distribute_confirmBase alloc]init];
        
        base.command = @"next";
        base.current = @"purchase_distributing" ;
      
        JCModel_distribute_confirmPurchaserOrder *order = [[JCModel_distribute_confirmPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _listData.listIdentifier;
        
        base.purchaserOrder = order;
        
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
                    //取消销售成功 跳转回去
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    NSLog(@"%@",msg);
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
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
