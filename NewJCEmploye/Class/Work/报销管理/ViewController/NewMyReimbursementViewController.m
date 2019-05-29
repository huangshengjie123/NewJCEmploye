//
//  NewMyReimbursementViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/15.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewMyReimbursementViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "ReimbursementChargesViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "AdaptiveTableViewCell.h"
@interface NewMyReimbursementViewController ()<UITableViewDelegate,UITableViewDataSource,SelectReimbursementDetailsDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *carLabel;//车辆费用
@property (nonatomic,strong) UILabel *saleLabel;//销售费用
@property (nonatomic,strong) UILabel *manageLabel;//管理费用

@property (nonatomic,strong) NSArray *dataarray1;
@property (nonatomic,strong) NSArray *dataarray2;
@property (nonatomic,strong) NSArray *dataarray3;

@property (nonatomic,strong) NSString *string1;
@property (nonatomic,strong) NSString *string2;
@property (nonatomic,strong) NSString *string3;


@end

@implementation NewMyReimbursementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新增其他收入";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-90);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    
    UILabel *label= [[UILabel alloc]init];
    label.text = @"提交";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonAction {
    
    if (![_carLabel.text  isEqual: @"请选择"] ||![_saleLabel.text isEqual:@"请选择"] ||![_manageLabel.text isEqual:@"请选择"])
    {
        //给车辆部分报销
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@reimbursement/create.mdo?isAppLogin=true&jc4login=%@",config.viceBaseUrl,token];
        
        JCModel_reimbursementCreateBase *base = [[JCModel_reimbursementCreateBase alloc]init];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:50];
        [array addObjectsFromArray:_dataarray1];
        [array addObjectsFromArray:_dataarray2];
        [array addObjectsFromArray:_dataarray3];
        
        base.reimbursementItems =array;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self showInfo:@"提交成功"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *identifier = @"AdaptiveTableViewCell";
    AdaptiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[AdaptiveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0)
    {
        
        cell.titleLabel.text = @"车辆费用";
        cell.contentLabel.text = @"请选择";
        _carLabel = cell.contentLabel;
        if (_string1 != nil)
        {
            _carLabel.text = _string1;
        }
    
    }
    
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"销售费用";
        cell.contentLabel.text = @"请选择";
        _saleLabel = cell.contentLabel;
        if (_string2 != nil)
        {
            _saleLabel.text = _string2;
        }

    }

    if (indexPath.row == 2)
    {
        
        cell.titleLabel.text = @"管理费用";
        cell.contentLabel.text = @"请选择";
        _manageLabel = cell.contentLabel;
        if (_string3 != nil)
        {
            _manageLabel.text = _string3;
        }
    }
    
    if (indexPath.row == 3) {
        
        cell.titleLabel.text = @"出差单号";
        cell.contentLabel.text = @"请选择";
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 )
    {
        ReimbursementChargesViewController *vc = [[ReimbursementChargesViewController alloc]init];
        vc.typeString = @"车辆费用";
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1 )
    {
        ReimbursementChargesViewController *vc = [[ReimbursementChargesViewController alloc]init];
        vc.typeString = @"销售费用";
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2 )
    {
        ReimbursementChargesViewController *vc = [[ReimbursementChargesViewController alloc]init];
        vc.typeString = @"管理费用";
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3 )
    {
        
    }
}

-(void)SelectReimbursementDetailsSuccess:(NSArray *)array andName:(NSArray *)nameArray andtype:(NSString *)typeName {
    
    if ([typeName  isEqual: @"车辆费用"])
    {
        NSString *str =@"";
        
        for (int i = 0; i < nameArray.count; i++)
        {
            str = [NSString stringWithFormat:@"%@ %@",str,nameArray[i]];
        }
        _dataarray1 = array;
        _string1 = str;
        [_tableView reloadData];
        
    }
    
    if ([typeName  isEqual: @"销售费用"])
    {
        NSString *str =@"";
        
        for (int i = 0; i < nameArray.count; i++)
        {
            str = [NSString stringWithFormat:@"%@ %@",str,nameArray[i]];
        }
        _dataarray2 = array;
        _string2 = str;
        [_tableView reloadData];
        
    }
    
    if ([typeName  isEqual: @"管理费用"]) {
        NSString *str =@"";
        
        for (int i = 0; i < nameArray.count; i++) {
            
            str = [NSString stringWithFormat:@"%@ %@",str,nameArray[i]];
            
        }
        _dataarray3 = array;
        _string3 = str;
        
        [_tableView reloadData];
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
