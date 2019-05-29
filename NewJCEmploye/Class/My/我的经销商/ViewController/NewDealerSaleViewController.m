//
//  NewDealerSaleViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDealerSaleViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "CommoneTextFieldView.h"
#import "MyCustomerViewController.h"
#import "PackageViewController.h"
#import "RepertoryChooseViewController.h"
#import "DataModels.h"
#import "SGActionView.h"
#import "LCNetworkConfig.h"
@interface NewDealerSaleViewController ()<MyCustomerDelegate,PackageDelegate,SelectItemsDelegate>
@property (nonatomic,strong) NewProbationView *nameView; // 姓名
@property (nonatomic,assign) double customerId; //客户ID
@property (nonatomic,strong) NewProbationView *setmealView; //套餐
@property (nonatomic,assign) double packageId; //套餐ID
@property (nonatomic,strong) NewProbationView *equipmentView; //设备
@property (nonatomic,strong) NewProbationView *waterView; //水
@property (nonatomic,strong) NewProbationView *partsView; //配件
@property (nonatomic,strong) NewProbationView *complimentaryView; //赠品
@property (nonatomic,strong) CommoneTextFieldView *receivableView;//应收
@property (nonatomic,strong) CommoneTextFieldView *remakeView;//备注
@property (nonatomic,strong) CommoneTextFieldView *totalView; //总款项
@property (nonatomic,strong) NewProbationView *needView; //是否需要协助
@property (nonatomic,strong) UIButton *submitButton;//提交BUTTON

@property (nonatomic,strong) NSArray *myEquipmentArray;
@property (nonatomic,strong) NSArray *myWaterArray;
@property (nonatomic,strong) NSArray *myPartsArray;
@property (nonatomic,strong) NSArray *myComplimentary;

@property (nonatomic,strong) NSArray *repertoryEquipmentArray;
@property (nonatomic,strong) NSArray *repertoryWaterArray;
@property (nonatomic,strong) NSArray *repertoryPartsArray;
@property (nonatomic,strong) NSArray *repertoryComplimentary;


@property (nonatomic,assign) double totalPrice;   //总计价格
@property (nonatomic,assign) double packagePrice;  //套餐价格
@property (nonatomic,assign) double equipmentPrice; //设备价格
@property (nonatomic,assign) double waterPrice; //水价格
@property (nonatomic,assign) double partsPrice; //配件价格
@property (nonatomic,strong) NSString *needstring;

@end

