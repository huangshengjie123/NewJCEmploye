//
//  SellDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SellDetailsViewController.h"
#import "Macro.h"
#import "ItemsTableViewCell.h"
#import "Request_readMyWarehouse.h"
#import "NewSellViewController.h"
#import "SGActionView.h"
#import "JCRequest_readWatercard.h"
#import "DataModels.h"
#import "BindingViewController.h"
#import "LCNetworkConfig.h"
#import "MMAlertView.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "TopUpSummaryView.h"
#import "JCRequest_updateOrderGetamount.h"
#import "NewReturnGoodsViewController.h"
#import "FinancialConfirmViewController.h"

@interface SellDetailsViewController () <UITableViewDelegate,UITableViewDataSource,NewSellSuccessDelegate,BindlingSuccessDelegate,WCQRCodeDelegate,totalDelegate,CardDownAnimationViewDelegate>

@property (nonatomic,strong) UILabel *nameLabel; //姓名
@property (nonatomic,strong) UILabel *phoneLabel; //手机
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UILabel *salesmanNameLabel;//业务员姓名
@property (nonatomic,strong) UILabel *stateLabel; //状态
@property (nonatomic,strong) UILabel *remakeLabel; //备注
@property (nonatomic,strong) UIView  *midView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *timeLabel;//时间
@property (nonatomic,strong) UILabel *allLabel;// 商品总额
@property (nonatomic,strong) UILabel *realLabel;//实收金额
@property (nonatomic,strong) UILabel *numberLabel;//编号
@property (nonatomic,strong) UILabel *typeLabel;//客户类型


@property (nonatomic,strong) NSArray *warehouseArray;

@property (nonatomic,strong) NSString *waterCardId;
@property (nonatomic,assign) BOOL isbinded;

@property (nonatomic,strong) UIButton *button_1;
@property (nonatomic,strong) UIButton *button_2;

@property (nonatomic,strong) UIButton *rewriteButton;
@property (nonatomic,strong) UIButton *cancelButton;

@property (nonatomic,strong) UIButton *button_3;
@property (nonatomic,strong) UIButton *button_4;

@property (nonatomic,strong) NSString *franchiserSaleString;
@property (nonatomic,strong) NSString *franchiserSaleAmount;


@end

@implementation SellDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (_sellOrderList != nil)
    {
        self.title = @"销售单详情";
    }
    else if (_receivableOrderList != nil)
    {
        self.title = @"回款单详情";
    }
    else
    {
        self.title = @"经销商支持订单详情";
    }
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
        make.height.equalTo(@(90 + 60));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorMidGray;
    label2.font = JCFont14;
    label2.text = @"状态:";
    [_midView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(_midView).offset(10);
    }];
    

    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorWithe;
    _stateLabel.backgroundColor = JCColorMidGray;
    _stateLabel.font = [UIFont boldSystemFontOfSize:12];
    [_midView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    _stateLabel.layer.masksToBounds = YES;
    _stateLabel.layer.cornerRadius = 2;
    
    
    if ([_sellOrderList.status  isEqual: @"completed"]) {
        UIButton *button = [[UIButton alloc]init];
        button.backgroundColor = JCColorBlue;
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_stateLabel);
            make.left.equalTo(_stateLabel.mas_right).offset(30);
            make.height.equalTo(@(25));
            make.width.equalTo(@(40));
        }];
        
        UILabel *label10 =[[UILabel alloc]init];
        label10.text = @"退货";
        label10.font = JCFont12;
        label10.textColor = JCColorWithe;
        [button addSubview:label10];
        [label10 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(button);
            make.centerX.equalTo(button);
        }];
        
        [button addTarget:self action:@selector(returnGoods) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    UILabel*label11 = [[UILabel alloc]init];
    label11.text = @"业务员:";
    label11.font = JCFont14;
    label11.textColor = JCColorMidGray;
    [_midView addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(7);
    }];
    
    if (_listData != nil)
    {
        label11.text = @"经销商:";
    }
    
    _salesmanNameLabel = [[UILabel alloc]init];
    _salesmanNameLabel.textColor = JCColorBlack;
    _salesmanNameLabel.font = JCFont14;
    [_midView addSubview:_salesmanNameLabel];
    [_salesmanNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label11.mas_right).offset(10);
        make.centerY.equalTo(label11);
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"创建时间:";
    label3.textColor = JCColorMidGray;
    label3.font = JCFont14;
    [_midView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label11.mas_bottom).offset(7);

    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [_midView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(label3);
    }];
    
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"订单编号:";
    label4.textColor = JCColorMidGray;
    label4.font = JCFont14;
    [_midView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label3.mas_bottom).offset(7);
    }];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.textColor = JCColorBlack;
    _numberLabel.font = JCFont14;
    [_midView addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.centerY.equalTo(label4);
    }];
    
    UILabel *label5 = [[UILabel alloc]init];
    label5.text = @"总额:";
    label5.textColor = JCColorMidGray;
    label5.font = JCFont14;
    [_midView addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label4.mas_bottom).offset(7);
    }];
    
    _allLabel = [[UILabel alloc]init];
    _allLabel.textColor = JCColorBlack;
    _allLabel.font = JCFont14;
    [_midView addSubview:_allLabel];
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label5.mas_right).offset(10);
        make.centerY.equalTo(label5);
    }];
    
