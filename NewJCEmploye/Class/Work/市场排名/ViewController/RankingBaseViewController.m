//
//  RankingBaseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/26.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RankingBaseViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_getResaleStatisticBySearch.h"
#import "JCRequest_moneyBackRanking.h"
#import "RankingbaseTableViewCell.h"
@interface RankingBaseViewController ()<UITableViewDelegate,UITableViewDataSource,JCSelectViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) NSString    *type;
@end

@implementation RankingBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"市场排名";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    _type = @"个人零售";
    [self readdata];
}

-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0,JCNew64+10, JCScreen_Width, 40) withTitleArray:@[@"个人零售",@"个人总回款",@"团队总回款",@"分公司总回款"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jcselectView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

#pragma mark - UItableview代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"RankingbaseTableViewCell";
    RankingbaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[RankingbaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if ([_type  isEqual: @"个人零售"])
    {
        JCModel_rankingData *listdata = _dataArray[indexPath.row];
        cell.titleLabel.text = listdata.name;
        cell.contentLabel.text = listdata.xpath;
    }
    if ([_type  isEqual: @"个人总回款"])
    {
        JCModel_ranking2Data *listdata = _dataArray[indexPath.row];
        cell.titleLabel.text = listdata.userName;
        cell.contentLabel.text = listdata.xpath;
    }
    
    if ([_type  isEqual: @"团队总回款"])
    {
        JCModel_ranking2Data *listdata = _dataArray[indexPath.row];
         NSLog(@"listdata:::::%@",listdata);
        cell.titleLabel.text = listdata.groupName;

        cell.contentLabel.text = listdata.xpath;
    }
    
    if ([_type  isEqual: @"分公司总回款"])
    {
        JCModel_ranking2Data *listdata = _dataArray[indexPath.row];
        cell.titleLabel.text = listdata.comName;

        cell.contentLabel.text = listdata.com;
    }
    return cell;
}


-(void)readdata {
    
    [HttpTool postRequestWithURLStr:getResaleStatisticBySearch params:@{@"isAppLogin":@"true", @"jc4login":[JCTokenManager getToken],@"size":@"10",@"createTime":_startTime,@"createTimeRear":_endTime,} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200 )
        {
            NSDictionary *dic = responseDic;
            JCModel_rankingBase *base = [[JCModel_rankingBase alloc]initWithDictionary:dic];
            _dataArray = base.data;
            
            [_tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
                                                                            
        
    }];
  
}

-(void)readdataType:(NSInteger)type {
    
    NSLog(@"uelelel:::::%@",moneyBackRanking);
    [HttpTool postRequestWithURLStr:moneyBackRanking params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken],@"size":@"10",@"createTime":[NSString stringWithFormat:@"%@ 00:00:00",_startTime],@"createTimeRear":[NSString stringWithFormat:@"%@ 00:00:00",_endTime],@"type":@(type)} success:^(NSDictionary *responseDic) {
        NSLog(@"responseDic::::::%@",responseDic);
        if ([responseDic[@"code"] integerValue] == 200)
        {
            NSDictionary *dic = responseDic;
            JCModel_ranking2Base *base = [[JCModel_ranking2Base alloc]initWithDictionary:dic];
            _dataArray = base.data;
           [_tableView reloadData];

        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
    } failure:^(NSError *error) {

    }];
//
    //   http://192.168.0.199:8083/finance/moneyBackRanking.mdo
    
    
//    //个人回款排名
//    JCRequest_moneyBackRanking *request = [[JCRequest_moneyBackRanking alloc]init];
//    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
//    [request addAccessory:requestAccessory];
//    NSString *token = [JCTokenManager getToken];
//    NSString  *pageSize = [NSString stringWithFormat:@"10"];
//
//    request.requestArgument = @{
//                                @"isAppLogin":@"true",
//                                @"jc4login":token,
//                                @"size":pageSize,
//                                @"createTime":[NSString stringWithFormat:@"%@ 00:00:00",_startTime],
//                                @"createTimeRear":[NSString stringWithFormat:@"%@ 00:00:00",_endTime],
//                                @"type":@(type)
//                                };
//
//    [request startWithBlockSuccess:^(__kindof JCRequest_moneyBackRanking *request) {
//
//
//
//        NSDictionary *dic = request.responseJSONObject;
//        NSLog(@"dic::::%@",dic);
//        JCModel_ranking2Base *base = [[JCModel_ranking2Base alloc]initWithDictionary:dic];
//        _dataArray = base.data;
//        [_tableView reloadData];
//
//
//    } failure:^(__kindof JCRequest_moneyBackRanking *request, NSError *error) {
//
//    }];
}

- (void)buttonAction:(int)buttonNum {

    
    if(buttonNum == 0)
    {
        [self readdata];
        _type = @"个人零售";
    }
    
    if (buttonNum == 1)
    {
        [self readdataType:1];
        _type = @"个人总回款";
    }
    
    if (buttonNum == 2)
    {
        [self readdataType:2];
        _type = @"团队总回款";
    }

    if (buttonNum == 3)
    {
        [self readdataType:3];
        _type = @"分公司总回款";
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
