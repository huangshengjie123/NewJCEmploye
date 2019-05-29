//
//  SalesmaNewSaleOrderViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SalesmaNewSaleOrderViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "CommoneTextFieldView.h"
#import "DataModels.h"
#import "MyCustomerViewController.h"
#import "PackageViewController.h"
#import "RepertoryChooseViewController.h"
#import "LCNetworkConfig.h"
#import "MBProgressHUD.h"
#import "NSObject+XRModel.h"
#import "QHHead.h"
#import "YMSOpenNotifyDownView.h"
#import "JCRequest_GetItemPrice.h"
@interface SalesmaNewSaleOrderViewController ()<MyCustomerDelegate,PackageDelegate,SelectItemsDelegate,CardDownAnimationViewDelegate,totalDelegate>

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
@property (nonatomic,strong) NSString *packgeName;//套餐名字
@property (nonatomic,assign) double equipmentPrice; //设备价格
@property (nonatomic,assign) double waterPrice; //水价格
@property (nonatomic,assign) double partsPrice; //配件价格

@property (nonatomic,assign) int price;
@property (nonatomic,strong) NSMutableArray *priceArray;
@property (nonatomic,strong) NSMutableArray *allArray;
@end

@implementation SalesmaNewSaleOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"新建经销商支持销售单";
    
    _priceArray = [NSMutableArray arrayWithCapacity:20];
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
    
    if (_listData.customerPrepare.name == NULL) {
        [_nameView.button setTitle:_listData.customer.name forState:UIControlStateNormal];
    }else {
        [_nameView.button setTitle:_listData.customerPrepare.name forState:UIControlStateNormal];

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
    
    _complimentaryView = [[NewProbationView alloc]init];
    _complimentaryView.titleLabel.text = @"赠品";
    [self.view addSubview:_complimentaryView];
    [_complimentaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_partsView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    _complimentaryView.button.tag = 7;
    [_complimentaryView.button addTarget:self action:@selector(newSellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _receivableView = [[CommoneTextFieldView alloc]init];
    _receivableView.titleLabel.text = @"应收款:";
    _receivableView.textField.placeholder = @"请输入订单应收款";
    [self.view addSubview:_receivableView];
    [_receivableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_complimentaryView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    
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
    //    button.tag = 6;
    button.tag = 10;
    
}

//创建按钮
-(void)newSellButtonAction:(UIButton *)button {
    
    
    
    if (button.tag == 1) {
        //选择客户
        
    
        
    }
    
    if (button.tag == 2) {
        //选择套餐
        PackageViewController *packageVC = [[PackageViewController alloc]init];
        packageVC.fromString = @"newCustomer";
        packageVC.delegate = self;
        [self.navigationController pushViewController:packageVC animated:YES];
    }
    if (button.tag == 3) {
        //选择设备
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"2";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.isSimpleOutbound = YES;

        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        
    }
    if (button.tag == 4) {
        //选择水
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.isSimpleOutbound = YES;
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;

        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    if (button.tag == 5) {
        //选择配件
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"3";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.isSimpleOutbound = YES;

        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;

        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 10) {
        //先去确认商品 再继续完成创建
        
        _allArray = [NSMutableArray arrayWithCapacity:100];
        
        [_allArray removeAllObjects];
        [_priceArray removeAllObjects];
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
        for (int i = 0; i < _repertoryComplimentary.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = _repertoryComplimentary[i];
            [repertoryItemArray  addObject:costs];
        }
        
        
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
        for (int i = 0; i < _myComplimentary.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = _myComplimentary[i];
            [myItemsArray  addObject:costs];
        }
        
        
        for (int i = 0; i < myItemsArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = myItemsArray[i];
            [_allArray  addObject:costs];
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            [_allArray  addObject:costs];
        }
        
        
        if (_allArray.count > 0) {
            
            for (int i = 0; i < _allArray.count; i ++) {
                JCModel_NewProbationOrderJsonCosts *costs = _allArray[i];
                
                
                [self readItemPrice:[NSString stringWithFormat:@"%d",(int)costs.item] and:(int)costs.num];
                
            }
            
            
            
        }else {
            [self showInfo:@"请选择商品"];
        }
        
        
        
    }
    
    
    if (button.tag == 7) {
        
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"-1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.isSimpleOutbound = YES;

        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        
    }
    
    
}

//选择我的身上的东西返回
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
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
        NSLog(@"成功");
        NSDictionary * dic = request.responseJSONObject;
        JCModel_GetItemPriceBase *base = [[JCModel_GetItemPriceBase alloc]initWithDictionary:dic];
        
        int  price = (int)base.data.price * num;
        
        [_priceArray addObject:[NSString stringWithFormat:@"%d",price]];
        
        
        if (_priceArray.count == _allArray.count) {
            
            YMSOpenNotifyDownView *openNotifyDownView = [[YMSOpenNotifyDownView alloc] init];
            openNotifyDownView.delegate = self;
            openNotifyDownView.delegate2 = self;
            openNotifyDownView.dataArray = _allArray;
            
            int a = 0;
            for (NSString *b in _priceArray) {
                a = [b intValue]+a;
                
            }
            
            openNotifyDownView.label2.text = [NSString stringWithFormat:@"%d",a + (int)_packagePrice];
            if (_packgeName.length == 0) {
                openNotifyDownView.packgeLabel.text = @"未选择套餐";
                
            }else {
                openNotifyDownView.packgeLabel.text = _packgeName;
                
            }
            [openNotifyDownView show];
        }
        
        
    } failure:^(__kindof JCRequest_GetItemPrice *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}
//选择套餐的返回
-(void)selectPackageReturn:(JCModel_PackageData *)packageData {
    
    [_setmealView.button setTitle:packageData.name forState:UIControlStateNormal];
    
    _packageId = packageData.dataIdentifier;
    
    _packagePrice = packageData.price;
    _packgeName = packageData.name;
    
    _totalPrice = _packagePrice + _waterPrice  + _equipmentPrice + _partsPrice;
}

-(void)totalCompleted {
    
   
    
  
        //确认创建
        _submitButton.userInteractionEnabled = NO;
        _submitButton.backgroundColor = JCColorMidGray;
    
        if (_receivableView.textField.text.length == 0) {
            
            [self showInfo:@"请填写应收金额"];
            _submitButton.userInteractionEnabled = YES;
            _submitButton.backgroundColor = JCColorBlue;
            return;
        }
    
                    
                    
                    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                    NSString *token = [JCTokenManager getToken];
                    NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                    
                    // 请求参数字典
                    
                    JCModel_supportCreateOrderBase *base = [[JCModel_supportCreateOrderBase alloc]init];
                    base.command = @"next";
                    base.current = @"fgs_create_sale";
                    base.storeHourse = _warehouseId;
                    JCModel_supportCreateOrderFranchiserOrder *order = [[JCModel_supportCreateOrderFranchiserOrder alloc]init];
                    order.franchiserOrderIdentifier = _listData.listIdentifier;
                    order.getamount = _receivableView.textField.text.doubleValue;
                    
               
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
                    
                    for (int i = 0; i < _myEquipmentArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myEquipmentArray[i];
                        [repertoryItemArray  addObject:costs];
                    }
                    for (int i = 0; i < _myWaterArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myWaterArray[i];
                        [repertoryItemArray  addObject:costs];
                    }
                    for (int i = 0; i < _myPartsArray.count; i ++) {
                        JCModel_NewProbationOrderJsonCosts *costs = _myPartsArray[i];
                        [repertoryItemArray  addObject:costs];
                    }
                    
                    // 给不需要仓库出库的数组传值
                    order.orderCosts = repertoryItemArray;
    
    
                    NSMutableArray *presentsItemArray = [NSMutableArray arrayWithCapacity:100];

    for (int i = 0; i < _repertoryComplimentary.count; i ++) {
        JCModel_NewProbationOrderJsonCosts *costs = _repertoryComplimentary[i];
        [presentsItemArray  addObject:costs];
    }
    
    for (int i = 0; i < _myComplimentary.count; i ++) {
        JCModel_NewProbationOrderJsonCosts *costs = _myComplimentary[i];
        [presentsItemArray  addObject:costs];
    }
    
    order.orderPresents = presentsItemArray;
                    base.franchiserOrder = order;
    
                    
                    NSDictionary *params = base.dictionaryRepresentation;
                    NSLog(@"%@",[base xr_modelToJSONString]);
                    
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
                            
                            
                            if ([result  isEqual: @"success"] ) {
                                [self showInfo:@"创建成功"];
                                [self.delegate newSellSuccess];
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    [self.navigationController popViewControllerAnimated:YES];

                                });
                                
                            
                            }else {
                                _submitButton.userInteractionEnabled = YES;
                                _submitButton.backgroundColor = JCColorBlue;
                            }
                            
                            NSLog(@"成功%@",result);
                        } else {
                            NSLog(@"请求失败error=%@", error);
                            
                            _submitButton.userInteractionEnabled = YES;
                            _submitButton.backgroundColor = JCColorBlue;
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
