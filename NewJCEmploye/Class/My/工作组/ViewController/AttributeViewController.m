//
//  AttributeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "AttributeViewController.h"
#import "Macro.h"
#import "WorkDataTableViewCell.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "SGActionView.h"
#import "SalesdataTableViewCell.h"
#import "ProbationViewController.h"
#import "SellViewController.h"
@interface AttributeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UIButton *timButton;
@property (nonatomic,strong) UITextField *longTextField;
@property (nonatomic,strong) UIView *midView;
@property (nonatomic,strong) UIView *topView;

@end

@implementation AttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _titleString;
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    
    UIView *topView  = [[UIView alloc]init];
    topView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(50));
        make.top.equalTo(self.view).offset(JCNew64 +20);
    }];
    _topView = topView;
    
    UILabel *label = [[UILabel alloc]init];
    label.font = JCFont16;
    label.text = @"统计类别:";
    label.textColor = JCColorBlack;
    [topView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(5);
        make.top.equalTo(topView).offset(5);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"日" forState:UIControlStateNormal];
    button.titleLabel.font = JCFont14;
    button.backgroundColor = JCColorWithe;
    [button setTitleColor:JCColorBlue forState:UIControlStateNormal];
    [topView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(label.mas_right).offset(5);
        make.width.equalTo(@(40));
        make.height.equalTo(@(25));
    }];
    [button addTarget:self action:@selector(buttonActon2) forControlEvents:UIControlEventTouchUpInside];
    _timButton = button;
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.font = JCFont16;
    label2.text = @"统计长度:";
    label2.textColor = JCColorBlack;
    [topView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(button.mas_right).offset(20);
    }];
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.text = @"30";
    textfield.textColor = JCColorBlue;
    textfield.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:textfield];
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label2);
        make.left.equalTo(label2.mas_right).offset(5);
        make.width.equalTo(@(40));
        make.height.equalTo(@(25));
    }];
    _longTextField = textfield;
    textfield.keyboardType = UIKeyboardTypeNumberPad;
    //设置边框的颜色
    [textfield.layer setBorderColor:JCColorBlack.CGColor];
    
    //设置边框的粗细
    [textfield.layer setBorderWidth:1.0];
    
   
    
//    button.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);//设置边框颜色
//    button.layer.borderWidth = 1.0f;//设置边框颜色
    
    //设置边框的颜色
    [button.layer setBorderColor:JCColorBlack.CGColor];
    
    //设置边框的粗细
    [button.layer setBorderWidth:1.0];
    
    [topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(label);
        make.right.equalTo(textfield);
        make.height.equalTo(@(80));
        make.top.equalTo(self.view).offset(JCNew64 +20);
    }];
    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [topView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView);
        make.right.equalTo(topView);
        make.bottom.equalTo(topView);
        make.height.equalTo(@(33));
    }];
    [button1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *buttonLabel = [[UILabel alloc]init];
    buttonLabel.textColor = JCColorWithe;
    buttonLabel.font = JCFont15;
    buttonLabel.text = @"确定查询";
    [topView addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button1);
    }];
    
  
    if ([_titleString  isEqual: @"试用报表"]) {
        [self addMidView];
    }
    
    if ([_titleString  isEqual: @"销售报表"]) {
        [self addMidView2];
    }
    
   
}

