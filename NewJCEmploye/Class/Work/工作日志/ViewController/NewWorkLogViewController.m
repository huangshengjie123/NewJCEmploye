//
//  NewWorkLogViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewWorkLogViewController.h"
#import "Macro.h"
#import "FSTextView.h"
#import "NewWorkLogTableViewCell.h"
#import "MMAlertView.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "JCRequest_searchWorklog.h"

@interface NewWorkLogViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) FSTextView *conclusionTextView;
@property (nonatomic,strong) FSTextView *planTextView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation NewWorkLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新建工作日志";
    self.view.backgroundColor = JCBackgroundColor;
    
    
    
    
    [self addViews];
    
    if ( _loglist != nil) {
        //如果有 则是查询日志
        _dataArray = _loglist.dailyLog.logRows.mutableCopy;
        
        _conclusionTextView.text = _loglist.dailyLog.summary;
        
        _planTextView.text = _loglist.dailyLog.nextPlan;
        
        self.title = @"工作日志";
    }
}

-(void)addViews {
    _dataArray = [NSMutableArray arrayWithCapacity:20];
    
    if (![_typeString  isEqual: @"1"]) {
        UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        informationCardBtn.tag = 1;
        [informationCardBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
        [informationCardBtn sizeToFit];
        
        UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        informationCardBtn2.tag = 2;
        [informationCardBtn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn2 setTitle:@"确定" forState:UIControlStateNormal];
        [informationCardBtn2 setTitleColor:JCColorBlue forState:UIControlStateNormal];
        
        [informationCardBtn2 sizeToFit];
        
        
        UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
        UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
        
        self.navigationItem.rightBarButtonItems  = @[informationCardItem2,informationCardItem];
    }
    
  

    
    _conclusionTextView = [[FSTextView alloc]init];
    _conclusionTextView.placeholder = @"填写入一天的工作总结(可后补)";
    [self.view addSubview:_conclusionTextView];
    [_conclusionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@(100));
    }];
    
    _planTextView = [[FSTextView alloc]init];
    _planTextView.placeholder = @"填写明天的工作计划(可后补)";
    [self.view addSubview:_planTextView];
    [_planTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_conclusionTextView.mas_top).offset(-8);
        make.height.equalTo(@(60));
    }];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.bottom.equalTo(_planTextView.mas_top).offset(-8);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
   
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"NewWorkLogTableViewCell";
    // 1.缓存中取
    NewWorkLogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewWorkLogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    JCModel_WorkLogLogRows *logRow = _dataArray[indexPath.row];

    cell.timeLabel.text = logRow.time;
    cell.contentLabel.text = logRow.row;
    
    
    return  cell;
    
}


// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}



-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1) {
        
        MMAlertView *view = [[MMAlertView alloc] initWithInputTitle:@"填写工作内容" detail:@"" placeholder:@"" handler:^(NSString *text) {
            
            JCModel_WorkLogLogRows *logRow = [[JCModel_WorkLogLogRows alloc]init];
            
            
            //获取系统当前时间
            NSDate *currentDate = [NSDate date];
            //用于格式化NSDate对象
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //设置格式：zzz表示时区
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            //NSDate转NSString
            NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
            
            logRow.time = currentDateString;
            logRow.row = text;
            
            [_dataArray addObject:logRow];
            
            [_tableView reloadData];
        }];
        
        [view show];
        
    }
    
    if (button.tag  == 2 && _loglist != nil ) {
        //修改工作日志
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@dailyLog/updateDailyLogStoreById.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        if (_dataArray.count == 0) {
            [self showInfo:@"至少写一个计划"];
            return;
        }
        
        JCModel_updateWorklogBase *base = [[JCModel_updateWorklogBase alloc]init];
        JCModel_updateWorklogDailyLog *dailyLog = [[JCModel_updateWorklogDailyLog alloc]init];
        dailyLog.nextPlan = _planTextView.text;
        dailyLog.summary = _conclusionTextView.text;
        dailyLog.logRows = _dataArray;
        base.dailyLog = dailyLog;
        JCModel_updateWorklogDailyLogStore *logStore = [[JCModel_updateWorklogDailyLogStore alloc]init];
        logStore.dailyLogStoreIdentifier = _loglist.listIdentifier;
        base.dailyLogStore = logStore;
        
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                
                
                if ([result  isEqual: @"success"] ) {
                    
                    [self.delegate newWorklogSuceess];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                
                NSLog(@"成功%@",dic);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
        
    
    
    if (button.tag  == 2 && _loglist == nil ) {
        //确定创建
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@dailyLog/createDailyLogStore.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        if (_dataArray.count == 0) {
            [self showInfo:@"至少写一个计划"];
            return;
        }
        
        JCModel_NewWorkLogUPBase *base = [[JCModel_NewWorkLogUPBase alloc]init];
        JCModel_NewWorkLogUPDailyLog *dailyLog = [[JCModel_NewWorkLogUPDailyLog alloc]init];
        dailyLog.nextPlan = _planTextView.text;
        dailyLog.summary = _conclusionTextView.text;
        dailyLog.logRows = _dataArray;
        base.dailyLog = dailyLog;
    
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                
                
                if ([result  isEqual: @"success"] ) {
                    
                    [self.delegate newWorklogSuceess];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                
                NSLog(@"成功%@",dic);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
        
        
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