//    UILabel *label6 = [[UILabel alloc]init];
//    label6.text = @"实收款:";
//    label6.textColor = JCColorMidGray;
//    label6.font = JCFont14;
//    [_midView addSubview:label6];
//    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_midView).offset(10);
//        make.top.equalTo(label5.mas_bottom).offset(7);
//    }];
//
//    _realLabel = [[UILabel alloc]init];
//    _realLabel.textColor = JCColorBlack;
//    _realLabel.font = JCFont14;
//    [_midView addSubview:_realLabel];
//    [_realLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(label6.mas_right).offset(10);
//        make.centerY.equalTo(label6);
//    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorMidGray;
    label.font = JCFont14;
    label.text = @"物品:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label5.mas_bottom).offset(7);
    }];
    
    [self addTableView];
    [self readMywarehouse];
    [self addremakeView];
    
    if (_isReadOfLeader == YES)
    {
        //如果领导查看什么按钮都不加载
    }else {
        
        //判断 加载什么Button
        if ([_sellOrderList.status isEqualToString:sellStatus_create_order]) {
            
            [self addButton2];
        }
        
        if ([_sellOrderList.status isEqualToString:sellStatus_deliver]) {
            
            [self orderDelivery];
            
        }
        
        if ([_sellOrderList.status isEqualToString:sellStatus_pay_back_rewrite]) {
            
            [self addRewriteButton];
            
        }
        
        if ([_receivableOrderList.status isEqualToString:sellStatus_pay_back]) {
            
            [self addTwoButton];
        }
        
        if ([_sellOrderList.status isEqualToString:sellStatus_leader_check] && [_signString  isEqual: @"1"]) {
            [self addLeaderButton];
        }
        
        if ([_sellOrderList.status isEqualToString:@"f_sale_confirm"]) {
            [self addthreeButton];
        }
        
        if ([_listData.status isEqualToString:@"fgs_deliver"]) {
            [self orderDelivery2];
        }
        
        if ([_listData.status isEqualToString:@"fgs_pay_back"]) {
            [self addTwoButton3];
        }
    
    }
    
    //数据填充
    
    if (_sellOrderList != nil) {
        _nameLabel.text = _sellOrderList.customer.name;
        _phoneLabel.text = _sellOrderList.customer.customerDetail.mobile;
        
        if (_sellOrderList.customer.customerAddressList.count > 0) {
            JCModel_CustomerCustomerAddressList *addressList = _sellOrderList.customer.customerAddressList[0];
            _addressLabel.text = addressList.address;
        }
        _stateLabel.text = [JCTool determinesSellStatusSringWith:_sellOrderList.status];
        _timeLabel.text = _sellOrderList.createTime;
        _numberLabel.text = _sellOrderList.listIdentifier;
        _allLabel.text = [NSString stringWithFormat:@"%d",(int)_sellOrderList.getamount];
//        _realLabel.text = [NSString stringWithFormat:@"%d",(int)_sellOrderList.getamount];
        _salesmanNameLabel.text = _sellOrderList.guider.name;
        _typeLabel.text = _sellOrderList.type;
        
    }else if (_receivableOrderList != nil) {
        _nameLabel.text = _receivableOrderList.customer.name;
        _phoneLabel.text = _receivableOrderList.customer.customerDetail.phone;
        
        if (_receivableOrderList.customer.customerAddressList.count > 0) {
            JCModel_CustomerCustomerAddressList *addressList = _receivableOrderList.customer.customerAddressList[0];
            _addressLabel.text = addressList.address;
        }
        _stateLabel.text = [JCTool determinesSellStatusSringWith:_receivableOrderList.status];
        _timeLabel.text = _receivableOrderList.createTime;
        _numberLabel.text = _receivableOrderList.listIdentifier;
        _allLabel.text = [NSString stringWithFormat:@"%d",(int)_receivableOrderList.getamount];
//        _realLabel.text = [NSString stringWithFormat:@"%d",(int)_receivableOrderList.getamount];;
        _salesmanNameLabel.text = _receivableOrderList.guider.name;
        _typeLabel.text = _receivableOrderList.type;
        
    }else {
        _nameLabel.text = _listData.customer.name;
        _phoneLabel.text = _listData.customer.customerDetail.mobile;
        
        if (_listData.customer.customerAddressList.count > 0) {
            JCModel_EmpSupportOrderCustomerAddressList *addressList = _listData.customer.customerAddressList[0];
            _addressLabel.text = [NSString stringWithFormat:@"%@%@",addressList.xpath,addressList.address];
        }
        _stateLabel.text = [JCTool applicationSupport:_listData.status];
        _timeLabel.text = _listData.createTime;
        _numberLabel.text = _listData.listIdentifier;
        _allLabel.text = [NSString stringWithFormat:@"%@",_listData.amount];
        _realLabel.text = [NSString stringWithFormat:@"%@",_listData.getamount];;
        _salesmanNameLabel.text = _listData.franchiserDetail.name;
        
        _typeLabel.text = _listData.type;
    }

}

#pragma mark  退款流程
-(void)returnGoods {
    //发起退款流程
    
    // 请求头
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@refundment/dealRefundmentOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    JCModel_startReturnGoodsBase *base = [[JCModel_startReturnGoodsBase alloc]init];
    
    base.command = @"start";
    
    JCModel_startReturnGoodsRefundment *refundment = [[JCModel_startReturnGoodsRefundment alloc]init];
    refundment.oid = _sellOrderList.listIdentifier;
    
    
   
    base.refundment = refundment;
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
            
             NSLog(@"%@",dic);

            NSString *result = [dic objectForKey:@"result"];
          
            
            NSString *msg = [dic objectForKey:@"msg"];
           
            if ([result isEqualToString:@"success"]) {
           
                NSDictionary *dic2 = [dic objectForKey:@"data"];
                NSString *processBusinessId = [dic2 objectForKey:@"processBusinessId"];
                NewReturnGoodsViewController *vc= [[NewReturnGoodsViewController alloc]init];
                vc.sellOrderList = _sellOrderList;
                vc.newi2d = processBusinessId;
                [self.navigationController pushViewController:vc animated:YES];
                
            }else {
                [self showInfo:msg];
                NSLog(@"%@",msg);
            }
        } else {
            NSLog(@"请求失败error=%@", error);
        }
    }];
    
    [task resume];

    
}

