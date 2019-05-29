//
//  NewProbationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewProbationViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "FSTextView.h"
#import "ProbationCustomViewController.h"
#import "RepertoryChooseViewController.h"
#import "DataModels.h"
#import "JCRequest_NewProbationOrder.h"
#import "JCTokenManager.h"
#import "GenericModel.h"
#import "NSObject+XRModel.h"
#import "LCNetworkConfig.h"
#import "SGActionView.h"
#import "Request_readMyWarehouse.h"

@interface NewProbationViewController ()<SelectItemsDelegate,SelectProbationCustomDelegate>

@property (nonatomic,strong) UITableView      *tableView;
@property (nonatomic,strong) NewProbationView *customerView; //客户
@property (nonatomic,strong) NewProbationView *equipmentView;//设备
@property (nonatomic,strong) NewProbationView *waterView;//水
@property (nonatomic,strong) NewProbationView *partsView;//零件
@property (nonatomic,strong) FSTextView       *textView; // 备注text

@property (nonatomic,strong) NSArray          *myEquipmentArray;
@property (nonatomic,strong) NSArray          *myWaterArray;
@property (nonatomic,strong) NSArray          *myPartsArray;

@property (nonatomic,strong) NSArray          *repertoryEquipmentArray;
@property (nonatomic,strong) NSArray          *repertoryWaterArray;
@property (nonatomic,strong) NSArray          *repertoryPartsArray;

@property (nonatomic,strong) NSArray                     *myitemsArray;
@property (nonatomic,strong) NSArray                     *repertoryItemArray;
@property (nonatomic,strong) JCModel_ProabtionCustomList *listData;


@end

@implementation NewProbationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建试用单";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    _myEquipmentArray = @[];
    _myWaterArray = @[];
    _myPartsArray = @[];
    
    _repertoryPartsArray = @[];
    _repertoryWaterArray = @[];
    _repertoryEquipmentArray = @[];

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
    _equipmentView.titleLabel.text = @"设备:";
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
    
    _partsView = [[NewProbationView alloc]init];
    _partsView.titleLabel.text = @"零件:";
    [self.view addSubview:_partsView];
    [_partsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_waterView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _partsView.button.tag = 3;
    [_partsView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    

    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_partsView.mas_bottom).offset(5);
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
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"确认提交" forState:UIControlStateNormal];
    button.backgroundColor = JCColorBlue;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
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
    
}

-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 0)
    {
        //客户选择
        ProbationCustomViewController *probationCustomVC = [[ProbationCustomViewController alloc]init];
        probationCustomVC.tpyeString = @"1";
        probationCustomVC.delegate = self;
        [self.navigationController pushViewController:probationCustomVC animated:YES];
    }
    
    if (button.tag == 1)
    {
        //设备选择
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"2";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 2)
    {
        //水的选择
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 3)
    {
        //配件选择
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"3";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseString;
        repertoryChooseVC.warehouseId = _warehouseId;
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
}

