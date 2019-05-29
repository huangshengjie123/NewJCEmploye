//
//  CleanDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CleanDetailsViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "ItemsTableViewCell.h"
#import "WatercardDetails2ViewController.h"
@interface CleanDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *tableView2;
@end

@implementation CleanDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"客户转移转赠详情";
    self.view.backgroundColor = JCBackgroundColor;
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
        make.height.equalTo(@(352));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView2 = [[UITableView alloc]init];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.backgroundColor = JCBackgroundColor;
    self.tableView2.tag = 2;
    [self.view addSubview:self.tableView2];
    [self.tableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(0);
        make.bottom.equalTo(self.view);
    }];
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return 8;
    }else {
        return _listData.donationRecordCosts.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1)
    {
        static NSString *identifier = @"NewProbationCustomTableViewCell";
        // 1.缓存中取
        NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"转出客户:";
            cell.contentLabel.hidden = NO;
            cell.contentLabel.text = _listData.fromCusName;
            cell.contentTextField.hidden = YES;
        }
        
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"转出水卡:";
            
            cell.contentTextField.hidden = YES;
            cell.buttonLabel.text =_listData.fromCardId;
            cell.button.hidden = NO;
            cell.button.tag = 0;
            [cell.button addTarget:self action:@selector(buttonActon:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        if (indexPath.row == 2) {
            cell.titleLabel.text = @"转入客户:";
            cell.contentLabel.hidden = NO;
            cell.contentLabel.text = _listData.toCusName;
            cell.contentTextField.hidden = YES;
        }
        
        
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"转入水卡:";
            
            cell.contentTextField.hidden = YES;
            cell.buttonLabel.text =_listData.toCardId;
            cell.button.hidden = NO;
            cell.button.tag = 1;
            [cell.button addTarget:self action:@selector(buttonActon:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        if (indexPath.row == 4) {
            cell.titleLabel.text = @"业务员:";
            cell.contentLabel.hidden = NO;
            cell.contentLabel.text = _listData.userName;
            cell.contentTextField.hidden = YES;
        }
        
        if (indexPath.row == 5) {
            cell.titleLabel.text = @"时间:";
            cell.contentLabel.hidden = NO;
            cell.contentLabel.text = _listData.createTime;
            cell.contentTextField.hidden = YES;
        }
        
        if (indexPath.row == 6) {
            cell.titleLabel.text = @"备注:";
            cell.contentLabel.hidden = NO;
            cell.contentLabel.text = _listData.comments;
            cell.contentTextField.hidden = YES;
        }
        
        if (indexPath.row == 7) {
            cell.titleLabel.text = @"物品:";
            
            
            cell.contentTextField.hidden = YES;
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
        
        JCModel_DonationRecordsDonationRecordCosts *cost = _listData.donationRecordCosts[indexPath.row];
        
        cell.contentLabel.text = cost.itemName;
        cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)cost.num];
        return cell;
        
    }
    
}
-(void)buttonActon:(UIButton *)button {
    if (button.tag == 0) {
        WatercardDetails2ViewController *vc = [[WatercardDetails2ViewController alloc]init];
        vc.userId = [NSString stringWithFormat:@"%d",(int)_listData.fromCusId];
        vc.idSring = _listData.fromCardId;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (button.tag == 1) {
        WatercardDetails2ViewController *vc = [[WatercardDetails2ViewController alloc]init];
        vc.userId = [NSString stringWithFormat:@"%d",(int)_listData.toCusId];
        vc.idSring = _listData.toCardId;
        [self.navigationController pushViewController:vc animated:YES];
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