-(void)addthreeButton {
    float w = (JCScreen_Width - 20 * 4) / 3;
    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = JCColorWithe;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    [button1 setTitle:@"修改金额" forState:UIControlStateNormal];
    [button1 setTitleColor:JCColorBlack forState:UIControlStateNormal];
    button1.titleLabel.font = JCFont15;
    [button1 addTarget:self action:@selector(buttonACtion1:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 0;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorWithe;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button1.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    [button2 setTitle:@"未成交" forState:UIControlStateNormal];
    [button2 setTitleColor:JCColorBlack forState:UIControlStateNormal];
    button2.titleLabel.font = JCFont15;
    [button2 addTarget:self action:@selector(buttonACtion1:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 1;

    
    UIButton *button3 = [[UIButton alloc]init];
    button3.backgroundColor = JCColorBlue;
    [self.view addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    [button3 setTitle:@"成交" forState:UIControlStateNormal];
    [button3 setTitleColor:JCColorWithe forState:UIControlStateNormal];
    button3.titleLabel.font = JCFont15;
    [button3 addTarget:self action:@selector(buttonACtion1:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 2;

    
}

-(void)buttonACtion1:(UIButton *)button {
    
    if (button.tag == 0) {
        //修改金额
        MMAlertView *view = [[MMAlertView alloc] initWithInputTitle:@"输入订单金额" detail:@"" placeholder:@"" handler:^(NSString *text) {
            
            _franchiserSaleAmount = text;
            
             _realLabel.text = _franchiserSaleAmount;
            
        }];
        [view show];
        
    }
    
    if (button.tag == 1) {
        
                    // 请求头
                    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                    NSString *token = [JCTokenManager getToken];
                    NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                    
                    // 请求参数字典
                    JCModel_bindingFranchiserOrderBase *base = [[JCModel_bindingFranchiserOrderBase alloc]init];
                    
                    base.command = @"next";
                    base.current = @"f_sale_confirm" ;
                    
                    base.waterCardId = _waterCardId;
                    base.needBindCard = @"false";
                    JCModel_bindingFranchiserOrderFranchiserOrder *sellNextOrder = [[JCModel_bindingFranchiserOrderFranchiserOrder alloc]init];;
                    
                    sellNextOrder.franchiserOrderIdentifier = _sellOrderList.listIdentifier;
                    sellNextOrder.type= @"cancel";
                    base.franchiserOrder = sellNextOrder;
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
                                //下一步成功
                                [self.delegate takeSellSuccess];
                                [self.navigationController popViewControllerAnimated:YES];
                                
                                _button_1.hidden = YES;
                                _button_2.hidden = YES;
                                
                                
                            }else {
                                [self showInfo:msg];
                                NSLog(@"%@",msg);
                            }
                        } else {
                            NSLog(@"请求失败error=%@", error);
                        }
                    }];
                    
                    [task resume];

    }
    
    
    if (button.tag == 2) {
       
        
        //查看是否绑定了水卡
        
        JCRequest_readWatercard *request = [[JCRequest_readWatercard alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        NSString *str = [NSString stringWithFormat:@"%d",(int)_sellOrderList.customer.customerIdentifier];
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
                //没有绑卡的情况  跳出绑卡界面
                BindingViewController *bindingVC = [[BindingViewController alloc]init];
                self.definesPresentationContext = YES; //self is presenting view controller
                bindingVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
                bindingVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
                bindingVC.delegate =  self;
                [self presentViewController:bindingVC animated:YES completion:nil];
                _isbinded = true;
                
                _franchiserSaleString = @"franchiser";
                
                
                
            }else {
                //绑卡了就传
                
                _isbinded = false;
                
                JCModel_WaterCardData *data = base.data[0];
                _waterCardId  = data.dataIdentifier;
                
                
                // 请求头
                LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                NSString *token = [JCTokenManager getToken];
                NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                
                // 请求参数字典
                JCModel_bindingFranchiserOrderBase *base = [[JCModel_bindingFranchiserOrderBase alloc]init];
                
                base.command = @"next";
                base.current = @"f_sale_confirm" ;
                
                base.waterCardId = _waterCardId;
                base.needBindCard = @"false";
                JCModel_bindingFranchiserOrderFranchiserOrder *sellNextOrder = [[JCModel_bindingFranchiserOrderFranchiserOrder alloc]init];;
                
                sellNextOrder.franchiserOrderIdentifier = _sellOrderList.listIdentifier;
                sellNextOrder.type= @"normal";
                base.franchiserOrder = sellNextOrder;
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
                            //下一步成功
                            [self.delegate takeSellSuccess];
                            [self.navigationController popViewControllerAnimated:YES];
                            
                            _button_1.hidden = YES;
                            _button_2.hidden = YES;
                            
                            
                        }else {
                            [self showInfo:msg];
                            NSLog(@"%@",msg);
                        }
                    } else {
                        NSLog(@"请求失败error=%@", error);
                    }
                }];
                
                [task resume];
                

            }
            
            
        } failure:^(__kindof JCRequest_readWatercard *request, NSError *error) {
            NSLog(@"失败查询绑定水卡 %@",error);
        }];
        
    }
}

