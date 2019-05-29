//
//  WorkLogViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkLogViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_readWorklog.h"
#import "WorkLogTableViewCell.h"
#import "NewWorkLogViewController.h"
#import "LCNetworkConfig.h"
#import "JCRequest_DeleteWorkLog.h"
@interface WorkLogViewController ()<UITableViewDelegate,UITableViewDataSource,NewWorkLogDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation WorkLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"工作日志";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    [self addViews];
}

-(void)addViews {
    
    
    if (_employeeString.length == 0) {
        UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
        
        [informationCardBtn sizeToFit];
        UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
        
        self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    }
   
    
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
    
    static NSString *identifier = @"WorkLogTableViewCell";
    // 1.缓存中取
    WorkLogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[WorkLogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    JCModel_WorkLogList *list = _dataArray[indexPath.row];
    
    
    cell.timeLabel.text = list.day;
    [cell addContentLabel];
    
    if ([list.dailyLog.summary  isEqual: @""]) {
//        cell.contenLabel.text = @"还没有填写今日总结";
    }else {
        cell.contenLabel.text = list.dailyLog.summary;
    }

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_WorkLogList *list = _dataArray[indexPath.row];

    NewWorkLogViewController *newWorkLogVC =[[NewWorkLogViewController alloc]init];
    newWorkLogVC.delegate = self;
    newWorkLogVC.loglist = list;
    if (_employeeString.length > 0) {
        newWorkLogVC.typeString = @"1";
    }
    
    
    [self.navigationController pushViewController:newWorkLogVC animated:YES];
    
}


-(void)readData {
    
    
    NSString *userString = [[NSString alloc]init];
    NSString *userID = [JCTokenManager getUserID];

    if (_employeeString.length >0) {
        userString = _employeeString;
    }else {
        userString = userID;
    }
    
    JCRequest_readWorklog *request = [[JCRequest_readWorklog alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"uid":userString,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readWorklog *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_WorkLogBase *base  = [[JCModel_WorkLogBase alloc]initWithDictionary:dic];
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@"%@",_dataArray);
        
    } failure:^(__kindof JCRequest_readWorklog *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)buttonAction {
    
    if (_dataArray.count > 0) {
        JCModel_WorkLogList *list = _dataArray[0];
        //先判断是否是今天的日志
        
        NSString *string = [list.day substringToIndex:8];
        //获取系统当前时间
        NSDate *currentDate = [NSDate date];
        //用于格式化NSDate对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设置格式：zzz表示时区
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        //NSDate转NSString
        NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
        
        if (string == currentDateString) {
            //已经有了今天的日志，去继续日志。
            JCModel_WorkLogList *list = _dataArray[0];
            
            NewWorkLogViewController *newWorkLogVC =[[NewWorkLogViewController alloc]init];
            newWorkLogVC.delegate = self;
            newWorkLogVC.loglist = list;
            [self.navigationController pushViewController:newWorkLogVC animated:YES];
            
        }else{
            NewWorkLogViewController *newWorkLogVC =[[NewWorkLogViewController alloc]init];
            newWorkLogVC.delegate = self;
            [self.navigationController pushViewController:newWorkLogVC animated:YES];
        }
    }else {
        NewWorkLogViewController *newWorkLogVC =[[NewWorkLogViewController alloc]init];
        newWorkLogVC.delegate = self;
        [self.navigationController pushViewController:newWorkLogVC animated:YES];
    }
    
    
}
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
          JCModel_WorkLogList *list = _dataArray[indexPath.row];
        
        JCRequest_DeleteWorkLog *request = [[JCRequest_DeleteWorkLog alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
     
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":list.listIdentifier,
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_readWorklog *request) {
            //
            NSLog(@"成功");
            
            [self readData];
            
        } failure:^(__kindof JCRequest_readWorklog *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


-(void)newWorklogSuceess {
    
    [self readData];
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