@implementation NewDealerSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建销售单";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void) addViews {
    
    _nameView = [[NewProbationView alloc]init];
    _nameView.titleLabel.text = @"客户:";
    [self.view addSubview:_nameView];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.height.equalTo(@(44));
    }];
    _nameView.button.tag = 1;
    [_nameView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    if (_isNeedfilling == YES) {
        [_nameView.button setTitle:_sellOrderList.customer.name forState:UIControlStateNormal];
        [_nameView.button setTitleColor:JCColorMidGray forState:UIControlStateNormal];
    }
    
    _setmealView = [[NewProbationView alloc]init];
    _setmealView.titleLabel.text = @"套餐:";
    [self.view addSubview:_setmealView];
    [_setmealView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.nameView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _setmealView.button.tag = 2;
    [_setmealView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _equipmentView = [[NewProbationView alloc]init];
    _equipmentView.titleLabel.text = @"设备:";
    [self.view addSubview:_equipmentView];
    [_equipmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_setmealView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _equipmentView.button.tag = 3;
    [_equipmentView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _waterView = [[NewProbationView alloc]init];
    _waterView.titleLabel.text = @"水:";
    [self.view addSubview:_waterView];
    [_waterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_equipmentView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _waterView.button.tag = 4;
    [_waterView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _partsView = [[NewProbationView alloc]init];
    _partsView.titleLabel.text = @"配件:";
    [self.view addSubview:_partsView];
    [_partsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_waterView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _partsView.button.tag = 5;
    [_partsView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    _complimentaryView = [[NewProbationView alloc]init];
//    _complimentaryView.titleLabel.text = @"赠品";
//    [self.view addSubview:_complimentaryView];
//    [_complimentaryView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(_partsView.mas_bottom).offset(1);
//        make.height.equalTo(@(44));
//    }];
//    _complimentaryView.button.tag = 7;
//    [_complimentaryView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _receivableView = [[CommoneTextFieldView alloc]init];
    _receivableView.titleLabel.text = @"应收款:";
    _receivableView.textField.placeholder = @"请输入订单应收款";
    [self.view addSubview:_receivableView];
    [_receivableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_partsView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    
    //    _totalView = [[CommoneTextFieldView alloc]init];
    //    _totalView.titleLabel.text = @"总计金额:";
    //    _totalView.textField.text = @"200 ￥";
    //    [self.view addSubview:_totalView];
    //    [_totalView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.equalTo(self.view);
    //        make.top.equalTo(_receivableView.mas_bottom).offset(1);
    //        make.height.equalTo(@(44));
    //    }];
    
//    _needView = [[NewProbationView alloc]init];
//    _needView.titleLabel.text = @"是否需要业务员协助:";
//    [self.view addSubview:_needView];
//    [_needView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(_receivableView.mas_bottom).offset(1);
//        make.height.equalTo(@(44));
//    }];
//    _needView.button.tag = 8;
//    [_needView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//
//    [_needView.button mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_needView);
//        make.left.equalTo(_needView.titleLabel.mas_right).offset(10);
//        make.width.equalTo(@(80));
//    }];
    
    _remakeView = [[CommoneTextFieldView alloc]init];
    _remakeView.titleLabel.text = @"备注:";
    _remakeView.textField.placeholder = @"请输入备注";
    [self.view addSubview:_remakeView];
    [_remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_receivableView.mas_bottom).offset(5);
        make.height.equalTo(@(44));
    }];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    _submitButton = button;
    
    UILabel *label = [[UILabel alloc]init];
    label.font = JCFont14;
    label.text = @"完成创建";
    label.textColor = JCColorWithe;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 6;
}

-(void)newSellButtonAction:(UIButton *)button {
    
    if (button.tag == 1) {
        //选择客户
        
        if (_isNeedfilling == YES) {
            MBProgressHUD *hud = [[MBProgressHUD alloc]init];
            [self.view addSubview:hud];
            hud.label.text =@"已经选择了客户";
            hud.mode = MBProgressHUDModeText;
            [hud showAnimated:YES];
            [hud hideAnimated:YES afterDelay:1];
            
        } else {
            MyCustomerViewController *myCustomerVC = [[MyCustomerViewController alloc]init];
            myCustomerVC.fromString = @"newCustomer";
            myCustomerVC.delegate = self;
            [self.navigationController pushViewController:myCustomerVC animated:YES];
        }
        
    }
    
    if (button.tag == 2) {
        //选择套餐
//        PackageViewController *packageVC = [[PackageViewController alloc]init];
//        packageVC.fromString = @"newCustomer";
//        packageVC.delegate = self;
//        [self.navigationController pushViewController:packageVC animated:YES];
        
        [self showInfo:@"暂时不能选择套餐"];

    }
    if (button.tag == 3) {
        //选择设备
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.selfItemString = @"franchiser";
        if (_isNeedOutput == YES) {
            repertoryChooseVC.isSimpleOutbound = YES;
        }else {
            repertoryChooseVC.inputString = @"1";
        }
        repertoryChooseVC.typeString = @"2";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        
    }
    if (button.tag == 4) {
        //选择水
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.selfItemString = @"franchiser";

        if (_isNeedOutput == YES) {
            repertoryChooseVC.isSimpleOutbound = YES;
        }else {
//            repertoryChooseVC.inputString = @"1";
            repertoryChooseVC.isSimpleOutbound = YES;

        }
        
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    if (button.tag == 5) {
        //选择配件
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.selfItemString = @"franchiser";

        if (_isNeedOutput == YES) {
            repertoryChooseVC.isSimpleOutbound = YES;
        }else {
            repertoryChooseVC.inputString = @"1";
        }
        repertoryChooseVC.typeString = @"3";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 8) {
        //是否要业务员协助
        NSArray *array = @[@"需要",@"不需要"];
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"选择" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            [_needView.button setTitle:array[index] forState:UIControlStateNormal];
            if (index == 0) {
            
                _needstring = [JCTokenManager getUID];
            }
            if (index == 1) {
                
            }
        }];
        
    }
    
    if (button.tag == 7) {
        
//        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
//        repertoryChooseVC.selfItemString = @"franchiser";
//
//        if (_isNeedOutput == YES) {
//            repertoryChooseVC.isSimpleOutbound = YES;
//        }else {
//            repertoryChooseVC.inputString = @"1";
//        }
//        repertoryChooseVC.typeString = @"-1";
//        repertoryChooseVC.delegate = self;
//        repertoryChooseVC.warehouseString = _warehouseString;
//        repertoryChooseVC.warehouseId = _warehouseId;
//
//        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        [self showInfo:@"暂时不能选择赠品"];
        
    }
    
    if (button.tag == 6 && _isNeedfilling == NO) {
        
        //确认创建
        _submitButton.userInteractionEnabled = NO;
        _submitButton.backgroundColor = JCColorMidGray;
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        NSString *uid = [JCTokenManager getUserID];
        // 请求参数字典
        JCModel_dealFranchiserOrder2Base *base = [[JCModel_dealFranchiserOrder2Base alloc]init];
        base.command = @"start";
        base.isPre = @"false";
        JCModel_dealFranchiserOrder2FranchiserOrder *order = [[JCModel_dealFranchiserOrder2FranchiserOrder alloc]init];
        order.franchiser = uid;
        order.customerId =_customerId;
        
        base.franchiserOrder = order;
        NSDictionary *params = base.dictionaryRepresentation;
        
        if (_receivableView.textField.text.length == 0) {
            
            [self showInfo:@"请填写应收金额"];
            _submitButton.userInteractionEnabled = YES;
            _submitButton.backgroundColor = JCColorBlue;
            return;
        }
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                
                NSLog(@"%@",msg);
                
                //刷新上个界面
                if ([result isEqualToString:@"success"]) {
                    
                    NSDictionary *dic2 = [dic objectForKey:@"data"];
                    NSString *pbId = [dic2 objectForKey:@"processBusinessId"];
                    
                    NSLog(@"成功%@",pbId);
                    
                    
                    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                    NSString *token = [JCTokenManager getToken];
                    NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                    
                    // 请求参数字典
                    
                    
                    JCModel_dealFranchiserOrder3Base *base = [[JCModel_dealFranchiserOrder3Base alloc]init];
                    
                    base.command = @"next";
                    base.current = @"f_sale_form";
                
                    
                    if (_packageId == 0) {
                        base.sellGroupId = nil;
                    }else {
                        base.sellGroupId = [NSString stringWithFormat:@"%d",(int)_packageId];
                    }
    
            
                    
                    
                    base.storeHourse = _warehouseId;
                    
                    JCModel_dealFranchiserOrder3FranchiserOrder *order = [[JCModel_dealFranchiserOrder3FranchiserOrder alloc]init];
                    order.franchiserOrderIdentifier = pbId;
                    order.getamount = _receivableView.textField.text;
                    order.comments = _remakeView.textField.text;
//                    NSString *str = [JCTokenManager getUserID];
                    order.guide = _needstring;
             
                    
                    NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:100];
                    
                    
                    
                  
                    
                    //循环将3种仓库的物品 添加到一起
                    for (int i = 0; i < _repertoryEquipmentArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _repertoryEquipmentArray[i];
                        [repertoryItemArray  addObject:costs];
                    }

                    for (int i = 0; i < _repertoryPartsArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _repertoryPartsArray[i];
                        [repertoryItemArray  addObject:costs];
                    }
                    for (int i = 0; i < _repertoryWaterArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _repertoryWaterArray[i];
                        [repertoryItemArray  addObject:costs];
                    }
                    
                    
                    //给仓库需要出库的数组传值
                    
                   

//                    //判断是否出库 如果出库 isOutStore 是 YEs 并且要填出库仓库ID
//                    if (order.orderCosts.count == 0) {
//                        base.isOutStore = NO;
//                    }else {
//                        base.isOutStore = YES;
//                        base.storeHourse = _warehouseId;    //待传w仓库ID
//                    }
                    
                    NSMutableArray *myItemsArray = [NSMutableArray arrayWithCapacity:100];
                    
                    //循环将3种仓库的物品 添加到一起
                    for (int i = 0; i < _myEquipmentArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myEquipmentArray[i];
                        [myItemsArray  addObject:costs];
                    }
                    for (int i = 0; i < _myPartsArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myPartsArray[i];
                        [myItemsArray  addObject:costs];
                    }
                    for (int i = 0; i < _repertoryWaterArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _repertoryWaterArray[i];
                        [myItemsArray  addObject:costs];
                    }
                    
                    // 给不需要仓库出库的数组传值
                    if (_isNeedOutput == YES) {
                        order.orderCosts = repertoryItemArray;
                        
                    }else {
                        
                        order.orderCosts = myItemsArray;

                    }
                    
                    
                    
                    if (_repertoryPartsArray.count ==0 && _repertoryEquipmentArray.count == 0 ) {
                        
                        base.needOutStore = @"false";
                        
                    }else {
                        base.needOutStore = @"true";
                    }
                    
                    
                    NSMutableArray *MyComplimentaryMutableArray = [NSMutableArray arrayWithCapacity:100];
                    
                    for (int i = 0; i < _myComplimentary.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myComplimentary[i];
                        [MyComplimentaryMutableArray  addObject:costs];
                    }
                    
                    
                    NSMutableArray *repertoryComlimentaryMutableArray = [NSMutableArray arrayWithCapacity:100];
                    
                    for (int i = 0; i< _repertoryComplimentary.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _repertoryComplimentary[i];
                        [repertoryComlimentaryMutableArray  addObject:costs];
                    }
                    
                    if (_isNeedOutput == YES) {
                        order.orderPresents = repertoryComlimentaryMutableArray;

                    }else {
                        order.orderPresents = MyComplimentaryMutableArray;

                    }
                    
                    
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
                            
                            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                            NSString *result = [dic objectForKey:@"result"];
                            NSString *msg = [dic objectForKey:@"msg"];

                            if ([result  isEqual: @"success"] ) {
                                
                                [self.delegate newFSaleSuccess];
                                [self.navigationController popViewControllerAnimated:YES];
                            }else {
                                [self showInfo:msg];
                            }
                            
                         

                            NSLog(@"成功%@",msg);
                        } else {
                            [self showInfo:msg];
                        }
                        
                        _submitButton.userInteractionEnabled = YES;
                        _submitButton.backgroundColor = JCColorBlue;
                        
                        
                    }];
                    
                    [task resume];
            
                }else {
                    
                }
                
                
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
     if (button.tag == 6 && _isNeedfilling == YES) {
         //需要补充完整的订单
         
         //确认创建
         _submitButton.userInteractionEnabled = NO;
         _submitButton.backgroundColor = JCColorMidGray;
         
         LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
         NSString *token = [JCTokenManager getToken];
         NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
         NSString *uid = [JCTokenManager getUserID];
         // 请求参数字典
         JCModel_butianjingxiaoshangxiaoshoudanBase *base = [[JCModel_butianjingxiaoshangxiaoshoudanBase alloc]init];
         base.command = @"start";
         base.isPre = @"false";
         JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder *order = [[JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder alloc]init];
         order.franchiser = uid;
         order.customerId =_sellOrderList.customer.customerIdentifier;

         base.franchiserOrder = order;
         NSDictionary *params = base.dictionaryRepresentation;
         
         NSLog(@"%@",params);

         if (_receivableView.textField.text.length == 0) {
             
             [self showInfo:@"请填写应收金额"];
             _submitButton.userInteractionEnabled = YES;
             _submitButton.backgroundColor = JCColorBlue;
             return;
         }
         AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
         NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
         request.timeoutInterval = 10.f;
         [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
         [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
         
         NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
             if (!error) {
                 
                 NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                 NSString *result = [dic objectForKey:@"result"];
                 NSString *msg = [dic objectForKey:@"msg"];
                 
                 NSLog(@"%@",msg);
                 
             
                 if ([result isEqualToString:@"success"]) {
                     
                     NSDictionary *dic2 = [dic objectForKey:@"data"];
                     NSString *pbId = [dic2 objectForKey:@"processBusinessId"];
                     
                     NSLog(@"成功%@",pbId);
                     
                     
                     LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                     NSString *token = [JCTokenManager getToken];
                     NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                     
                     // 请求参数字典
                     
                     
                     JCModel_dealFranchiserOrder3Base *base = [[JCModel_dealFranchiserOrder3Base alloc]init];
                     
                     base.command = @"next";
                     base.current = @"f_sale_form";
                     
                     
                     if (_packageId == 0) {
                         base.sellGroupId = nil;
                     }else {
                         base.sellGroupId = [NSString stringWithFormat:@"%d",(int)_packageId];
                     }
                     if (_isNeedOutput == YES) {
                         base.needOutStore = @"true";
                         
                     }else {
                         
                         base.needOutStore = @"false";
                         
                     }
                     
                     if (_repertoryPartsArray.count ==0 && _repertoryEquipmentArray.count == 0 && _repertoryComplimentary.count == 0 && _repertoryWaterArray.count != 0) {
                         
                         base.needOutStore = @"false";
                         
                     }
                     
                     base.storeHourse = _warehouseId;
                     
                     JCModel_dealFranchiserOrder3FranchiserOrder *order = [[JCModel_dealFranchiserOrder3FranchiserOrder alloc]init];
                     order.franchiserOrderIdentifier = pbId;
                     order.getamount = _receivableView.textField.text;
                     order.comments = _remakeView.textField.text;
                     //                    NSString *str = [JCTokenManager getUserID];
                     order.guide = _needstring;
                     
                     
                     NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:100];
                     
                     //循环将3种仓库的物品 添加到一起
                     for (int i = 0; i < _repertoryEquipmentArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _repertoryEquipmentArray[i];
                         [repertoryItemArray  addObject:costs];
                     }
                     for (int i = 0; i < _repertoryWaterArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _repertoryWaterArray[i];
                         [repertoryItemArray  addObject:costs];
                     }
                     for (int i = 0; i < _repertoryPartsArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _repertoryPartsArray[i];
                         [repertoryItemArray  addObject:costs];
                     }
                     
                     
                     //给仓库需要出库的数组传值
                     
                     
                     
                     //                    //判断是否出库 如果出库 isOutStore 是 YEs 并且要填出库仓库ID
                     //                    if (order.orderCosts.count == 0) {
                     //                        base.isOutStore = NO;
                     //                    }else {
                     //                        base.isOutStore = YES;
                     //                        base.storeHourse = _warehouseId;    //待传仓库ID
                     //                    }
                     
                     NSMutableArray *myItemsArray = [NSMutableArray arrayWithCapacity:100];
                     
                     //循环将3种仓库的物品 添加到一起
                     for (int i = 0; i < _myEquipmentArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _myEquipmentArray[i];
                         [myItemsArray  addObject:costs];
                     }
                     for (int i = 0; i < _myWaterArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _myWaterArray[i];
                         [myItemsArray  addObject:costs];
                     }
                     for (int i = 0; i < _myPartsArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _myPartsArray[i];
                         [myItemsArray  addObject:costs];
                     }
                     for (int i = 0; i < _repertoryWaterArray.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _repertoryWaterArray[i];
                         [myItemsArray  addObject:costs];
                     }
                     
                     // 给不需要仓库出库的数组传值
                     if (_isNeedOutput == YES) {
                         order.orderCosts = repertoryItemArray;
                         
                     }else {
                         
                         order.orderCosts = myItemsArray;
                         
                     }
                     
                     
                     
                     NSMutableArray *MyComplimentaryMutableArray = [NSMutableArray arrayWithCapacity:100];
                     
                     for (int i = 0; i < _myComplimentary.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _myComplimentary[i];
                         [MyComplimentaryMutableArray  addObject:costs];
                     }
                     
                     
                     NSMutableArray *repertoryComlimentaryMutableArray = [NSMutableArray arrayWithCapacity:100];
                     
                     for (int i = 0; i< _repertoryComplimentary.count; i ++) {
                         JCModel_NewProbationOrderJsonCosts *costs = _repertoryComplimentary[i];
                         [repertoryComlimentaryMutableArray  addObject:costs];
                     }
                     
                     if (_isNeedOutput == YES) {
                         order.orderPresents = repertoryComlimentaryMutableArray;
                         
                     }else {
                         order.orderPresents = MyComplimentaryMutableArray;
                         
                     }
                     
                     
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
                             
                             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                             NSString *result = [dic objectForKey:@"result"];
                             NSString *msg = [dic objectForKey:@"msg"];
                             
                             if ([result  isEqual: @"success"] ) {
                                 
                                  [self.delegate newFSaleSuccess];
                                 [self.navigationController popViewControllerAnimated:YES];
                             }else {
                                   [self showInfo:msg];
                             }
                             
                             
                             NSLog(@"成功%@",msg);
                         } else {
                             [self showInfo:msg];
                         }
                         
                         _submitButton.userInteractionEnabled = YES;
                         _submitButton.backgroundColor = JCColorBlue;
                         
                         
                     }];
                     
                     [task resume];
                     
                 }else {
                     
                     
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
    
    [_nameView.button setTitle:custmerData.name forState:UIControlStateNormal];
    _customerId = custmerData.dataIdentifier;
}

//选择套餐的返回
-(void)selectPackageReturn:(JCModel_PackageData *)packageData {
    
    [_setmealView.button setTitle:packageData.name forState:UIControlStateNormal];
    
    _packageId = packageData.dataIdentifier;
    
    _packagePrice = packageData.price;
    
    _totalPrice = _packagePrice + _waterPrice  + _equipmentPrice + _partsPrice;
}

//选择我的身上的东西返回
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
    
    NSLog(@"%@",myItemArray);
    
    
    if ([typeString  isEqual: @"2"]) {
        //设备
        
        NSString *str = @"";
        
        if (myItemArray.count == 0) {
            _myEquipmentArray = @[];
            _equipmentView.contentLabel.hidden = YES;
            [_equipmentView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _myEquipmentArray = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCostsSelf *costsSelf = myItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costsSelf.name,(int)costsSelf.num];
            _equipmentView.contentLabel.text = str;
            _equipmentView.contentLabel.hidden = NO;
            [_equipmentView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"1"]) {
        //水
        NSString *str = @"";
        
        if (myItemArray.count == 0) {
            _myWaterArray = @[];
            _waterView.contentLabel.hidden = YES;
            [_waterView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _myWaterArray = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCostsSelf *costsSelf = myItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costsSelf.name,(int)costsSelf.num];
            _waterView.contentLabel.text = str;
            _waterView.contentLabel.hidden = NO;
            [_waterView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"3"]) {
        //零件
        NSString *str = @"";
        
        if (myItemArray.count == 0) {
            _myPartsArray = @[];
            _partsView.contentLabel.hidden = YES;
            [_partsView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _myPartsArray = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCostsSelf *costsSelf = myItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costsSelf.name,(int)costsSelf.num];
            _partsView.contentLabel.text = str;
            _partsView.contentLabel.hidden = NO;
            [_partsView.button setTitle:@"" forState:UIControlStateNormal];
        }
        
    }
    
    //赠品
    if ([typeString isEqualToString:@"-1"] || [typeString isEqualToString:@""]) {
        
        NSString *str = @"";
        
        if (myItemArray.count == 0) {
            _myComplimentary = @[];
            _complimentaryView.contentLabel.hidden = YES;
            [_complimentaryView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _myComplimentary = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCostsSelf *costsSelf = myItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costsSelf.name,(int)costsSelf.num];
            
            
            
            _complimentaryView.contentLabel.text = str;
            _complimentaryView.contentLabel.hidden = NO;
            [_complimentaryView.button setTitle:@"" forState:UIControlStateNormal];
            
        }
        
        
        
    }
    NSLog( @"%@",myItemArray);
}

//选择仓库
-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    
    NSLog(@"%@",repertoryItemArray);
    
    
    if ([typeString  isEqual: @"2"]) {
        //设备
        
        NSString *str = _equipmentView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        
        if (repertoryItemArray.count == 0 && _myEquipmentArray.count == 0) {
            _repertoryEquipmentArray = @[];
            _equipmentView.contentLabel.hidden = YES;
            [_equipmentView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryEquipmentArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _equipmentView.contentLabel.text = str;
            _equipmentView.contentLabel.hidden = NO;
            [_equipmentView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"1"]) {
        //水
        
        NSString *str = _waterView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myWaterArray.count == 0) {
            _repertoryWaterArray = @[];
            _waterView.contentLabel.hidden = YES;
            [_waterView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryWaterArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _waterView.contentLabel.text = str;
            _waterView.contentLabel.hidden = NO;
            [_waterView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"3"]) {
        //配件
        
        NSString *str = _partsView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myPartsArray.count == 0) {
            _repertoryPartsArray = @[];
            _partsView.contentLabel.hidden = YES;
            [_partsView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryPartsArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _partsView.contentLabel.text = str;
            _partsView.contentLabel.hidden = NO;
            [_partsView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    
    
    //赠品
    if ([typeString isEqualToString:@"-1"] || [typeString isEqualToString:@""]) {
        
        NSString *str = _complimentaryView.contentLabel.text;
        
        if (str == NULL) {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myComplimentary.count == 0) {
            _repertoryComplimentary = @[];
            _complimentaryView.contentLabel.hidden = YES;
            [_complimentaryView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryComplimentary = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ ) {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _complimentaryView.contentLabel.text = str;
            _complimentaryView.contentLabel.hidden = NO;
            [_complimentaryView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
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