-(void)addLeaderButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;

    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_1 = button1;
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"拒绝申请";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag = 8;
    [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _button_3 = button1;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_2 = button2;
    button2.tag = 9;
    [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"同意审批";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    _button_4 = button2;
    
    
    
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
}

-(void)addTwoButton {
    float w = (JCScreen_Width - 20 * 4) / 3;

    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_1 = button1;
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"驳回";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag = 6;
    [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _button_3 = button1;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_2 = button2;
    button2.tag = 7;
    [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"确认回款";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    _button_4 = button2;

    
    
    UIButton *button3 = [[UIButton alloc]init];
    button3.backgroundColor = JCColorBlue;
    [self.view addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button1.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button3.tag = 15;
    [button3 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"换水票";
    label3.textColor = JCColorWithe;
    [button3 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button3);
    }];
    
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
    button3.layer.masksToBounds = YES;
    button3.layer.cornerRadius = 3;
  
}

-(void)addTwoButton3 {
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_1 = button1;
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"驳回";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag = 13;
    [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _button_3 = button1;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_2 = button2;
    button2.tag = 14;
    [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"确认回款";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    _button_4 = button2;
    
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
}

//添加一个重填按钮
-(void)addRewriteButton {
    
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];

    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"取消订单";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag = 10;
    [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _cancelButton = button1;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
   
    button2.tag = 5;
    [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"重填金额";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    _rewriteButton = button2;


    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;

}

//添加补齐Button
-(void)addButton2 {
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    button.tag = 3;
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorWithe;
    label.text = @"补填完销售单";
    label.font = JCFont14;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button);
    }];
    [button addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)addremakeView  {
    
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
    if ([_sellOrderList.comments  isEqual:@""]  || _sellOrderList.comments == nil ) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;
        
    }else {
        _remakeLabel.text = _sellOrderList.comments;
        
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

//订单交付 状态进来
-(void)orderDelivery {
    float w = (JCScreen_Width - 20 * 3) / 2;

        //添加两个button
        UIButton *button1  = [[UIButton alloc]init];
        button1.backgroundColor = JCColorBlue;
        [self.view addSubview:button1];
        [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.width.equalTo(@(w));
            make.bottom.equalTo(self.view).offset(-20);
            make.height.equalTo(@(44));
        }];
        _button_1 = button1;
        UILabel *label1 = [[UILabel alloc]init];
        label1.text = @"取消销售";
        label1.textColor = JCColorWithe;
        [button1 addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(button1);
        }];
        button1.tag = 1;
        [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = [[UIButton alloc]init];
        button2.backgroundColor = JCColorBlue;
        [self.view addSubview:button2];
        [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-20);
            make.width.equalTo(@(w));
            make.bottom.equalTo(self.view).offset(-20);
            make.height.equalTo(@(44));
        }];
        _button_2 = button2;
        button2.tag = 2;
        [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];

        UILabel *label2 = [[UILabel alloc]init];
        label2.text = @"下一步";
        label2.textColor = JCColorWithe;
        [button2 addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(button2);
        }];
        
        button1.layer.masksToBounds = YES;
        button1.layer.cornerRadius = 3;
     
        button2.layer.masksToBounds = YES;
        button2.layer.cornerRadius = 3;

    
    
}
-(void)orderDelivery2 {
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_1 = button1;
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"取消销售";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag = 11;
    [button1 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button_2 = button2;
    button2.tag = 12;
    [button2 addTarget:self action:@selector(sellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"下一步";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
    
    
}

-(void)addTableView {
    
    
    if (_sellOrderList != nil) {
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
//            make.height.equalTo(@((self.sellOrderList.orderCosts.count + _sellOrderList.orderPresents.count ) * (25)));
            make.bottom.equalTo(self.view).offset(-120);
        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
    }else if (_receivableOrderList != nil) {
        
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
//            make.height.equalTo(@((self.receivableOrderList.orderCosts.count + _receivableOrderList.orderPresents.count) * (25)));
            make.bottom.equalTo(self.view).offset(-120);

        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
        
    } else {
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
//            make.height.equalTo(@((self.listData.orderCosts.count + _listData.orderPresents.count) * (25)));
            make.bottom.equalTo(self.view).offset(-120);

        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
    }

    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_sellOrderList != nil) {
        if (section == 0) {
            return _sellOrderList.orderCosts.count;
        }else {
            return  _sellOrderList.orderPresents.count;
        }
        
//        return _sellOrderList.orderCosts.count + _sellOrderList.orderPresents.count;
    }else if (_receivableOrderList != nil) {
        if (section == 0) {
            return _receivableOrderList.orderCosts.count;
        }else {
            return  _receivableOrderList.orderPresents.count;
        }
        
//         return _receivableOrderList.orderCosts.count + _receivableOrderList.orderPresents.count;
    }else {
        return _listData.orderCosts.count  +_listData.orderPresents.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    
    
    if (_sellOrderList != nil ) {
        if (indexPath.section == 0) {
            
            JCModel_SellOrderOrderCosts *probationCosts = _sellOrderList.orderCosts[indexPath.row];
            cell.contentLabel.text = probationCosts.name;
            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
            
        }

        
        if (indexPath.section == 1) {
            
            JCModel_SellOrderOrderPresents *present = _sellOrderList.orderPresents[indexPath.row];
            cell.contentLabel.text = present.name;
            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)present.num];
            
        }
      
        
    }else  if (_receivableOrderList != nil){
        
        if (indexPath.section == 0) {
            
            JCModel_ReceivableOrderOrderCosts *probationCosts = _receivableOrderList.orderCosts[indexPath.row];
            cell.contentLabel.text = probationCosts.name;
            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
            
        }
        
        
        if (indexPath.section == 1) {
            
            JCModel_ReceivableOrderOrderPresents *present = _receivableOrderList.orderPresents[indexPath.row];
            cell.contentLabel.text = present.name;
            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)present.num];
            
        }
        
    }else {
        
        if (indexPath.row <= _listData.orderCosts.count-1) {
            JCModel_EmpSupportOrderOrderCosts *orderCost = [[JCModel_EmpSupportOrderOrderCosts alloc]init];
            
           orderCost = _listData.orderCosts[indexPath.row];
            
         
            
            NSString *string = [orderCost valueForKey:@"name"];
            NSString * num = [orderCost valueForKey:@"num"];
           
            
            cell.contentLabel.text = string;
            cell.numberLabel.text = [NSString stringWithFormat:@"x  %@",num];
            
        }
        
        
        if (indexPath.row > _listData.orderCosts.count-1) {
            
            JCModel_EmpSupportOrderOrderPresents *present = _listData.orderPresents[indexPath.row - _listData.orderCosts.count];
            
            
            
            
            NSString *string = [present valueForKey:@"name"];
            NSString * num = [present valueForKey:@"num"];
            
            
            cell.contentLabel.text = string;
            cell.numberLabel.text = [NSString stringWithFormat:@"x  %@",num];
            
        }
        
    }
    
    
    
    return  cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = JCColorBlack;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    
    if (section == 0) {
        label.text = @"销售清单";
    }
    
    if (section == 1) {
        
        label.text = @"赠品清单";
    }
    return view ;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sellButtonAction:(UIButton *)button {
    
    MMPopupCompletionBlock completeBlock = ^(MMPopupView *popupView, BOOL finished){
        NSLog(@"animation complete");
    };
    if (button.tag == 3) {
        //补填销售订单
        
        NewSellViewController *newSellVC = [[NewSellViewController alloc]init];
        newSellVC.delegate = self;
        newSellVC.isNeedfilling = YES;
        newSellVC.sellOrderList = _sellOrderList;
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i<_warehouseArray.count; i++) {
            JCModel_MyWarehouseData *data = _warehouseArray[i];
            [array addObject:data.name];
        }

        [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {

            newSellVC.warehouseString = array[index];
            JCModel_MyWarehouseData *data = _warehouseArray[index];

            newSellVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];

            [self.navigationController pushViewController:newSellVC animated:YES];

        }];
        
    }
    
    if (button.tag == 1) {
        //取消销售
     
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SellNextBase *base = [[JCModel_SellNextBase alloc]init];
        
        base.command = @"next";
        base.current = sellStatus_deliver ;
//      
//        base.waterCardId = _waterCardId;
//        base.needBindCard = _isbinded;
        JCModel_SellNextOrder *sellNextOrder = [[JCModel_SellNextOrder alloc]init];;
        
        sellNextOrder.orderIdentifier = _sellOrderList.listIdentifier;
        sellNextOrder.type = @"cancel";
        base.order = sellNextOrder;
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
        //下一步操作
        
      
            

            //查看是否绑定了水卡
            
            JCRequest_readWatercard *request = [[JCRequest_readWatercard alloc]init];
            
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            
            NSString *str = [NSString stringWithFormat:@"%d",(int)_sellOrderList.customer.customerIdentifier];
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
                    //没有绑卡的情况  跳出绑卡界面
                    BindingViewController *bindingVC = [[BindingViewController alloc]init];
                    self.definesPresentationContext = YES; //self is presenting view controller
                    bindingVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
                    bindingVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
                    bindingVC.delegate =  self;
                    [self presentViewController:bindingVC animated:YES completion:nil];
                    _isbinded = true;
                    
                }else {
                    //绑卡了就传
                    
                    _isbinded = false;
                    
                    JCModel_WaterCardData *data = base.data[0];
                    _waterCardId  = data.dataIdentifier;
                    
                    
                    
                    
                    MMPopupItemHandler block = ^(NSInteger index) {
                        //添加的第一个元素索引为0，一次增加
                        if (index == 0) {
                            
                            // 请求头
                            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                            NSString *token = [JCTokenManager getToken];
                            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                            
                            // 请求参数字典
                            JCModel_SellNextBase *base = [[JCModel_SellNextBase alloc]init];
                            
                            base.command = @"next";
                            base.current = sellStatus_deliver ;
                            
                            base.waterCardId = _waterCardId;
                            base.needBindCard = _isbinded;
                            JCModel_SellNextOrder *sellNextOrder = [[JCModel_SellNextOrder alloc]init];;
                            
                            sellNextOrder.orderIdentifier = _sellOrderList.listIdentifier;
                            base.order = sellNextOrder;
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
                                        //下一步成功
                                        [self.delegate takeSellSuccess];
                                        [self.navigationController popViewControllerAnimated:YES];
                                        
                                        _button_1.hidden = YES;
                                        _button_2.hidden = YES;
                                        
                                        
                                    }else {
                                        [self showInfo:msg];
                                        NSLog(@"%@",msg);
                                    }
                                } else {
                                    NSLog(@"请求失败error=%@", error);
                                }
                            }];
                            
                            [task resume];
                        }
                        
                        if (index == 1) {
                            
                        }
                    };
                    NSArray *items =
                    @[MMItemMake(@"确定", MMItemTypeHighlight, block),
                      MMItemMake(@"取消", MMItemTypeNormal, block)];
                    MMAlertView *view = [[MMAlertView alloc] initWithTitle:@"确定该订单？" detail:@"" items:items];
                    
                    [view show];
                    
                    
                }
                
                
            } failure:^(__kindof JCRequest_readWatercard *request, NSError *error) {
                NSLog(@"失败查询绑定水卡 %@",error);
            }];
            
   
        
    }
    
    if (button.tag == 5) {
        //重填回款金额
        MMAlertView *alertView = [[MMAlertView alloc]initWithInputTitle:@"重填回款金额" detail:@"" placeholder:@"请填写正确的回款金额" handler:^(NSString *text) {
           
            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_rewritePayBackBase *base = [[JCModel_rewritePayBackBase alloc]init];
            
            base.command = @"next";
            base.current = sellStatus_pay_back_rewrite ;
            
        
            JCModel_rewritePayBackOrder *order = [[JCModel_rewritePayBackOrder alloc]init];;
            
            order.orderIdentifier = _sellOrderList.listIdentifier;
            if (text.length == 0) {
                [self showInfo:@"填写正确金额"];
            }else {
                order.getamount = text;
                base.order = order;
            }
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
                        //下一步成功
                                            [self.delegate takeSellSuccess];
                                            [self.navigationController popViewControllerAnimated:YES];
                        
                        [self showInfo:@"重填完成"];
                        _rewriteButton.hidden = YES;
                        
                    }else {
                        [self showInfo:msg];
                    }
                } else {
                    NSLog(@"请求失败error=%@", error);
                }
            }];
            
            [task resume];
            
            
            
        }];
        alertView.attachedView = self.view;
        alertView.attachedView.mm_dimBackgroundBlurEnabled = YES;
        alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
        [alertView showWithBlock:completeBlock];
    };
    
    if (button.tag == 6) {
        //拒绝驳回
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_PayBackUpBase *base = [[JCModel_PayBackUpBase alloc]init];
        
        base.command = @"next";
        base.current = sellStatus_pay_back ;
        base.isFinanceCheck = false;
        
        JCModel_PayBackUpOrder *order = [[JCModel_PayBackUpOrder alloc]init];;
        
        order.orderIdentifier = _receivableOrderList.listIdentifier;
   
        base.order = order;
       
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
                    //驳回成功
                    
                    [self showInfo:@"驳回成功"];
                    _button_3.hidden = YES;
                    _button_4.hidden = YES;
                    
                    
                }else {
                    [self showInfo:msg];
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
        
    }
    
    if (button.tag == 7) {
        // 请求头
//
//        cash 现金
//        transfer 转账
//        credit 信用卡
//        check 支票
        
        NSArray *array = @[@"现金",@"转账",@"刷卡",@"支票"];
        [SGActionView showSheetWithTitle:@"选择付款方式" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            
            
            
            
            MMAlertView *alertView = [[MMAlertView alloc]initWithInputTitle:@"重填回款金额" detail:@"" placeholder:@"请填写正确的回款金额" handler:^(NSString *text) {
                
                // 请求头
             
                LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                NSString *token = [JCTokenManager getToken];
                NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                
                // 请求参数字典
                JCModel_NewPayBackUpBase *base = [[JCModel_NewPayBackUpBase alloc]init];
                
                base.command = @"next";
                base.current = sellStatus_pay_back ;
                base.isFinanceCheck = true;
                
                JCModel_NewPayBackUpOrder *order = [[JCModel_NewPayBackUpOrder alloc]init];;
                
                order.orderIdentifier = _receivableOrderList.listIdentifier;
                
                JCModel_NewPayBackUpPayments *payment = [[JCModel_NewPayBackUpPayments alloc]init];
                payment.type = array[index];
                payment.amount = text.doubleValue;
                
                base.order = order;
                
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
                            
                            
                            [self showInfo:@"回款确认成功"];
                            
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                
                                [self.navigationController popViewControllerAnimated:YES];
                            });
                            
                            
                            
                        }else {
                            [self showInfo:msg];
                        }
                    } else {
                        NSLog(@"请求失败error=%@", error);
                    }
                }];
                
                [task resume];
                
                
            }];
            alertView.attachedView = self.view;
            alertView.attachedView.mm_dimBackgroundBlurEnabled = YES;
            alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleDark;
            [alertView showWithBlock:completeBlock];
        
            
        }];
        
        
    }
    
    if (button.tag == 8) {
        //拒绝审批
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SellLeaderCheckBase *base = [[JCModel_SellLeaderCheckBase alloc]init];

        base.command = @"next";
        base.current = sellStatus_leader_check ;
        base.leaderPass = false;
        
        JCModel_SellLeaderCheckOrder *probation = [[JCModel_SellLeaderCheckOrder alloc]init];;
        
        probation.orderIdentifier = _sellOrderList.listIdentifier;
        
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
                    //下一步拒绝成功  直接返回,重新刷新列表
                    [self.delegate takeSellSuccess];
                    
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
    
    if (button.tag == 9) {
        //同意审批
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SellLeaderCheckBase *base = [[JCModel_SellLeaderCheckBase alloc]init];
        
        base.command = @"next";
        base.current = sellStatus_leader_check ;
        base.leaderPass = true;
        JCModel_SellLeaderCheckOrder *probation = [[JCModel_SellLeaderCheckOrder alloc]init];;
        
        probation.orderIdentifier = _sellOrderList.listIdentifier;
        
        base.order = probation;
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
                    //下一步拒绝成功  直接返回,重新刷新列表
                    [self.delegate takeSellSuccess];
                    
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
    
    if (button.tag == 10) {
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_cancelSaleOrderBase *base = [[JCModel_cancelSaleOrderBase alloc]init];
        
        base.command = @"next";
        base.current = @"sale_pay_back_rewrite" ;
        base.rollBack = true;
        JCModel_cancelSaleOrderOrder *order = [[JCModel_cancelSaleOrderOrder alloc]init];;
        
        order.orderIdentifier = _sellOrderList.listIdentifier;
        
        base.order = order;
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
                    //下一步拒绝成功  直接返回,重新刷新列表
                    [self showInfo:@"取消成功"];
                    
                    self.cancelButton.hidden = YES;
                    self.rewriteButton.hidden = YES;

                    
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
    
    
    if (button.tag == 11) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_cancelDealFranchiserGrantOrderBase *base = [[JCModel_cancelDealFranchiserGrantOrderBase alloc]init];
        base.command = @"stop";
        base.current = @"fgs_deliver" ;
        JCModel_cancelDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_cancelDealFranchiserGrantOrderFranchiserOrder alloc]init];
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        base.franchiserOrder = order;
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
                    //下一步成功
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                    _button_1.hidden = YES;
                    _button_2.hidden = YES;
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                 
                }
            } else {
                NSLog(@"请求失败error=%@", error);
               
            }
        }];
        
        [task resume];
    }
    
    
    if (button.tag == 12) {
        
        
        //查看是否绑定了水卡
        
        JCRequest_readWatercard *request = [[JCRequest_readWatercard alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        NSString *str = [NSString stringWithFormat:@"%d",(int)_listData.customer.customerIdentifier];
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
                //没有绑卡的情况  跳出绑卡界面
                BindingViewController *bindingVC = [[BindingViewController alloc]init];
                self.definesPresentationContext = YES; //self is presenting view controller
                bindingVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
                bindingVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
                bindingVC.delegate =  self;
                [self presentViewController:bindingVC animated:YES completion:nil];
                _isbinded = true;
                
            }else {
                //绑卡了就传
                
                _isbinded = false;
                
                JCModel_WaterCardData *data = base.data[0];
                _waterCardId  = data.dataIdentifier;
                
                
                
                
                MMPopupItemHandler block = ^(NSInteger index) {
                    //添加的第一个元素索引为0，一次增加
                    if (index == 0) {
                        
                        // 请求头
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                        
                        // 请求参数字典
                        JCModel_suprrotDealFranchiserGrantOrderBase *base = [[JCModel_suprrotDealFranchiserGrantOrderBase alloc]init];
                        base.command = @"next";
                        base.current = @"fgs_deliver" ;
                        
                        base.waterCardId = _waterCardId;
                        
                        JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder alloc]init];
                        order.franchiserOrderIdentifier = _listData.listIdentifier;
                        base.franchiserOrder = order;
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
                                    //下一步成功
                                    [self.delegate takeSellSuccess];
                                    [self.navigationController popViewControllerAnimated:YES];
                                    
                                
                                    
                                    
                                }else {
                                    [self showInfo:msg];
                                    NSLog(@"%@",msg);
                                    _button_1.hidden = YES;
                                    _button_2.hidden = YES;
                                }
                            } else {
                                NSLog(@"请求失败error=%@", error);
                                _button_1.hidden = YES;
                                _button_2.hidden = YES;
                            }
                        }];
                        
                        [task resume];
                    }
                    
                    if (index == 1) {
                        
                    }
                };
                NSArray *items =
                @[MMItemMake(@"确定", MMItemTypeHighlight, block),
                  MMItemMake(@"取消", MMItemTypeNormal, block)];
                MMAlertView *view = [[MMAlertView alloc] initWithTitle:@"确定该订单？" detail:@"" items:items];
                
                [view show];
                
                
            }
            
            
        } failure:^(__kindof JCRequest_readWatercard *request, NSError *error) {
            NSLog(@"失败查询绑定水卡 %@",error);
        }];

    }
    
    if (button.tag == 13) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_cancelDealFranchiserGrantOrderBase *base = [[JCModel_cancelDealFranchiserGrantOrderBase alloc]init];
        base.command = @"stop";
        base.current = @"fgs_pay_back" ;
        JCModel_cancelDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_cancelDealFranchiserGrantOrderFranchiserOrder alloc]init];
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        base.franchiserOrder = order;
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
                    //下一步成功
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
                
            }
        }];
        
        [task resume];
    
    }
    
    if (button.tag == 14) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_cancelDealFranchiserGrantOrderBase *base = [[JCModel_cancelDealFranchiserGrantOrderBase alloc]init];
        base.command = @"next";
        base.current = @"fgs_pay_back" ;
        JCModel_cancelDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_cancelDealFranchiserGrantOrderFranchiserOrder alloc]init];
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        base.franchiserOrder = order;
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
                    //下一步成功
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
                
            }
        }];
        
        [task resume];
    }
    
    if (button.tag == 15) {
        //标记回款单为换水票
        
        
        MMPopupItemHandler block = ^(NSInteger index) {
            //添加的第一个元素索引为0，一次增加
            if (index == 0) {
                
                JCRequest_updateOrderGetamount *request = [[JCRequest_updateOrderGetamount alloc]init];
                
                LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                [request addAccessory:requestAccessory];
                NSString *token = [JCTokenManager getToken];
                
                request.requestArgument = @{
                                            @"isAppLogin":@"true",
                                            @"jc4login":token,
                                            @"id":_receivableOrderList.listIdentifier,
                                            };
                
                NSLog(@"%@",request.requestArgument);
                [request startWithBlockSuccess:^(__kindof JCRequest_updateOrderGetamount *request) {
                    //
                    
                    NSDictionary *dic = request.responseJSONObject
                    ;
                    NSString *result = [dic objectForKey:@"result"];
                    
                    if ([result  isEqual: @"success"]) {
                        NSLog(@"置0成功");
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                        
                        // 请求参数字典
                        JCModel_PayBackUpBase *base = [[JCModel_PayBackUpBase alloc]init];
                        
                        base.command = @"next";
                        base.current = sellStatus_pay_back ;
                        base.isFinanceCheck = true;
                        
                        JCModel_PayBackUpOrder *order = [[JCModel_PayBackUpOrder alloc]init];;
                        
                        order.orderIdentifier = _receivableOrderList.listIdentifier;
                        
                        base.order = order;
                        
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
                                    
                                    
                                    [self showInfo:@"换水票成功"];
                               
                                    [self.delegate takeSellSuccess];
                                    
                                    
                                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                        
                                        [self.navigationController popViewControllerAnimated:YES];
                                    });
                                 
                                    
                                }else {
                                    [self showInfo:msg];
                                }
                            } else {
                                NSLog(@"请求失败error=%@", error);
                            }
                        }];
                        
                        [task resume];
                    }
                    
                    
                } failure:^(__kindof JCRequest_updateOrderGetamount *request, NSError *error) {
                    NSLog(@"失败 %@",error);
                }];

            }
            
            if (index == 1) {
            }
        };
        NSArray *items =
        @[MMItemMake(@"确定", MMItemTypeHighlight, block),
          MMItemMake(@"取消", MMItemTypeNormal, block)];
        MMAlertView *view = [[MMAlertView alloc] initWithTitle:@"确定该订单为换水票？" detail:@"" items:items];
        
        [view show];
        
    }

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
        
        
        //在刷新前清空 所有储存的cell
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
    

        
        
}