-(void)addMidView {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = JCColorWithe;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(35));
        make.top.equalTo(_topView.mas_bottom).offset(10);
    }];
    view.translatesAutoresizingMaskIntoConstraints= NO;
    
    
    UILabel *nameLabel1 = [[UILabel alloc]init];
    nameLabel1.text = @"时间";
    nameLabel1.textColor = JCColorBlack;
    nameLabel1.font = JCFont14;
    [view addSubview:nameLabel1];
    [nameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.centerY.equalTo(view);
    }];
    
    UILabel *nameLabel2 = [[UILabel alloc]init];
    nameLabel2.text = @"试用数";
    nameLabel2.textColor = JCColorBlack;
    nameLabel2.font = JCFont14;
    [view addSubview:nameLabel2];
    [nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (view.mas_centerX).offset(-40);
        make.centerY.equalTo(view);
    }];
    
    UILabel *nameLabel5 = [[UILabel alloc]init];
    nameLabel5.text = @"试用中";
    nameLabel5.textColor = JCColorBlack;
    nameLabel5.font = JCFont14;
    [view addSubview:nameLabel5];
    [nameLabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.centerX.equalTo(view);
    }];
    
    
    UILabel *nameLabel3= [[ UILabel alloc]init];
    nameLabel3.text = @"成交数";
    nameLabel3.textColor = JCColorBlack;
    nameLabel3.font = JCFont14;
    [view addSubview:nameLabel3];
    [nameLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_centerX).offset(45);
        make.centerY.equalTo(view);
    }];
    
    UILabel *nameLabel4 = [[UILabel alloc]init];
    nameLabel4.text = @"比率";
    nameLabel4.textColor = JCColorBlack;
    nameLabel4.font = JCFont14;
    [view addSubview:nameLabel4];
    [nameLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_right).offset(-30);
        make.centerY.equalTo(view);
    }];
    
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(@(JCScreen_Width -20));
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(view.mas_bottom).offset(10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

//销售报表界面
-(void)addMidView2 {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = JCColorWithe;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(35));
        make.top.equalTo(_topView.mas_bottom).offset(10);
    }];
    view.translatesAutoresizingMaskIntoConstraints= NO;
    
    
    UILabel *nameLabel1 = [[UILabel alloc]init];
    nameLabel1.text = @"时间";
    nameLabel1.textColor = JCColorBlack;
    nameLabel1.font = JCFont14;
    [view addSubview:nameLabel1];
    [nameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.centerY.equalTo(view);
    }];
    
    
    UILabel *namelabel5 = [[UILabel alloc]init];
    namelabel5.text = @"单数";
    namelabel5.textColor = JCColorBlack;
    namelabel5.font = JCFont14;
    [view addSubview:namelabel5];
    [namelabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel1.mas_right).offset(20);
        make.centerY.equalTo(view);
    }];
    
    
    UILabel *nameLabel2 = [[UILabel alloc]init];
    nameLabel2.text = @"总价";
    nameLabel2.textColor = JCColorBlack;
    nameLabel2.font = JCFont14;
    [view addSubview:nameLabel2];
    [nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (view.mas_centerX).offset(-5);
        make.centerY.equalTo(view);
    }];
    
    UILabel *nameLabel3= [[ UILabel alloc]init];
    nameLabel3.text = @"实收";
    nameLabel3.textColor = JCColorBlack;
    nameLabel3.font = JCFont14;
    [view addSubview:nameLabel3];
    [nameLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_centerX).offset(25);
        make.centerY.equalTo(view);
    }];
    
    UILabel *nameLabel4 = [[UILabel alloc]init];
    nameLabel4.text = @"比率";
    nameLabel4.textColor = JCColorBlack;
    nameLabel4.font = JCFont14;
    [view addSubview:nameLabel4];
    [nameLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_right).offset(-30);
        make.centerY.equalTo(view);
    }];
    
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(@(JCScreen_Width -20));
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(view.mas_bottom).offset(10);
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

  
    
    if ([_titleString  isEqual: @"试用报表"]) {
        
        static NSString *identifier = @"WorkDataTableViewCell";
        // 1.缓存中取
        WorkDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[WorkDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_PersonalInfoDData *data = _dataArray[indexPath.row];
        cell.contentLabel1.text = data.cycleUnit;//
        cell.contentLabel1.textColor = JCColorMidGray;

        cell.contentLabel2.text = [NSString stringWithFormat:@"%d",(int)data.probationSum];
        cell.contentLabel3.text = [NSString stringWithFormat:@"%d",(int)data.dealSum];
        cell.contentLabel5.text =[NSString stringWithFormat:@"%d",(int)data.probationOnSum];
        cell.contentLabel4.text = [NSString stringWithFormat:@"%.2f%%",data.dealPercent * 100];
        return cell;
    }
    
    if ([_titleString  isEqual: @"销售报表"]) {
        
        static NSString *identifier = @"SalesdataTableViewCell";
        // 1.缓存中取
        SalesdataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[SalesdataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_SalesStatisticsInfoData *data = _dataArray[indexPath.row];
        cell.contentLabel1.text =data.cycleUnit;//]
        cell.contentLabel1.textColor = JCColorMidGray;
        cell.contentLabel5.text = [NSString stringWithFormat:@"%d/%d",(int)data.count,(int)data.total];
        cell.contentLabel2.text = [NSString stringWithFormat:@"%d",(int)data.amountSum ];
        cell.contentLabel3.text = [NSString stringWithFormat:@"%d",(int)data.getAmountSum];
        cell.contentLabel4.text = [NSString stringWithFormat:@"%.3f%%",data.getPercent * 100];
        return cell;
    }
   
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_titleString  isEqual: @"试用报表"])
    {
        JCModel_PersonalInfoDData *data = _dataArray[indexPath.row];

        ProbationViewController *vc = [[ProbationViewController alloc]init];
        vc.allNum = (int)data.probationSum;
        vc.uID = [NSString stringWithFormat:@"%d",(int)_userIdString];
        if ([_timButton.titleLabel.text isEqualToString:@"月"])
        {
            vc.cycleSring  = @"MONTH";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"周"])
        {
             vc.cycleSring= @"WEEK";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"日"])
        {
            vc.cycleSring = @"DAY";
        }
        
        if ([_timButton.titleLabel.text isEqualToString:@"日"])
        {
            NSMutableString *str = [[NSMutableString alloc]initWithString:data.cycleUnit];
            [str insertString:@"-" atIndex:4];
            
            [str insertString:@"-" atIndex:7];
            
            vc.time = str;
        }
        
        if ([_timButton.titleLabel.text isEqualToString:@"周"])
        {
            vc.time = data.cycleUnit;
        }
        
        if ([_timButton.titleLabel.text isEqualToString:@"月"])
        {
            NSMutableString *str = [[NSMutableString alloc]initWithString:data.cycleUnit];
            [str insertString:@"-" atIndex:4];
            vc.time = str;
        }
      
        vc.isAll = _isALL;
        vc.sring = @"工作组统计";
        vc.gID = _workGroupIdString;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
      if ([_titleString  isEqual: @"销售报表"])
      {
            JCModel_SalesStatisticsInfoData *data = _dataArray[indexPath.row];
            SellViewController *vc = [[SellViewController alloc]init];
          
            vc.allNum = (int)data.total;
            vc.uID = [NSString stringWithFormat:@"%d",(int)_userIdString];

          if ([_timButton.titleLabel.text isEqualToString:@"月"])
          {
              vc.cycleSring  = @"MONTH";
          }
          if ([_timButton.titleLabel.text isEqualToString:@"周"])
          {
              vc.cycleSring= @"WEEK";
          }
          if ([_timButton.titleLabel.text isEqualToString:@"日"])
          {
              vc.cycleSring = @"DAY";
          }
          
          if ([_timButton.titleLabel.text isEqualToString:@"日"])
          {
              NSMutableString *str = [[NSMutableString alloc]initWithString:data.cycleUnit];
              [str insertString:@"-" atIndex:4];
              
              [str insertString:@"-" atIndex:7];
              
              vc.time = str;
          }
          
          if ([_timButton.titleLabel.text isEqualToString:@"周"])
          {
              vc.time = data.cycleUnit;
          }
          
          if ([_timButton.titleLabel.text isEqualToString:@"月"])
          {
              NSMutableString *str = [[NSMutableString alloc]initWithString:data.cycleUnit];
              [str insertString:@"-" atIndex:4];
              vc.time = str;
          }
          
          vc.sring = @"工作组统计";
          vc.isAll = _isALL;
          vc.gID = _workGroupIdString;


          [self.navigationController pushViewController:vc animated:YES];
      }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonActon2 {
    
    NSArray *array = @[@"月",@"周",@"日"];
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择查询时间类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        [_timButton setTitle:array[index] forState:UIControlStateNormal];
        
    }];
    
}


