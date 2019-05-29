//
//  DealerDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "SGActionView.h"
#import "MyCustomerViewController.h"
#import "WarningViewController.h"
#import "ProbationCustomViewController.h"
#import "DealerAccountViewController.h"
#import "MyItemsViewController.h"
#import "DealerProbationViewController.h"
#import "DealerSaleViewController.h"
#import "NewDealerViewController.h"

@interface DealerDetailsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel     *namaLabel;
@property (nonatomic,strong) UILabel     *phoneLabel;

@end

@implementation DealerDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"经销商详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [informationCardBtn setTitle:@"查询" forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    
    UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn2 addTarget:self action:@selector(bianji) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn2 setTitleColor:JCColorBlack forState:UIControlStateNormal];
    [informationCardBtn2 setTitle:@"编辑" forState:UIControlStateNormal];
    
    [informationCardBtn2 sizeToFit];
    UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}
-(void)buttonAction {
    
    NSArray *array = @[@"经销商客户",@"水量预警",@"试用名单",@"自身物品",@"试用单",@"销售单"];
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择查询类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        if (index == 0)
        {
            //跳到经销商客户
            MyCustomerViewController *myCustomerVC  = [[MyCustomerViewController alloc]init];
            myCustomerVC.guideSring = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:myCustomerVC animated:YES];
        }
    
        if (index == 1)
        {
            WarningViewController *myCustomerVC  = [[WarningViewController alloc]init];
            myCustomerVC.guideSring = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:myCustomerVC animated:YES];
        }
        
        if (index == 2)
        {
            ProbationCustomViewController *probationCustomVC = [[ProbationCustomViewController alloc]init];
            probationCustomVC.guideSring = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:probationCustomVC animated:YES];
        }
        
        if (index == 3)
        {
            MyItemsViewController *myItemsVC = [[MyItemsViewController alloc]init];
            myItemsVC.sting = @"franchiser";
            myItemsVC.guiID = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:myItemsVC animated:YES];
        }
        
        if (index == 4)
        {
            DealerProbationViewController *vc = [[DealerProbationViewController alloc]init];
            vc.guiID = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (index == 5)
        {
            DealerSaleViewController *vc = [[DealerSaleViewController alloc]init];
            vc.guiID = [NSString stringWithFormat:@"%d",(int)_listData.uid];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }];
}


-(void)bianji {
    
    NewDealerViewController *vc = [[NewDealerViewController alloc]init];
    vc.listData = _listData;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    topView.backgroundColor = JCColorWithe;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(66));
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"默认头像男"];
    [topView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(topView.mas_left).offset(10);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
    
    _namaLabel = [[UILabel alloc]init];
    _namaLabel.font = JCFont16;
    _namaLabel.textColor = JCColorBlack;
    [topView addSubview:_namaLabel];
    [_namaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView).offset(9);
        make.left.equalTo(imageView.mas_right).offset(10);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont14;
    _phoneLabel.textColor = JCColorBlue;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_namaLabel.mas_bottom).offset(10);
        make.left.equalTo(_namaLabel);
    }];
    
    _namaLabel.text = _listData.name;
    _phoneLabel.text = _listData.phone;
    
    NSLog(@"%@",_listData);
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    if (indexPath.row == 0)
    {
        cell.titleLabel.text = @"账户金额";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = [NSString stringWithFormat:@"%d",(int)_listData.balance];
//        _departmentLabel = cell.contentLabel;
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"账户";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _listData.phone;
//        _positionLabel =  cell.contentLabel;
    }
    if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"类别";
        cell.arrowImageView.hidden = YES;
        if ([_listData.type  isEqual: @"frak"]) {
            cell.contentLabel.text = @"特级经销商";
        }
        if ([_listData.type  isEqual: @"fran"]) {
            cell.contentLabel.text = @"经销商";
        }
        if ([_listData.type  isEqual: @"coo"]) {
            cell.contentLabel.text = @"合作商";
        }
        
//        _phoneLabel = cell.contentLabel;
    }
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"地址";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = [NSString stringWithFormat:@"%@ %@",_listData.province,_listData.address];
//        _addressLabel =  cell.contentLabel;
    }
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"业务员";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _listData.username;
//        _wxLabel  =cell.contentLabel;
    }
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"所属公司";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _listData.xpath;
        //        _wxLabel  =cell.contentLabel;
    }
    
    return  cell;
    
}


-(void)readData {
    
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