-(void)bindlingSuccess:(NSString *)string {
    
    _waterCardId = string;
    
    if ([string  isEqual: @"扫码"]) {
        [self button1Action];
    }
    if (_listData != nil) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_suprrotDealFranchiserGrantOrderBase *base = [[JCModel_suprrotDealFranchiserGrantOrderBase alloc]init];
        base.command = @"next";
        base.current = @"fgs_deliver" ;
        
        base.waterCardId = _waterCardId;
        
        JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder alloc]init];
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        base.franchiserOrder = order;
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
                    //下一步成功
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                    
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                    _button_1.hidden = YES;
                    _button_2.hidden = YES;
                }
            } else {
                NSLog(@"请求失败error=%@", error);
                _button_1.hidden = YES;
                _button_2.hidden = YES;
            }
        }];
        
        [task resume];
        
        
    
    }else {
    
    if ([_franchiserSaleString  isEqual: @"franchiser"]) {

            
            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_BindedFranchiserOrderBase *base = [[JCModel_BindedFranchiserOrderBase alloc]init];
            
            base.command = @"next";
            base.current = @"f_sale_confirm" ;
            
            base.waterCardId = _waterCardId;
            base.needBindCard = @"true";
            JCModel_BindedFranchiserOrderFranchiserOrder *sellNextOrder = [[JCModel_BindedFranchiserOrderFranchiserOrder alloc]init];;
            
            sellNextOrder.franchiserOrderIdentifier = _sellOrderList.listIdentifier;
            sellNextOrder.type= @"normal";
        
        
        if (_franchiserSaleAmount.length > 0) {
            sellNextOrder.getamount = _franchiserSaleAmount;

        }else {
            sellNextOrder.getamount = [NSString stringWithFormat:@"%d",(int)_sellOrderList.getamount];;

        }
            base.franchiserOrder = sellNextOrder;
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
                        //下一步成功
                        [self.delegate takeSellSuccess];
                        [self.navigationController popViewControllerAnimated:YES];
                  
                        
                        
                    }else {
                        [self showInfo:msg];
                        NSLog(@"%@",msg);
                        
                        _button_1.hidden = YES;
                        _button_2.hidden = YES;
                    }
                } else {
                    NSLog(@"请求失败error=%@", error);
                    _button_1.hidden = YES;
                    _button_2.hidden = YES;
                }
            }];
            
            [task resume];
            
        
    }else {
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SellNextBase *base = [[JCModel_SellNextBase alloc]init];
        
        base.command = @"next";
        base.current = @"sale_deliver" ;
        
        base.waterCardId = _waterCardId;
        base.needBindCard = @"true";
        JCModel_SellNextOrder *sellNextOrder = [[JCModel_SellNextOrder alloc]init];;
        
        sellNextOrder.orderIdentifier = _sellOrderList.listIdentifier;
        sellNextOrder.type= @"normal";
        
        base.order = sellNextOrder;
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
                    //下一步成功
//                    [self.delegate takeSellSuccess];
//                    [self.navigationController popViewControllerAnimated:YES];
//
//                    _button_1.hidden = YES;
//                    _button_2.hidden = YES;
//
                    TopUpSummaryView *topUpSummaryView = [[TopUpSummaryView alloc] init];
                    topUpSummaryView.delegate = self;
                    topUpSummaryView.delegate2 = self;
                    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
                    for (int i = 0; i < _sellOrderList.orderCosts.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _sellOrderList.orderCosts[i];
                        [array addObject:costs];
                    }
                    
                    for (int i = 0; i < _sellOrderList.orderPresents.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _sellOrderList.orderPresents[i];
                        [array addObject:costs];
                    }
                    topUpSummaryView.dataArray = array;
                    
                    topUpSummaryView.namelabel.text = _sellOrderList.customer.name;
                    topUpSummaryView.waterCardIDLabel.text = _waterCardId;
                    
                    
                    [topUpSummaryView show];
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    
    }

    
}


