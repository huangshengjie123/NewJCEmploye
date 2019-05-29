//
//  NewReturnGoodsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/28.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewReturnGoodsViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "Request_readMyWarehouse.h"
#import "DataModels.h"
#import "SGActionView.h"
#import "ItemsTableViewCell.h"
#import "RepertoryChooseViewController.h"
#import "JCRequest_GetItemPrice.h"
#import "LCNetworkConfig.h"
@interface NewReturnGoodsViewController ()<UITableViewDelegate,UITableViewDataSource,SelectItemsDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *warehouseLabel;
@property (nonatomic,strong) UILabel *itemLabel;
@property (nonatomic,strong) UILabel *allNumLabel;
@property (nonatomic,strong) UITextField *numTextField;
@property (nonatomic,strong) NSArray *warehouseArray;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,strong) NSArray *repertoryComplimentary;
@property (nonatomic,strong) NSMutableArray *priceArray;

@property (nonatomic,strong) UITableView *tableView2; // 订单中的物品
@end

@implementation NewReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新建退货单";
    self.view.backgroundColor = JCBackgroundColor;
    _priceArray = [NSMutableArray arrayWithCapacity:40];
    [self readMywarehouse];
    [self addViews];
}
-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    self.tableView.tag = 1;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.height.equalTo(@(180));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.tableView2 = [[UITableView alloc]init];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.backgroundColor = JCBackgroundColor;
    self.tableView2.tag =2;
    [self.view addSubview:self.tableView2];
    [self.tableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
        make.top.equalTo(_tableView2.mas_bottom).offset(20);
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
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return 4;
    }else {
        if (section == 0) {
            return _sellOrderList.orderCosts.count;
        }else {
            return  _sellOrderList.orderPresents.count;
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 1) {
        return 1;
    }else {
        
        if (_sellOrderList.orderPresents.count == 0) {
            return 1;
        }else {
            
            return 2;
        }

    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    
    if (tableView.tag == 1) {
        static NSString *identifier = @"NewProbationCustomTableViewCell";
        // 1.缓存中取
        NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"入库仓库:";
            cell.button.hidden = NO;
            cell.contentTextField.hidden = YES;
            cell.button.tag = 1;
            [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            _warehouseLabel = cell.buttonLabel;
            //
            //        _transferAccountsLabel.text = _data.username;
            
        }
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"物品:";
            cell.button.hidden = NO;
            cell.contentTextField.hidden = YES;
            cell.button.tag = 2;
            
            [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            _itemLabel = cell.buttonLabel;
            
            
        }
        
        if (indexPath.row == 2) {
            
            cell.titleLabel.text = @"物品总额:";
            cell.button.hidden = NO;
            cell.contentTextField.hidden = YES;
            cell.button.tag = 3;
            [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            cell.contentLabel.text = @"0";
            cell.contentLabel.hidden = NO;
            _allNumLabel = cell.contentLabel;
            cell.button.hidden = YES;
            
        }
        
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"退款金额:";
            cell.button.hidden = YES;
            cell.contentTextField.hidden = NO;
            cell.contentTextField.placeholder = @"请填写退款金额";
            _numTextField = cell.contentTextField;
            
            [cell.contentTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.titleLabel);
            }];
            
        }
   
        return cell;
    }else {
        
        static NSString *identifier = @"ItemsTableViewCell1";
        // 1.缓存中取
        ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
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
        
        return cell;
        
    }
    
    

   
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (tableView.tag == 2) {
        UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
        view.backgroundColor = JCColorGray;
        
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
    }else {
        return 0;
    }
}


-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 0) {
        // 确定订单操作
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@refundment/dealRefundmentOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_newReturnGoods2Base *base = [[JCModel_newReturnGoods2Base alloc]init];
        
        base.command = @"next";
        base.current =@"refundment_confirm";
        JCModel_newReturnGoods2Refundment *refundment = [[JCModel_newReturnGoods2Refundment alloc]init];
        refundment.refundmentIdentifier = _newi2d;
        refundment.refundment = _numTextField.text.doubleValue;
        refundment.storeHouse = _warehouseId;
        
        refundment.refundmentCosts = _repertoryComplimentary;
        
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
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                NSLog(@"%@",dic);
                if ([result isEqualToString:@"success"]) {
                    
                    [self showInfo:@"新建成功"];
                    
                    
                    
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
    
    
    if (button.tag == 1) {
        //选择入库仓库
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i<_warehouseArray.count; i++) {
            JCModel_MyWarehouseData *data = _warehouseArray[i];
            [array addObject:data.name];
        }
        
        [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _warehouseLabel.text = array[index];
            JCModel_MyWarehouseData *data =   _warehouseArray[index];
            
            _warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
            
        }];

    }
    
    if (button.tag == 2) {
        //选择物品
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"-1";
        repertoryChooseVC.delegate = self;
//        repertoryChooseVC.warehouseString = _warehouseString;
//        repertoryChooseVC.warehouseId = _warehouseId;
        repertoryChooseVC.isSimpleOutbound = YES;

        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        
        
    }
    
    
}
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    
    _repertoryComplimentary= @[];
    [_priceArray removeAllObjects];
    
    for (int i = 0; i < repertoryItemArray.count; i ++) {
        
        JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
        
        
        [self readItemPrice:[NSString stringWithFormat:@"%d",(int)costs.item] and:(int)costs.num];
        
    }
    
    NSString *str = _itemLabel.text;
    
    if (str == NULL || [str  isEqual: @"请选择"]) {
        str = @"";
    }
    str = @"";
    if (repertoryItemArray.count == 0 ) {
        _repertoryComplimentary = @[];
        
        _itemLabel.text = @"请选择";
        
    }else {
        _repertoryComplimentary = repertoryItemArray;
    }
    
    for (int i = 0; i < repertoryItemArray.count; i ++ ) {
        JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
        
        str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
        _itemLabel.text = str;
//        [_tableView reloadData];
    }
    
    
    
}

-(void)readItemPrice:(NSString *)itemID  and:(int)num {
    
    JCRequest_GetItemPrice *request = [[JCRequest_GetItemPrice alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":itemID,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_GetItemPrice *request) {
        //
        
        NSDictionary * dic = request.responseJSONObject;
        JCModel_GetItemPriceBase *base = [[JCModel_GetItemPriceBase alloc]initWithDictionary:dic];
        
        int  price = (int)base.data.price * num;
        
        [_priceArray addObject:[NSString stringWithFormat:@"%d",price]];
        
        NSString *msg = [dic objectForKey:@"msg"];
        NSLog(@"%@",msg);
        
        if (_priceArray.count == _repertoryComplimentary.count) {
            
          
            
            int a = 0;
            for (NSString *b in _priceArray) {
                a = [b intValue]+a;
                
            }
            
            _allNumLabel.text = [NSString stringWithFormat:@"%d",a ];
            
      
        }
        
        
    } failure:^(__kindof JCRequest_GetItemPrice *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
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
