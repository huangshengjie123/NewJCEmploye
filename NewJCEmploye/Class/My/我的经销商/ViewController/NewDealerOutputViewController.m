//
//  NewDealerOutputViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDealerOutputViewController.h"
#import "NewProbationView.h"
#import "FSTextView.h"
#import "Macro.h"
#import "RepertoryChooseViewController.h"
#import "LCNetworkConfig.h"
@interface NewDealerOutputViewController ()<SelectItemsDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NewProbationView *equipmentView;//设备
@property (nonatomic,strong) NewProbationView *waterView;//水
@property (nonatomic,strong) NewProbationView *partsView;//配件
@property (nonatomic,strong) NewProbationView *complimentaryView;//赠品
@property (nonatomic,strong) FSTextView *textView; // 备注text

@property (nonatomic,strong) NSArray *repertoryEquipmentArray;
@property (nonatomic,strong) NSArray *repertoryWaterArray;
@property (nonatomic,strong) NSArray *repertoryPartsArray;
@end

@implementation NewDealerOutputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建出库单";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
}
-(void)addViews {
    
    _equipmentView = [[NewProbationView alloc]init];
    _equipmentView.titleLabel.text = @"设备:";
    [self.view addSubview:_equipmentView];
    [_equipmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset( JCNew64);
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
    _partsView.titleLabel.text = @"配件:";
    [self.view addSubview:_partsView];
    [_partsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_waterView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _partsView.button.tag = 3;
    [_partsView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _complimentaryView = [[NewProbationView alloc]init];
    _complimentaryView.titleLabel.text = @"赠品:";
    [self.view addSubview:_complimentaryView];
    [_complimentaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_partsView.mas_bottom);
        make.height.equalTo(@(44));
    }];
    _complimentaryView.button.tag = 4;
    [_complimentaryView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCBackgroundColor;
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_complimentaryView.mas_bottom).offset(5);
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
    button.tag = 5;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"确认提交";
    label.font = JCFont14;
    label.textColor = JCColorWithe;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
}

-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1) {
        //设备
        
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"2";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        repertoryChooseVC.isSimpleOutbound = YES;
        

        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
        
    }
    if (button.tag == 2) {
        //水
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"1";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        repertoryChooseVC.isSimpleOutbound = YES;
        

        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 3) {
        //配件
        RepertoryChooseViewController *repertoryChooseVC = [[RepertoryChooseViewController alloc]init];
        repertoryChooseVC.typeString = @"3";
        repertoryChooseVC.delegate = self;
        repertoryChooseVC.warehouseString = _warehouseName;
        repertoryChooseVC.warehouseId = _warehouseId;
        repertoryChooseVC.isSimpleOutbound = YES;
        
        
        [self.navigationController pushViewController:repertoryChooseVC animated:YES];
    }
    
    if (button.tag == 4) {
        //赠品
        [self showInfo:@"还没开放赠品选择"];
    }
    
    if (button.tag == 5) {
        //创建
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserInOutOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_dealFranchiserInOutOrderBase *base = [[JCModel_dealFranchiserInOutOrderBase alloc]init];
        base.command = @"start";
       
        JCModel_dealFranchiserInOutOrderFranchiserInOutOrder *inOutOrder = [[JCModel_dealFranchiserInOutOrderFranchiserInOutOrder alloc]init];
        inOutOrder.type = @"0";
        inOutOrder.storeHouse = _warehouseId;
        inOutOrder.comments = _textView.text;
        NSString *str = [JCTokenManager getUserID];
        
        inOutOrder.franchiser = str;
//        inOutOrder.applicant = 101;
        inOutOrder.reason = @"Normal";

        NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:100];
  
            
            //            NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:100];
            
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
    
        inOutOrder.items = repertoryItemArray;

        
        base.franchiserInOutOrder = inOutOrder;
        
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
                    
                    [self.delegate newFOutputSuccess];
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
}

-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString {
    
}

//选择仓库
-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse {
    
    
    if ([typeString  isEqual: @"2"]) {
        //设备
        
        NSString *str = _equipmentView.contentLabel.text;
        if (str == NULL) {
            str = @"";
        }
        
        if (repertoryItemArray.count == 0) {
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
        if (repertoryItemArray.count == 0 ) {
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
        if (repertoryItemArray.count == 0 ) {
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
