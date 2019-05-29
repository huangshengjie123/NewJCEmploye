//
//  NewStockViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewStockViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "CommoneTextFieldView.h"
#import "JCRequest_searchPurchasers.h"
#import "DataModels.h"
#import "SGActionView.h"
#import "LCNetworkConfig.h"
#import "RepertoryChooseViewController.h"
@interface NewStockViewController ()<SelectItemsDelegate>
@property (nonatomic,strong) NewProbationView *nameView;
@property (nonatomic,strong) NSString *nameIDstring;
@property (nonatomic,strong) NewProbationView *typeView;
@property (nonatomic,strong) NSString *typeString;
@property (nonatomic,strong) NewProbationView *itemView;
@property (nonatomic,strong) CommoneTextFieldView *remakeView;//备注
@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UIButton *button; //确定按钮

@end

@implementation NewStockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = JCBackgroundColor;
    if ([_reWritetypeString  isEqual: @"v_rewrite"]) {
        [self rewriteView];
    }else {
          [self addViews];
    }
    
  
}

-(void)rewriteView {
    
    _itemView = [[NewProbationView alloc]init];
    _itemView.titleLabel.text = @"进货物品:";
    [self.view addSubview:_itemView];
    [_itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64 + 5);
        make.height.equalTo(@(44));
    }];
    _itemView.button.tag = 3;
    [_itemView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _remakeView = [[CommoneTextFieldView alloc]init];
    _remakeView.titleLabel.text = @"备注:";
    _remakeView.textField.placeholder = @"请输入备注";
    [self.view addSubview:_remakeView];
    [_remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_itemView.mas_bottom).offset(5);
        make.height.equalTo(@(44));
    }];
    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"确定";
    label.textColor = JCColorWithe;
    label.font = JCFont15;
    [button1 addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    
    [button1 addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 5;
    _button = button1;
    
}

-(void)addViews {
    
    _nameView = [[NewProbationView alloc]init];
    _nameView.titleLabel.text = @"发起单位:";
    [self.view addSubview:_nameView];
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.height.equalTo(@(44));
    }];
    _nameView.button.tag = 1;
    [_nameView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    if (_isNeedfilling == YES) {
//        [_nameView.button setTitle:_sellOrderList.customer.name forState:UIControlStateNormal];
//        [_nameView.button setTitleColor:JCColorMidGray forState:UIControlStateNormal];
//    }
    
    _typeView = [[NewProbationView alloc]init];
    _typeView.titleLabel.text = @"进货类别:";
    [self.view addSubview:_typeView];
    [_typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.nameView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _typeView.button.tag = 2;
    [_typeView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _itemView = [[NewProbationView alloc]init];
    _itemView.titleLabel.text = @"进货物品:";
    [self.view addSubview:_itemView];
    [_itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_typeView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _itemView.button.tag = 3;
    [_itemView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _remakeView = [[CommoneTextFieldView alloc]init];
    _remakeView.titleLabel.text = @"备注:";
    _remakeView.textField.placeholder = @"请输入备注";
    [self.view addSubview:_remakeView];
    [_remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_itemView.mas_bottom).offset(5);
        make.height.equalTo(@(44));
    }];
    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
   
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"确定";
    label.textColor = JCColorWithe;
    label.font = JCFont15;
    [button1 addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    
    [button1 addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 4;
     _button = button1;
}

-(void)newSellButtonAction:(UIButton *)button {
    if (button.tag == 1) {
        
        JCRequest_searchPurchasers *request = [[JCRequest_searchPurchasers alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userIDString = [JCTokenManager getUserID];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"applicant":userIDString,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"type":@"org",
//                                    @"leader":userIDString,//选填
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchasers *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_PurchasersBase *base = [[JCModel_PurchasersBase alloc]initWithDictionary:dic];
            JCModel_PurchasersData *data = base.data;
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
            
            if (data.list.count >0) {
                for (int i = 0; i <data.list.count; i ++) {
                    
                    JCModel_PurchasersList *listdata =data.list[i];
                    
                    [array addObject:listdata.name];
                    
                }
            }
            
            
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择发起单位" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                
                 [_nameView.button setTitle:array[index] forState:UIControlStateNormal];
                
                JCModel_PurchasersList *listdata =data.list[index];
                
                _nameIDstring = listdata.listIdentifier;

                
                
            }];
            
            
            NSLog(@">>>>>>>%@",dic);
            
        } failure:^(__kindof JCRequest_searchPurchasers *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];

    }
    
    if (button.tag == 2) {
        
        NSArray *array = @[@"配送进货",@"虚拟充值"];
        
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"选择进货单位" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            [_typeView.button setTitle:array[index] forState:UIControlStateNormal];

            
            if (index == 0) {
                
                self.typeString = @"send";

            }else {
                
                self.typeString = @"recharge";
                
            }
            
        }];
        
        
    }
    
     if (button.tag == 3) {

         RepertoryChooseViewController *vc = [[RepertoryChooseViewController alloc]init];
         vc.typeString = @"-1";
          vc.isSimpleOutbound = YES;
         vc.delegate = self;
         [self.navigationController pushViewController:vc animated:YES];
         
         
     }
    
     if (button.tag == 4) {
         
         _button.backgroundColor = JCColorMidGray;
         _button.userInteractionEnabled = NO;
         
         
         if (_typeString.length == 0) {
             _button.backgroundColor = JCColorBlue;
             _button.userInteractionEnabled = YES;
             [self showInfo:@"请选择进货类型"];
             return;
         }
         
         if (_nameIDstring.length == 0) {
             [self showInfo:@"请选择进货单位"];
             _button.backgroundColor = JCColorBlue;
             _button.userInteractionEnabled = YES;
             return;
         }
         
         if (_dataArray.count == 0) {
             [self showInfo:@"请选择进货物品"];
             _button.backgroundColor = JCColorBlue;
             _button.userInteractionEnabled = YES;
             return;
         }
         
         LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
         NSString *token = [JCTokenManager getToken];
         NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];

         // 请求参数字典
         JCModel_newPurchaserOrderBase *base = [[JCModel_newPurchaserOrderBase alloc]init];
         base.command =@"start";
         JCModel_newPurchaserOrderPurchaserOrder *order = [[JCModel_newPurchaserOrderPurchaserOrder alloc]init];
         order.type = _typeString;
         order.comments = _remakeView.textField.text;
         order.purchaser = _nameIDstring;
         order.purchaserOrderCosts = _dataArray;
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
               

                     [self.navigationController popViewControllerAnimated:YES];


                 }else {
                     [self showInfo:msg];

                 }
             } else {
                 NSLog(@"请求失败error=%@", error);
             }
         }];

         [task resume];

     }
    
    if (button.tag == 5) {
        //重填 请求
        _button.backgroundColor = JCColorMidGray;
        _button.userInteractionEnabled = NO;
        
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealPurchaserOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_reWritePurchaserOrderBase *base = [[JCModel_reWritePurchaserOrderBase alloc]init];
        base.command =@"next";
        base.current = @"purchase_v_rewrite";
        JCModel_reWritePurchaserOrderPurchaserOrder *order = [[JCModel_reWritePurchaserOrderPurchaserOrder alloc]init];
        order.purchaserOrderIdentifier = _orderIdSring;
     
        order.purchaserOrderCosts = _dataArray;
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
                    
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                }else {
                    [self showInfo:msg];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    _dataArray = repertoryItemArray;
    NSLog(@">>>>>>>>>>%@",repertoryItemArray);
    
    NSString *str = @"";
    
    for (int i = 0; i <_dataArray.count; i++) {
        JCModel_NewProbationOrderJsonCosts *jsonCost = _dataArray[i];
        
        str = [NSString stringWithFormat:@"%@ %@ x %d",str,jsonCost.name,(int)jsonCost.num];
    }
    
    _itemView.contentLabel.text = str;
    _itemView.contentLabel.hidden = NO;
    [_itemView.button setTitle:@"" forState:UIControlStateNormal];
    _itemView.button.backgroundColor = [UIColor clearColor];
    
    if (repertoryItemArray.count == 0) {
        
        [_itemView.button setTitle:@"请选择" forState:UIControlStateNormal];
        _itemView.contentLabel.hidden = YES;

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
