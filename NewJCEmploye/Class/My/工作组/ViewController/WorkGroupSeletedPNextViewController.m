//
//  WorkGroupSeletedPNextViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupSeletedPNextViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "WorkGroupSeleted1TableViewCell.h"
@interface WorkGroupSeletedPNextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cellArray;
@end
static NSString *identifier = @"WorkGroupSeleted1TableViewCell";

@implementation WorkGroupSeletedPNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择组员";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
    if (_ismMultiselect == YES) {
        
        
        UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        informationCardBtn2.tag = 2;
        [informationCardBtn2 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn2 setTitle:@"确定" forState:UIControlStateNormal];
        [informationCardBtn2 setTitleColor:JCColorBlue forState:UIControlStateNormal];
        
        [informationCardBtn2 sizeToFit];
        
        
        UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
        
        self.navigationItem.rightBarButtonItems  = @[informationCardItem2];
        
    }else {
      
        
    }
    
  
    
}
-(void)buttonAction {
    //确定
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i <_cellArray.count; i ++) {
        
        WorkGroupSeleted1TableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
         cell = self.cellArray[i];
        if (cell.isSeleted == YES) {
            [array addObject:cell.sringId];
            
        }
        [self.delegate NewMyGroupArray:array];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
 
    
}

-(void)addViews {
    self.cellArray = [NSMutableArray arrayWithCapacity:100];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _userDataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
    
    WorkGroupSeleted1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 2.创建
    if (cell == nil) {
        cell = [[WorkGroupSeleted1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_employeeInfoData *data = _userDataArray[indexPath.row];
    
    cell.nameLabel.text = data.name;
  
    
    if (_ismMultiselect == YES) {
        
        cell.button.userInteractionEnabled = YES;
        
    }else {
        cell.button.userInteractionEnabled = NO;

    }
    cell.sringId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
    

    
    
    
    [self.cellArray addObject:cell];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    JCModel_employeeInfoData *data = _userDataArray[indexPath.row];
//
//    [self.delegate NewMyGroup:data];
//
//    [self.navigationController popViewControllerAnimated:YES];
//
//
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (_ismMultiselect == YES) {
      
       
        
        
    }else {
        
        JCModel_employeeInfoData *data = _userDataArray[indexPath.row];
        
        [self.delegate NewMyGroup:data];
        
        [self.navigationController popViewControllerAnimated:YES];
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
