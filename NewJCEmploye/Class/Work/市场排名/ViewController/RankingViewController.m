//
//  RankingViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/26.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RankingViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "SGActionView.h"
#import "HZQDatePickerView.h"
#import "BRPickerView.h"
#import "JCRequest_getResaleStatisticBySearch.h"
#import "DataModels.h"
#import "RankingBaseViewController.h"
@interface RankingViewController ()<UITableViewDelegate,UITableViewDataSource,HZQDatePickerViewDelegate>
{
    
    HZQDatePickerView *_pikerView;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *label1;
@property (nonatomic,strong) UILabel *starttimelabel;
@property (nonatomic,strong) UILabel *endtimelabel;
@end

@implementation RankingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"市场排名";
    self.view.backgroundColor = JCBackgroundColor;
    [self createTableView];
}

-(void)createTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
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
    label.text = @"搜索";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
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
        cell.titleLabel.text =@"排名类型";
        cell.contentLabel.text =@"请选择";
        _label1 = cell.contentLabel;
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text =@"开始时间";
        cell.contentLabel.text =@"请选择";
        _starttimelabel= cell.contentLabel;
    }
    if (indexPath.row == 2)
    {
        cell.titleLabel.text =@"结束时间";
        cell.contentLabel.text =@"请选择";
        _endtimelabel= cell.contentLabel;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        NSArray *array = @[@"全市场",@"本地销售"];
        [SGActionView showSheetWithTitle:@"选择排名类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _label1.text = array[index];
            
        }];
    }
    if (indexPath.row == 1)
    {
        [self setupDateView:DateTypeOfStart];
    }
    
    if (indexPath.row == 2)
    {
        [self setupDateView:DateTypeOfEnd];
    }
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, JCScreen_Width, JCScreen_Height + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    //     今天开始往后的日期
    //        [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    //    // 在今天之前的日期
    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    
    switch (type) {
            
        case DateTypeOfStart:
        {
            _starttimelabel.text = [NSString stringWithFormat:@"%@", date];
        }
            break;
        case DateTypeOfEnd:
        {
            _endtimelabel.text = [NSString stringWithFormat:@"%@", date];
        }
            break;
        
        default:
            break;
    }
}

-(void)buttonAction {
    
    RankingBaseViewController *vc  =[[RankingBaseViewController alloc]init];
    vc.startTime = _starttimelabel.text;
    vc.endTime = _endtimelabel.text;
    [self.navigationController pushViewController:vc animated:YES];
    
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