/*  确认提交 */
-(void)test2 {
    
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    JCModel_NewProbationOrderJsonBase *base = [[JCModel_NewProbationOrderJsonBase alloc]init];
    base.command = @"start";
    JCModel_NewProbationOrderJsonProbation *probation = [[JCModel_NewProbationOrderJsonProbation alloc]init];

    //填试用客户信息 以及 业务员ID 以及备注信息
    probation.preid = _listData.listIdentifier;
    NSString *str = [JCTokenManager getUserID];
    probation.guide = str.doubleValue;
    probation.comments = _textView.text;
    NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:100];
    
    //循环将3种仓库的物品 添加到一起
    for (int i = 0; i < _repertoryEquipmentArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _repertoryEquipmentArray[i];
        [repertoryItemArray  addObject:costs];
    }
    for (int i = 0; i < _repertoryWaterArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _repertoryWaterArray[i];
        [repertoryItemArray  addObject:costs];
    }
    for (int i = 0; i < _repertoryPartsArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _repertoryPartsArray[i];
        [repertoryItemArray  addObject:costs];
    }
    
    //给仓库需要出库的数组传值
    probation.costs = repertoryItemArray;
    //判断是否出库 如果出库 isOutStore 是 YEs 并且要填出库仓库ID
    if (probation.costs.count == 0)
    {
        base.isOutStore = NO;
    }
    else
    {
        base.isOutStore = YES;
        base.storeHourse = _warehouseId;    //待传仓库ID
    }
    NSMutableArray *myItemsArray = [NSMutableArray arrayWithCapacity:100];
    //循环将3种仓库的物品 添加到一起
    for (int i = 0; i < _myEquipmentArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _myEquipmentArray[i];
        [myItemsArray  addObject:costs];
    }
    for (int i = 0; i < _myWaterArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _myWaterArray[i];
        [myItemsArray  addObject:costs];
    }
    for (int i = 0; i < _myPartsArray.count; i ++)
    {
        JCModel_NewProbationOrderJsonCosts *costs = _myPartsArray[i];
        [myItemsArray  addObject:costs];
    }

   // 给不需要仓库出库的数组传值
    probation.costsSelf = myItemsArray;
    base.probation = probation;
    NSDictionary *params = base.dictionaryRepresentation;

    [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {

        if ([responseDic[@"code"] integerValue] == 200)
        {
            [self.delegate newProbationSuccess];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }

    } failure:^(NSError *error) {

    }];

}

-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
    if ([typeString  isEqual: @"2"])
    {
        //设备
        NSString *str = @"";
     
        if (myItemArray.count == 0)
        {
            _myEquipmentArray = @[];
            _equipmentView.contentLabel.hidden = YES;
            [_equipmentView.button setTitle:@"请选择" forState:UIControlStateNormal];
        }
        else
        {
            _myEquipmentArray = myItemArray;
        }
        
        for (int i = 0; i < myItemArray.count; i ++ )
        {
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
        
        if (myItemArray.count == 0)
        {
            _myWaterArray = @[];
            _waterView.contentLabel.hidden = YES;
            [_waterView.button setTitle:@"请选择" forState:UIControlStateNormal];
        }
        else
        {
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
    NSLog( @":::::::%@",myItemArray);

}

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    NSLog( @"：：：：：：：%@",repertoryItemArray);
    if ([typeString  isEqual: @"2"])
    {
        //设备
        NSString *str = _equipmentView.contentLabel.text;
        if (str == NULL)
        {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myEquipmentArray.count == 0)
        {
            _repertoryEquipmentArray = @[];
            _equipmentView.contentLabel.hidden = YES;
            [_equipmentView.button setTitle:@"请选择" forState:UIControlStateNormal];
        }
        else
        {
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
    if ([typeString  isEqual: @"1"])
    {
        //水
        NSString *str = _waterView.contentLabel.text;
        if (str == NULL)
        {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myWaterArray.count == 0)
        {
            _repertoryWaterArray = @[];
            _waterView.contentLabel.hidden = YES;
            [_waterView.button setTitle:@"请选择" forState:UIControlStateNormal];
        }
        else
        {
            _repertoryWaterArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ )
        {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _waterView.contentLabel.text = str;
            _waterView.contentLabel.hidden = NO;
            [_waterView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"3"])
    {
        //配件
        NSString *str = _partsView.contentLabel.text;
        if (str == NULL)
        {
            str = @"";
        }
        if (repertoryItemArray.count == 0 && _myPartsArray.count == 0)
        {
            _repertoryPartsArray = @[];
            _partsView.contentLabel.hidden = YES;
            [_partsView.button setTitle:@"请选择" forState:UIControlStateNormal];
        }
        else
        {
            _repertoryPartsArray = repertoryItemArray;
        }
        
        for (int i = 0; i < repertoryItemArray.count; i ++ )
        {
            JCModel_NewProbationOrderJsonCosts *costs = repertoryItemArray[i];
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.name,(int)costs.num];
            _partsView.contentLabel.text = str;
            _partsView.contentLabel.hidden = NO;
            [_partsView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
}
-(void)selectProbationReturn:(JCModel_ProabtionCustomList *)listData {
    
    _listData = listData;
    [_customerView.button setTitle:listData.name forState:UIControlStateNormal];

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