//扫描水卡二维码
-(void)button1Action {
    
        WCQRCodeScanningVC *wcVC = [[WCQRCodeScanningVC alloc]init];
        wcVC.delegate = self;
        [self QRCodeScanVC:wcVC];
    
}
//扫描二维码结果
-(void)scanOfdata:(NSString *)str {
    
    NSRange range = [str rangeOfString:@"="];
    
    NSString *waterCardID =  [str substringFromIndex:range.location + 1];
    
       _waterCardId = waterCardID;
    if (_listData != nil) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_suprrotDealFranchiserGrantOrderBase *base = [[JCModel_suprrotDealFranchiserGrantOrderBase alloc]init];
        base.command = @"next";
        base.current = @"fgs_deliver" ;
        
        base.waterCardId = _waterCardId;
        
        JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder *order = [[JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder alloc]init];
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        base.franchiserOrder = order;
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
                    //下一步成功
                    [self.delegate takeSellSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                    
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                    _button_1.hidden = YES;
                    _button_2.hidden = YES;
                }
            } else {
                NSLog(@"请求失败error=%@", error);
                _button_1.hidden = YES;
                _button_2.hidden = YES;
            }
        }];
        
        [task resume];
        
        
        
    }else {
        
    
    
    if ([_franchiserSaleString  isEqual: @"franchiser"]) {
        

            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_BindedFranchiserOrderBase *base = [[JCModel_BindedFranchiserOrderBase alloc]init];
            
            base.command = @"next";
            base.current = @"f_sale_confirm" ;
            
            base.waterCardId = _waterCardId;
            base.needBindCard = @"true";
            JCModel_BindedFranchiserOrderFranchiserOrder *sellNextOrder = [[JCModel_BindedFranchiserOrderFranchiserOrder alloc]init];;
            
            sellNextOrder.franchiserOrderIdentifier = _sellOrderList.listIdentifier;
            sellNextOrder.type= @"normal";
        if (_franchiserSaleAmount.length > 0) {
            sellNextOrder.getamount = _franchiserSaleAmount;
            
        }else {
            sellNextOrder.getamount = [NSString stringWithFormat:@"%d",(int)_sellOrderList.getamount];;
            
        }
            base.franchiserOrder = sellNextOrder;
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
                        //下一步成功
                        [self.delegate takeSellSuccess];
                        [self.navigationController popViewControllerAnimated:YES];
                        
                        _button_1.hidden = YES;
                        _button_2.hidden = YES;
                        
                        
                    }else {
                        [self showInfo:msg];
                        NSLog(@"%@",msg);
                    }
                } else {
                    NSLog(@"请求失败error=%@", error);
                }
            }];
            
            [task resume];
            
            
 

    }
    else
    {
//        JCModel_SellNextOrder
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_SellNextBase *base = [[JCModel_SellNextBase alloc]init];
        
        base.command = @"next";
        base.current = @"sale_deliver" ;
        
        base.waterCardId = _waterCardId;
        base.needBindCard = @"true";
        JCModel_SellNextOrder *sellNextOrder = [[JCModel_SellNextOrder alloc]init];;
        
        sellNextOrder.orderIdentifier = _sellOrderList.listIdentifier;
        sellNextOrder.type= @"normal";
      
        base.order = sellNextOrder;
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
                    //下一步成功
//                    [self.delegate takeSellSuccess];
//                    [self.navigationController popViewControllerAnimated:YES];
//
//                    _button_1.hidden = YES;
//                    _button_2.hidden = YES;
                    
                    TopUpSummaryView *topUpSummaryView = [[TopUpSummaryView alloc] init];
                    topUpSummaryView.delegate = self;
                    topUpSummaryView.delegate2 = self;
                    
                    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
                    for (int i = 0; i < _sellOrderList.orderCosts.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _sellOrderList.orderCosts[i];
                        [array addObject:costs];
                    }
                    
                    for (int i = 0; i < _sellOrderList.orderPresents.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _sellOrderList.orderPresents[i];
                        [array addObject:costs];
                    }
                    topUpSummaryView.dataArray = array;

                    
                    topUpSummaryView.namelabel.text = _sellOrderList.customer.name;
                    topUpSummaryView.waterCardIDLabel.text = _waterCardId;
                    
                    
                    [topUpSummaryView show];
                    
                    
                    
                }else {
                    [self showInfo:msg];
                    NSLog(@"%@",msg);
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    }

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

-(void)totalCompleted {
    
    _button_1.hidden = YES;
    _button_2.hidden = YES;
    [self.delegate takeSellSuccess];
   [self.navigationController popViewControllerAnimated:YES];
    
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
