//
//  ReWriteOutBoundViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReWriteOutBoundViewController.h"
#import "Macro.h"
#import "NewProbationView.h"
#import "ReWriteSelectedViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"

@interface ReWriteOutBoundViewController ()<ReSelectItemsDelegate>

@property (nonatomic,strong) NewProbationView *equipmentView;//设备
@property (nonatomic,strong) NewProbationView *waterView;//水
@property (nonatomic,strong) NewProbationView *partsView;//零件

@property (nonatomic,strong) NSArray *repertoryEquipmentArray;
@property (nonatomic,strong) NSArray *repertoryWaterArray;
@property (nonatomic,strong) NSArray *repertoryPartsArray;
@end

@implementation ReWriteOutBoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重新选择";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    _equipmentView = [[NewProbationView alloc]init];
    _equipmentView.titleLabel.text = @"设备:";
    [self.view addSubview:_equipmentView];
    [_equipmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
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
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(44));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"确认修改";
    label.font = JCFont14;
    label.textColor = JCColorWithe;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    button.tag = 4;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1)
    {
        ReWriteSelectedViewController *rewriteSelectedVC = [[ReWriteSelectedViewController alloc]init];
        rewriteSelectedVC.typeString = @"2";
        rewriteSelectedVC.delegate = self;
        [self.navigationController pushViewController:rewriteSelectedVC animated:YES];
    }
    
    if (button.tag == 2)
    {
        ReWriteSelectedViewController *rewriteSelectedVC = [[ReWriteSelectedViewController alloc]init];
        rewriteSelectedVC.typeString = @"1";
        rewriteSelectedVC.delegate = self;
        [self.navigationController pushViewController:rewriteSelectedVC animated:YES];
    }
    
    if (button.tag == 3)
    {
        ReWriteSelectedViewController *rewriteSelectedVC = [[ReWriteSelectedViewController alloc]init];
        rewriteSelectedVC.typeString = @"3";
        rewriteSelectedVC.delegate = self;
        [self.navigationController pushViewController:rewriteSelectedVC animated:YES];
    }
    
    if (button.tag == 4)
    {
        //确认修改操作
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
         NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_inOutRewriteBase *base = [[JCModel_inOutRewriteBase alloc]init];
        base.command = @"next";
        base.current = @"output_requst_rewrite";
        JCModel_inOutRewriteInOutOrder *outOrder = [[JCModel_inOutRewriteInOutOrder alloc]init];
        outOrder.inOutOrderIdentifier = _listData.listIdentifier;
        
        NSMutableArray *repertoryItemArray = [NSMutableArray arrayWithCapacity:20];
        
        for (int i = 0; i <_repertoryEquipmentArray.count; i++)
        {
            [repertoryItemArray addObject:_repertoryEquipmentArray[i]];
        }
        
        for (int i = 0; i <_repertoryWaterArray.count; i++)
        {
            [repertoryItemArray addObject:_repertoryWaterArray[i]];
        }
        
        for (int i = 0; i <_repertoryPartsArray.count; i++)
        {
            [repertoryItemArray addObject:_repertoryPartsArray[i]];
        }
        
        outOrder.items = repertoryItemArray;
        
        base.inOutOrder = outOrder;
    
        NSDictionary *params = base.dictionaryRepresentation;
       
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self showInfo:@"成功"];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
}

//返回来的选择结果
-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString {
    NSLog(@"%@",repertoryItemArray);
    
    if ([typeString  isEqual: @"2"]) {
        //设备
        
      
        if (repertoryItemArray.count  == 0) {
            _repertoryWaterArray = @[];
            _equipmentView.contentLabel.hidden = YES;
            [_equipmentView.button setTitle:@"请选择" forState:UIControlStateNormal];
            
        }else {
            _repertoryEquipmentArray = repertoryItemArray;
        }
                
        for (int i = 0; i < repertoryItemArray.count; i ++ ) {
             JCModel_inOutRewriteItems  *costs = repertoryItemArray[i];
             NSString *str = @"";
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.test,(int)costs.num];
            
            _equipmentView.contentLabel.text = str;
            _equipmentView.contentLabel.hidden = NO;
            [_equipmentView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"1"]) {
        //水
        if (repertoryItemArray.count  == 0)
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
            JCModel_inOutRewriteItems *costs = repertoryItemArray[i];
            
            NSString *str = @"";

            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.test,(int)costs.num];
           
            _waterView.contentLabel.text = str;
            _waterView.contentLabel.hidden = NO;
            [_waterView.button setTitle:@"" forState:UIControlStateNormal];
        }
    }
    if ([typeString  isEqual: @"3"])
    {
        //配件
        if (repertoryItemArray.count == 0)
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
            JCModel_inOutRewriteItems *costs = repertoryItemArray[i];
            
            NSString *str = @"";
            str = [NSString stringWithFormat:@"%@ %@ X %d",str,costs.test,(int)costs.num];
            
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