-(void)buttonAction {
    
    if ([_titleString  isEqual: @"试用报表"]) {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@report/getProbationStatistic.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        
        JCModel_QueryPersonalInfoBase *base = [[JCModel_QueryPersonalInfoBase alloc]init];
        if ([_timButton.titleLabel.text isEqualToString:@"月"]) {
            base.cycle = @"MONTH";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"周"]) {
            base.cycle = @"WEEK";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"日"]) {
            base.cycle = @"DAY";
        }
        
        
        base.cycleNum = _longTextField.text;
        
        if (_isALL == YES) {
            base.groupId = _workGroupIdString;
            
        }else {
            base.uid = _userIdString;
            base.groupId = _workGroupIdString;
        }
        
      
        
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
                
                NSString *jsonString =  [self dictionaryToJson:dic];
                if ([result  isEqual: @"success"] ) {
                    
                    JCModel_PersonalInfoDBase *base = [[JCModel_PersonalInfoDBase alloc]initWithDictionary:dic];
                    
                    _dataArray = base.data;
                    [_tableView reloadData];
                }
                
                NSLog(@"成功%@",jsonString);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    if ([_titleString  isEqual: @"销售报表"]) {
       
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@report/getSaleOrderStatistic.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典

        JCModel_QueryPersonalInfoBase *base = [[JCModel_QueryPersonalInfoBase alloc]init];
        if ([_timButton.titleLabel.text isEqualToString:@"月"]) {
            base.cycle = @"MONTH";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"周"]) {
            base.cycle = @"WEEK";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"日"]) {
            base.cycle = @"DAY";
        }
        
        
        base.cycleNum = _longTextField.text;
        
        if (_isALL == YES) {
            base.groupId = _workGroupIdString;
            
        }else {
            base.uid = _userIdString;
            base.groupId = _workGroupIdString;
        }
        
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
                
                NSString *jsonString =  [self dictionaryToJson:dic];
                if ([result  isEqual: @"success"] ) {
                    
                    JCModel_SalesStatisticsInfoBase *base = [[JCModel_SalesStatisticsInfoBase alloc]initWithDictionary:dic];
                    
                    _dataArray = base.data;
                    [_tableView reloadData];
                }
                
                NSLog(@"成功%@",jsonString);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    if ([_titleString  isEqual: @"销售报表"] && _isALL == YES) {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@report/getSaleOrderStatistic.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典

        JCModel_seachModelData2Base *base = [[JCModel_seachModelData2Base alloc]init];
        if ([_timButton.titleLabel.text isEqualToString:@"月"]) {
            base.cycle = @"MONTH";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"周"]) {
            base.cycle = @"WEEK";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"日"]) {
            base.cycle = @"DAY";
        }
        
        
        base.cycleNum = _longTextField.text;
        
      
        base.groupId = _workGroupIdString;
            
      
        
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
                
                NSString *jsonString =  [self dictionaryToJson:dic];
                if ([result  isEqual: @"success"] ) {
                    
                    JCModel_SalesStatisticsInfoBase *base = [[JCModel_SalesStatisticsInfoBase alloc]initWithDictionary:dic];
                    
                    _dataArray = base.data;
                    [_tableView reloadData];
                }
                
                NSLog(@"成功%@",jsonString);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    if ([_titleString  isEqual: @"试用报表"] && _isALL == YES ) {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@report/getProbationStatistic.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        
        JCModel_seachModelData2Base *base = [[JCModel_seachModelData2Base alloc]init];
        if ([_timButton.titleLabel.text isEqualToString:@"月"]) {
            base.cycle = @"MONTH";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"周"]) {
            base.cycle = @"WEEK";
        }
        if ([_timButton.titleLabel.text isEqualToString:@"日"]) {
            base.cycle = @"DAY";
        }
        
        
        base.cycleNum = _longTextField.text;
        
        
            base.groupId = _workGroupIdString;
            
     
        
        
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
                
                NSString *jsonString =  [self dictionaryToJson:dic];
                if ([result  isEqual: @"success"] ) {
                    
                    JCModel_PersonalInfoDBase *base = [[JCModel_PersonalInfoDBase alloc]initWithDictionary:dic];
                    
                    _dataArray = base.data;
                    [_tableView reloadData];
                }
                
                NSLog(@"成功%@",jsonString);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
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
