//
//  SelectedPForCarViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SelectedPForCarViewController.h"
#import "Macro.h"
#import "SelectedForCarTableViewCell.h"
#import "JCRequest_readgetDistributionByCom.h"
#import "DataModels.h"
@interface SelectedPForCarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation SelectedPForCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择配送员";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SelectedForCarTableViewCell";
    // 1.缓存中取
    SelectedForCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[SelectedForCarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_DistributionCarPGroupRelations *data = _dataArray[indexPath.row];
    
    cell.nameLabel.text = data.name;    
    
    return cell;
    
}

-(void)readData {
    
    JCRequest_readgetDistributionByCom *request = [[JCRequest_readgetDistributionByCom alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readgetDistributionByCom *request) {
        //
        NSLog(@"成功");
      
        NSDictionary * dic = request.responseJSONObject;
        
        JCModel_DistributionCarPBase *base = [[JCModel_DistributionCarPBase alloc]initWithDictionary:dic];
        
        NSArray *array = base.data;
        
        if (array.count > 0) {
            JCModel_DistributionCarPData *data = array[0];
            _dataArray = data.groupRelations;
        }
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readgetDistributionByCom *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate newSuccuss];
    [self.navigationController popViewControllerAnimated:YES];
    
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
