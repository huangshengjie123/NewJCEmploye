//
//  WaterCardViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WaterCardViewController.h"
#import "Macro.h"
#import "JCRequest_ReadMyWaterCardInfo1.h"
#import "WaterCardTableViewCell.h"
#import "DataModels.h"
#import "WatercardDetails2ViewController.h"
@interface WaterCardViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation WaterCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的水卡";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
    
}

-(void)addViews {
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64);
        make.bottom.equalTo(self.view);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"WaterCardTableViewCell";
    WaterCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (cell == nil) {
        cell = [[WaterCardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    JCModel_MyWaterCardInformationData *data = _dataArray[indexPath.row];
    if (data.type == 3)
    {
        cell.titleLabel.text = @"洁澄员工销售水卡";
    }
    if (data.type == 2)
    {
        cell.titleLabel.text = @"洁澄员工推广水卡";
    }
    if (data.type == 4)
    {
        cell.titleLabel.text = @"洁澄员工配送水卡";
    }
    
    double  a = 0;
    for (int i = 0 ; i < data.waterCardItems.count; i ++) {
        JCModel_MyWaterCardInformationWaterCardItems *items = data.waterCardItems[i];
        a = a + items.num;
    }
    cell.numLabel.text = [NSString stringWithFormat:@"%d",(int)a];
    
    cell.cardID.text = data.dataIdentifier;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_MyWaterCardInformationData *data = _dataArray[indexPath.row];
    WatercardDetails2ViewController *vc = [[WatercardDetails2ViewController alloc]init];
    NSLog(@"waterCardItems:::::::::::%@",data.waterCardItems);
    vc.itemDataArray = data.waterCardItems ;
    vc.idSring = data.dataIdentifier;
    vc.numstring = _numstring;
    vc.groupId = _groupId;
    vc.isFinancial = _isFinancial;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

-(void)readData {
    
    JCRequest_ReadMyWaterCardInfo1 *request = [[JCRequest_ReadMyWaterCardInfo1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userID = [JCTokenManager getUserID];
    
    if (_numstring != nil)
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"uowner":_numstring,
                                    };
    }
    else
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"uowner":userID,
                                    };
    }

    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyWaterCardInfo1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic  = request.responseJSONObject;
        NSLog(@"dic:::::::::::::%@",dic);
        JCModel_MyWaterCardInformationBase *base = [[JCModel_MyWaterCardInformationBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadMyWaterCardInfo1 *JCRequest_ReadMyWaterCardInfo1, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
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
