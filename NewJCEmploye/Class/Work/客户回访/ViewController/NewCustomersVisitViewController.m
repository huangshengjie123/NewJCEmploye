//
//  NewCustomersVisitViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewCustomersVisitViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "FSTextView.h"
#import "DataModels.h"
#import "RepertoryChooseViewController.h"
#import "MyCustomerViewController.h"
#import "LCNetworkConfig.h"

@interface NewCustomersVisitViewController ()<MyCustomerDelegate,SelectItemsDelegate>

@property (nonatomic,strong) NewProbationView *customerView; //客户
@property (nonatomic,strong) NewProbationView *equipmentView;//设备
@property (nonatomic,strong) NewProbationView *waterView;//水
@property (nonatomic,strong) NewProbationView *accessoriesView;//配件
@property (nonatomic,strong) FSTextView       *textView; // 备注text
@property (nonatomic,assign) double           customerId; //客户ID

@property (nonatomic,strong) NSArray          *repertoryWaterArray;  /// 仓库出的水
@property (nonatomic,strong) NSArray          *repertoryEquipmentArray; // 仓库出的赠品
@property (nonatomic,strong) NSArray          *repertoryPJArray; //配件


@property (nonatomic,strong) NSArray          *myWaterArray; //我身上的水
@property (nonatomic,strong) NSArray          *myEquipmentArray; // 我出的赠品
@property (nonatomic,strong) NSArray          *myPJArray; //配件




@end

@implementation NewCustomersVisitViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建客户回访";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view).offset(JCNew64);
        make.height.equalTo(@(5));
    }];
    
    _customerView = [[NewProbationView alloc]init];
    _customerView.titleLabel.text = @"客户:";
    [self.view addSubview:_customerView];
    [_customerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(lineView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _customerView.button.tag = 0;
    [_customerView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _equipmentView = [[NewProbationView alloc]init];
    _equipmentView.titleLabel.text = @"赠品:";
    [self.view addSubview:_equipmentView];
    [_equipmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_customerView.mas_bottom).offset(0);
        make.height.equalTo(@(44));
    }];
    _equipmentView.button.tag = 1;
    [_equipmentView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _waterView = [[NewProbationView alloc]init];
    _waterView.titleLabel.text = @"水:";
    [self.view addSubview:_waterView];
    [_waterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_equipmentView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _waterView.button.tag = 2;
    [_waterView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _accessoriesView = [[NewProbationView alloc]init];
    _accessoriesView.titleLabel.text = @"配件:";
    [self.view addSubview:_accessoriesView];
    [_accessoriesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_waterView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _accessoriesView.button.tag = 100;
    [_accessoriesView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_accessoriesView.mas_bottom).offset(5);
        make.height.equalTo(@(5));
    }];
    
    UIView *remakeView = [[UIView alloc]init];
    remakeView.backgroundColor = JCColorWithe;
    [self.view addSubview:remakeView];
    [remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(lineView2.mas_bottom);
        make.height.equalTo(@(70));
    }];
    
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"备注:";
    label1.textColor = JCColorBlack;
    label1.font = JCFont14;
    [remakeView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(remakeView).offset(10);
        make.top.equalTo(remakeView).offset(10);
    }];
    
    _textView = [[FSTextView alloc]init];
    _textView.placeholder = @"请填写备注";
    [remakeView addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(10);
        make.top.equalTo(remakeView.mas_top).offset(5);
        make.bottom.equalTo(remakeView.mas_bottom).offset(0);
        make.right.equalTo(remakeView.mas_right).offset(-10);
    }];
    _textView.font = JCFont14;
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-40);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5.0f;
    [button addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"确认";
    label.font = JCFont14;
    label.textColor = JCColorWithe;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    
    
}
-(void)test2 {

        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@visit/createVisit.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];

        // 请求参数字典


        JCModel_newReturnVisitBase *base = [[JCModel_newReturnVisitBase alloc]init];

        JCModel_newReturnVisitVisit *vist  = [[JCModel_newReturnVisitVisit alloc]init];
        vist.vtype = 0;
        vist.guide = [JCTokenManager getUserID].doubleValue;


        NSMutableArray *myItemsArray = [NSMutableArray arrayWithCapacity:100];

        for (int i = 0; i < _myWaterArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = _myWaterArray[i];
            [myItemsArray  addObject:costs];
        }

        for (int i = 0; i < _myEquipmentArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = _myEquipmentArray[i];
            [myItemsArray  addObject:costs];
        }
    
    for (int i = 0; i < _myPJArray.count; i ++) {
        JCModel_NewProbationOrderJsonCosts *costs = _myPJArray[i];
        [myItemsArray  addObject:costs];
    }

    
    
        NSString *mystr = @"";

        for (int i = 0; i<myItemsArray.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = myItemsArray[i];

            mystr = [NSString stringWithFormat:@"%@ %@ x %d",mystr,costs.name,(int)costs.num];

        }
        vist.myItem = mystr;
        vist.cusId = _customerId;
        vist.items = myItemsArray;


        
        JCModel_newReturnVisitCommand *command = [[JCModel_newReturnVisitCommand alloc]init];
        command.command= @"start";
        command.current = @"output_requst_create";
        JCModel_newReturnVisitInOutOrder *inoutOrder = [[JCModel_newReturnVisitInOutOrder alloc]init];
        inoutOrder.reason = @"Visit";
        inoutOrder.comments  = _textView.text;
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
    for (int i = 0; i < _repertoryPJArray.count; i ++) {
        JCModel_NewProbationOrderJsonCosts *costs = _repertoryPJArray[i];
        [repertoryItemArray  addObject:costs];
    }

        if (repertoryItemArray.count > 0) {
            inoutOrder.items = repertoryItemArray;
        }

        inoutOrder.storeHouse = _warehouseId.doubleValue;
        inoutOrder.applicant = [JCTokenManager getUserID].doubleValue;
        inoutOrder.type = 0;

        command.inOutOrder = inoutOrder;

       
        
        if (_repertoryEquipmentArray.count >0  || _repertoryWaterArray.count > 0 || _repertoryPJArray.count > 0) {
             base.command = command;
            
        }
        base.visit = vist;
        


        NSDictionary *params = base.dictionaryRepresentation;
        NSLog(@"%@",base);

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

                    //                [self.delegate newSellSuccess111];
                    [self.navigationController popViewControllerAnimated:YES];
                }else {
                    [self showInfo:msg];
                }

                NSLog(@"成功%@",result);
            } else {
                NSLog(@"请求失败error=%@", error);
            }



        }];

        [task resume];
}


-(void)buttonAction:(UIButton *)button {
    
    
    if (button.tag == 0) {
        //客户选择
        MyCustomerViewController *myCustomerVC = [[MyCustomerViewController alloc]init];
        myCustomerVC.fromString = @"newCustomer";
        myCustomerVC.delegate = self;
        [self.navigationController pushViewController:myCustomerVC animated:YES];
        
    }
    
    if (button.tag == 2) {
        //赠品
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 1) {
        //水的选择
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"5";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    if (button.tag == 100)
    {
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"3";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
  
}
//选择客户的返回
-(void)selectMyCustomerReturn:(JCModel_GetCustmerData *)custmerData {
    
    [_customerView.button setTitle:custmerData.name forState:UIControlStateNormal];
    _customerId = custmerData.dataIdentifier;
}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    
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
    
    if ([typeString  isEqual: @"5"]) {
        //水
        
        NSString *str = _equipmentView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myEquipmentArray == 0) {
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
    
    if ([typeString  isEqual: @"3"]) {
        //水
        
        NSString *str = _accessoriesView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myPJArray == 0) {
            _repertoryPJArray = @[];
            _accessoriesView.contentLabel.hidden = YES;
            [_accessoriesView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryPJArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ )
        {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _accessoriesView.contentLabel.text = str;
            _accessoriesView.contentLabel.hidden = NO;
            [_accessoriesView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
}
//选择我的身上的东西返回
-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
    
    if ([typeString  isEqual: @"5"])
    {
        //赠品
        NSString *str = @"";
        
        if (myItemArray.count == 0 && _repertoryEquipmentArray.count == 0) {
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
    if ([typeString  isEqual: @"1"])
    {
        //水
        NSString *str = @"";
        
        if (myItemArray.count == 0 && _repertoryWaterArray.count == 0)
        {
            _myWaterArray = @[];
            _waterView.contentLabel.hidden = YES;
            [_waterView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }
        else
        {
            _myWaterArray = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ )
        {
            JCModel_NewProbationOrderJsonCostsSelf *costsSelf = myItemArray[i];
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costsSelf.name,(int)costsSelf.num];
            _waterView.contentLabel.text = str;
            _waterView.contentLabel.hidden = NO;
            [_waterView.button setTitle:@"" forState:UIControlStateNormal];
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
