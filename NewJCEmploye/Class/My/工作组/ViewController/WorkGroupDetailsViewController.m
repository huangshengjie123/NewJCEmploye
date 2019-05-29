//
//  WorkGroupDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupDetailsViewController.h"
#import "Macro.h"
#import "JCRequest_searchWorkGroupData.h"
#import "MembersTableViewCell.h"
#import "SGActionView.h"
#import "AttributeViewController.h"
#import "WorkLogViewController.h"
#import "ProbationViewController.h"
#import "SellViewController.h"
#import "BeyondbacklogViewController.h"
#import "WaterCardViewController.h"
#import "WorkGroupSeletedViewController.h"
#import "NewWorkGroupViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "MyCustomerViewController.h"
#import "WarningViewController.h"
#import "ProbationCustomViewController.h"
#import "DealerBaseViewController.h"
#import "MyItemsViewController.h"
#import "JCRequest_addGroupObserver.h"
#import "JCRequest_getGroupObservers.h"
#import "WorkGroupSearchToolViewController.h"


@interface WorkGroupDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,NewMyGroupDelegate>

//qibuxinren3

@property (nonatomic,strong) UILabel *workGroupNameLabel;
@property (nonatomic,strong) UILabel *workGroupTypeLabel;
@property (nonatomic,strong) UIView  *midView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *workGroupArray;
@property (nonatomic,strong) UILabel     *remakeLabel; //备注

@property (nonatomic,strong) UITableView *tableView2;// 显示子工作组
@property (nonatomic,strong) UITableView *tableView3;// 显示观察员列表

@property (nonatomic,strong) NSArray      *dataArray;
@property (nonatomic,strong) NSArray      *dataArray2;

@property (nonatomic,strong) NSString     *buttonSring;//按钮选择哪个
@property (nonatomic,strong) NSArray      *dataArray3;//观察员数组
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView       *remakeView;//
@property (nonatomic,assign) BOOL         isLeader; //是观察？
@property (nonatomic,assign) BOOL         isAssistant; //是观察？


@end

@implementation WorkGroupDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"工作组详情";
    self.view.backgroundColor = JCBackgroundColor;
    if (_isHaveLeader == YES)
    {
        _isLeader = YES;
    }
    if (_ishaveAssistant == YES)
    {
        _isAssistant = YES;
    }
    
    [self addViews];
    [self readData];
    [self readParent];
    [self readNewTableViewData];
    
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(40));
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    
    _workGroupNameLabel = [[UILabel alloc]init];
    _workGroupNameLabel.font = JCFont14;
    _workGroupNameLabel.textColor = JCColorBlack;
    [topView addSubview:_workGroupNameLabel];
    [_workGroupNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.centerY.equalTo(topView);
    }];
    
    _workGroupTypeLabel = [[UILabel alloc]init];
    _workGroupTypeLabel.font = JCFont14;
    _workGroupTypeLabel.textColor = JCColorBlack;
    [topView addSubview:_workGroupTypeLabel];
    [_workGroupTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(-10);
        make.centerY.equalTo(topView);
    }];
    
    //数据
    _workGroupNameLabel.text = _workGrouplist.name;
    _workGroupTypeLabel.text = [JCTool conversionWorkGroup:_workGrouplist.type];

    _midView = [[UIView alloc]init];
    _midView.backgroundColor = JCColorWithe;
    [self.view addSubview:_midView];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.height.equalTo(@(30));
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorMidGray;
    label.font = JCFont14;
    label.text = @"组员:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(_midView.mas_top).offset(10);
    }];
    
    [self addTableView3];
    NSString *string = [JCTokenManager getUserID];
    if (_isBeyoud ==  YES)
    {
        //如果是超期待办跳过来 就不添加任何按钮
    }
    else
    {
        //如果工作组是自己
        if (_workGrouplist.owner == string.doubleValue && _workGrouplist.groupRelations.count != 0 &&_isHoom != YES)
        {
            [self addGroupRelationsButton];
            UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [informationCardBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
            informationCardBtn.tag = 1;
            [informationCardBtn sizeToFit];
            UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
            self.navigationItem.rightBarButtonItems  = @[informationCardItem];
            _isLeader = YES;
        }
        if ( _isHoom == YES  && _workGrouplist.groupRelations.count != 0)
        {
            
        }
        if ( _isHoom == YES  && _workGrouplist.groupRelations.count == 0)
        {
            float w = (JCScreen_Width - 20 * 3) / 2;
            //添加两个button
            UIButton *button1  = [[UIButton alloc]init];
            button1.backgroundColor = JCColorBlue;
            [self.view addSubview:button1];
            [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(20);
                make.width.equalTo(@(w));
                make.bottom.equalTo(self.view).offset(-20);
                make.height.equalTo(@(44));
            }];
            UILabel *label1 = [[UILabel alloc]init];
            label1.text = @"取消创建";
            label1.textColor = JCColorWithe;
            [button1 addSubview:label1];
            [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.centerY.equalTo(button1);
            }];
            button1.tag = 4;
            [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *button2 = [[UIButton alloc]init];
            button2.backgroundColor = JCColorBlue;
            [self.view addSubview:button2];
            [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.view).offset(-20);
                make.width.equalTo(@(w));
                make.bottom.equalTo(self.view).offset(-20);
                make.height.equalTo(@(44));
            }];
            button2.tag = 5;
            [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel *label2 = [[UILabel alloc]init];
            label2.text = @"添加组员";
            label2.textColor = JCColorWithe;
            [button2 addSubview:label2];
            [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.centerX.equalTo(button2);
            }];
            
            button1.layer.masksToBounds = YES;
            button1.layer.cornerRadius = 3;
            button2.layer.masksToBounds = YES;
            button2.layer.cornerRadius = 3;
        }
    }
}

-(void)buttonAction:(UIButton*)button {
    
    if (button.tag == 0)
    {
        WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 1)
    {
        NewWorkGroupViewController *vc = [[NewWorkGroupViewController alloc]init];
        vc.dataArray = _dataArray;
        vc.workGrouplist = _workGrouplist;
        [self.navigationController pushViewController:vc animated:YES];
    }
      if (button.tag == 2)
      {
      //拒绝
          LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
          NSString *token = [JCTokenManager getToken];
          NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealWorkGroupJoin.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
          // 请求参数字典
          JCModel_AgreedJoinGroupBase *base = [[JCModel_AgreedJoinGroupBase alloc]init];
          
          base.command = @"next";
          base.current = @"group_join_check";
          base.type = @"pull";
          base.taskId = _taskIDstring;
          base.isJoinCheckPass = @"false";
          JCModel_AgreedJoinGroupWorkGroup *workGroup = [[JCModel_AgreedJoinGroupWorkGroup alloc]init];
          workGroup.workGroupIdentifier = _workGrouplist.listIdentifier;
          base.workGroup = workGroup;
          NSDictionary *params = base.dictionaryRepresentation;
//          NSLog(@"%@",params);
          AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
          manager.responseSerializer = [AFHTTPResponseSerializer serializer];
          NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
          request.timeoutInterval = 10.f;
          [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
          [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
          
          NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
              if (!error) {
                  
                  NSArray *responseDictionary = (NSArray *)responseObject;
                  //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                  NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                  NSString *result = [dic objectForKey:@"result"];
                  NSString *msg = [dic objectForKey:@"msg"];
                  if ([result isEqualToString:@"success"])
                  {
                      //下一步成功  刷新出 成交 和未成交 按钮
                      [self showInfo:@"拒绝成功"];
                  }
                  else
                  {
                      MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                      [self.view addSubview:hud];
                      hud.label.text =msg;
                      hud.mode = MBProgressHUDModeText;
                      [hud showAnimated:YES];
                      [hud hideAnimated:YES afterDelay:1];
                      
                  }
              } else {
                  NSLog(@"请求失败error=%@", error);
              }
          }];
          
          [task resume];

      }
    
    if (button.tag == 3)
    {
        //同意加入
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealWorkGroupJoin.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        // 请求参数字典
        JCModel_AgreedJoinGroupBase *base = [[JCModel_AgreedJoinGroupBase alloc]init];
        base.command = @"next";
        base.current = @"group_join_check";
        base.type = @"pull";
        base.taskId = _taskIDstring;
        base.isJoinCheckPass = @"true";
        JCModel_AgreedJoinGroupWorkGroup *workGroup = [[JCModel_AgreedJoinGroupWorkGroup alloc]init];
        workGroup.workGroupIdentifier = _workGrouplist.listIdentifier;
        base.workGroup = workGroup;
        NSDictionary *params = base.dictionaryRepresentation;
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
        request.timeoutInterval = 10.f;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"])
                {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    [self showInfo:@"同意成功"];
                }
                else
                {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    if (button.tag == 4) {
        //取消创建
        
    }
    
    if (button.tag == 5) {
        //确认创建并拉人
        
        WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
        vc.delegate = self;
        vc.ismMultiselect = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    if (button.tag == 6)
    {
        //添加观察者

        NSArray *array = @[@"添加观察者",@"添加销售助理"];
        [SGActionView showSheetWithTitle:@"选择要添加的身份" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
         
            if (index == 0)
            {
                _buttonSring = @"添加观察者";
                WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
                vc.delegate = self;
                vc.ismMultiselect = NO;
                [self.navigationController pushViewController:vc animated:YES];
            }
            
            if (index == 1)
            {
                _buttonSring = @"添加销售助理";
                WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
                vc.delegate = self;
                vc.ismMultiselect = NO;
                [self.navigationController pushViewController:vc animated:YES];
            }
            
        }];
        
    }
}

-(void)addremakeView  {
    
    _remakeView = [[UIView alloc]init];
    _remakeView.backgroundColor = JCColorWithe;
    [self.view addSubview:_remakeView];
    [_remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"备注:";
    label4.font = JCFont14;
    label4.textColor = JCColorBlack;
    [_remakeView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_remakeView).offset(10);
        make.top.equalTo(_remakeView).offset(10);
    }];
    
    _remakeLabel = [[UILabel alloc]init];
    if ([_workGrouplist.listDescription  isEqual:@""]  || _workGrouplist.listDescription == nil )
    {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;
        
    }
    else
    {
        _remakeLabel.text = _workGrouplist.listDescription;
    }
    _remakeLabel.font = JCFont14;
    _remakeLabel.textColor = JCColorBlack;
    _remakeLabel.numberOfLines = 0;
    [_remakeView addSubview:_remakeLabel];
    [_remakeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.right.equalTo(_remakeView.mas_right).offset(-10);
        make.top.equalTo(label4);
    }];
    
    [_remakeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
        make.bottom.equalTo(_remakeLabel.mas_bottom).offset(10);
    }];
}

//添加 继续添加成员的组员
-(void)addGroupRelationsButton {
    
    CGFloat w = (JCScreen_Width -30)/2;
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 0;
    UILabel *label = [[UILabel alloc]init];
    label.text = @"继续添加成员";
    label.font = JCFont14;

    label.textColor = JCColorWithe;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    button2.tag = 6;
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"添加观察者/助理";
    label2.font = JCFont14;
    label2.textColor = JCColorWithe;
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button2);
    }];
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 4.0f;
    
}

-(void)addTableView {
 
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        self.tableView.rowHeight = 35;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_tableView3.mas_bottom).offset(0);
//            make.height.equalTo(@(_dataArray.count * (30)));
            make.bottom.equalTo(self.view).offset (-100);

        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tag = 1;
}

-(void)addTableView2 {
    
    self.tableView2 = [[UITableView alloc]init];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.backgroundColor = JCColorWithe;
    self.tableView2.rowHeight = 35;
    [self.view addSubview:self.tableView2];
    [self.tableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_tableView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view).offset (40);
    }];
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView2.tag = 2 ;
    
//    self.tableView2.scrollEnabled=NO;
}

-(void)addTableView3 {
    
    self.tableView3 = [[UITableView alloc]init];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    self.tableView3.backgroundColor = JCColorWithe;
    self.tableView3.rowHeight = 35;
    self.tableView3.sectionHeaderHeight= 0;
    [self.view addSubview:self.tableView3];
    [self.tableView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_midView.mas_bottom);
        make.height.equalTo(@(_dataArray3.count * (30)));

    }];
    self.tableView3.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView3.tag = 3 ;
    
    
    [self addTableView];
//
    [self addremakeView];
//
//    [self addTableView2];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
  if (tableView.tag == 3)
  {
       NSString *string = [JCTokenManager getUserID];
      
      for (int i = 0; i < _dataArray3.count; i++)
      {
          JCModel_GroupObservers2Data *data = _dataArray3[i];
          NSLog(@"data:::::::::::%@",data);
          if (string.doubleValue == data.number && data.type == 1)
          {
              _isLeader = YES;
          }
          
          if (string.doubleValue == data.number && data.type == 2)
          {
              _isAssistant = YES;
          }
      }
         return _dataArray3.count;
    }
  else
  {
        if (section == 0)
        {
            // 组员
            return _dataArray.count;
        }
        else
        {
            return _dataArray2.count;
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if (tableView.tag== 3)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1)
    {

        if (indexPath.section == 1)
        {
            static NSString *identifier = @"WorkGroupTableViewCell";
            WorkGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell = [[WorkGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            JCModel_WorkGroupList *list = _dataArray2[indexPath.row];
            cell.titelLabel.text = list.name;
            
            //组长或者观察员的权限
            if (_isLeader == YES)
            {
                if ([[JCTool conversionWorkGroup:list.type] isEqualToString:@"销售组"]) {
                    cell.button.hidden = NO;
                    [cell.button addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
                    cell.button.tag = indexPath.row;
                }
                
            }
            else
            {
                cell.button.hidden = YES;
            }
            
            //助理的权限
            if (_isAssistant == YES)
            {
                if ([[JCTool conversionWorkGroup:list.type] isEqualToString:@"销售组"])
                {
                    cell.button.hidden = NO;
                    [cell.button addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
                    cell.button.tag = indexPath.row;
                }
                
            }
            else
            {
                cell.button.hidden = YES;
                
            }
            
            cell.categoryLabel.text =[JCTool conversionWorkGroup:list.type];
            return cell;
        }
        else
        {
            static NSString *identifier = @"MembersTableViewCell";
            MembersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (cell == nil)
            {
                cell = [[MembersTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            JCModel_WorkGroupGroupRelations *workGroupRelations = _dataArray[indexPath.row];
            
            cell.titleLabel.text = workGroupRelations.name;
            if (_workGrouplist.owner == workGroupRelations.number)
            {
                cell.mainLabel.text = @"组长";
            }
            
            
            if (_isLeader == YES)
            {
                UIButton *button = [[UIButton alloc]init];
                button = cell.button;
                button.tag = (int)indexPath.row;
                [button addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            else
            {
                cell.button.hidden = YES;
            }
            
            if ([[JCTokenManager getUserType] isEqualToString:@"admin"])
            {
                cell.button.hidden = NO;
                UIButton *button = [[UIButton alloc]init];
                button = cell.button;
                button.tag = (int)indexPath.row;
                [button addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            return cell;
        }
       
        
    }
    else
    {
        static NSString *identifier = @"WorkGroupTableViewCell";
        WorkGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil)
        {
            cell = [[WorkGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        JCModel_GroupObservers2Data *data = _dataArray3[indexPath.row];
        
        if (data.type == 1)
        {
            cell.titelLabel.text = [NSString stringWithFormat:@"观察者:  %@",data.name];
            cell.titelLabel.font = JCFont14;
        }
        
       if (data.type == 2)
       {
            cell.titelLabel.text = [NSString stringWithFormat:@"销售助理:  %@",data.name];
            cell.titelLabel.font = JCFont14;
        }
        return cell;
    //bushu 5725
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@":::::::::::%ld",indexPath.section);
    
    if (tableView.tag == 1 && indexPath.section == 1)
    {
        
        WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
        JCModel_WorkGroupList *list = _dataArray2[indexPath.row];
        workGroupDetailsVC.workGrouplist = list;
        if (_isAssistant == YES)
        {
            workGroupDetailsVC.ishaveAssistant = YES;
        }
        
        if (_isLeader == YES)
        {
            workGroupDetailsVC.isHaveLeader = YES;
        }
        
        [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
    }
    else
    {
//
//        NSLog(@"_dataArray2::::::::::%@",_dataArray2);
//        WorkGroupDetailsViewController *workGroupDetailsVC = [[WorkGroupDetailsViewController alloc]init];
//        JCModel_WorkGroupList *list = _dataArray2[indexPath.row];
//        workGroupDetailsVC.workGrouplist = list;
//        workGroupDetailsVC.isHaveLeader = YES;
//        NSLog(@"_dataArray2::::::::::%@",_dataArray2);
//        NSLog(@"list::::::::::%@",list);
//
//        [self.navigationController pushViewController:workGroupDetailsVC animated:YES];
        
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   
    
    if (tableView.tag == 1) {
        
        UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
        view.backgroundColor = JCBackgroundColor;
        
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = JCColorMidGray;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(10);
            make.centerY.equalTo(view);
        }];
        
        if (section == 0) {
            label.text = @"组内成员";
        }
        
        if (section == 1) {
            
            label.text = @"子组";
        }
         return view ;
        
    }else {
          UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
         return view;
    }
   
   
}


-(void)buttonAction1:(UIButton *)button {

    
    NSArray *array = @[@"试用报表",@"销售报表",@"物品统计"];
    JCModel_WorkGroupList *list = _dataArray2[button.tag];
    
    
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择表类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        if (index == 2) {
            MyItemsViewController *myItemsVC = [[MyItemsViewController alloc]init];
            myItemsVC.sting = @"工作组";
            myItemsVC.groupId = list.listIdentifier;
            
            [self.navigationController pushViewController:myItemsVC animated:YES];
            
        }else {
            AttributeViewController *attribute = [[AttributeViewController alloc]init];
            attribute.titleString = array[index];
            attribute.workGroupIdString = [NSString stringWithFormat:@"%@",list.listIdentifier];
            attribute.isALL = YES;
            [self.navigationController pushViewController:attribute animated:YES];
            
        }
        
    }];
}

-(void)cellButtonAction:(UIButton *)button {
    
    NSArray *array = @[@"试用报表",@"销售报表",@"工作日志",@"试用清单",@"销售清单",@"超期待办",@"水卡充值",@"ta的客户",@"ta的客户水量预警",@"ta的试用客户名单",@"ta的经销商",@"ta的自身物品",@"ta的合作点"];

    JCModel_WorkGroupGroupRelations *workGroupRelations = _dataArray[button.tag];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>%@",_dataArray);
    WorkGroupSearchToolViewController *vc =[[WorkGroupSearchToolViewController alloc]init];
    vc.workGroupRelations = workGroupRelations;
    vc.isAssistant = _isAssistant;
    vc.workGrouplist = _workGrouplist;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)readParent {
    
    JCRequest_searchWorkGroupData *request = [[JCRequest_searchWorkGroupData alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"parent":_workGrouplist.listIdentifier,
                                @"type":@"all",
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_searchWorkGroupData *request) {
        //
        NSDictionary *dic = request.responseJSONObject;
        JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
        
        JCModel_WorkGroupData *data = [[JCModel_WorkGroupData alloc]init];
        data = base.data;
        _dataArray2 = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)readData {
    
    JCRequest_searchWorkGroupData *request = [[JCRequest_searchWorkGroupData alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"id":_workGrouplist.listIdentifier,
                                @"type":@"all",
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_searchWorkGroupData *request) {
        //

        NSDictionary *dic = request.responseJSONObject;
        JCModel_WorkGroupBase *base = [[JCModel_WorkGroupBase alloc]initWithDictionary:dic];
        JCModel_WorkGroupData *data = [[JCModel_WorkGroupData alloc]init];
        data = base.data;
        JCModel_WorkGroupList *list = [[JCModel_WorkGroupList alloc]init];
        list = data.list[0];
        _dataArray = list.groupRelations;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(_tableView3.mas_bottom);
                make.bottom.equalTo(self.view).offset (-100);
            }];
            
        });
        
 
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchWorkGroupData *request, NSError *error) {
        NSLog(@"失败 %@",error);
        
        
    }];
    
}

-(void)NewMyGroup:(JCModel_employeeInfoData *)data {
    
    if ([_buttonSring  isEqual: @"添加观察者"]) {
        
        JCRequest_addGroupObserver *request = [[JCRequest_addGroupObserver alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":_workGrouplist.listIdentifier,
                                    @"number":[NSString stringWithFormat:@"%d",(int)data.dataIdentifier],
                                    @"type":@"1"
                                    };
        
        NSLog(@"%@",request.requestArgument);
        [request startWithBlockSuccess:^(__kindof JCRequest_addGroupObserver *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSLog(@"1:::::::%@",dic);
            NSString *result = [dic objectForKey:@"result"];
            
            if ([result  isEqual: @"success"]) {
                [self showInfo:@"添加观察者成功"];
            }
            [self readNewTableViewData];
            
            
        } failure:^(__kindof JCRequest_addGroupObserver *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];

        
        
    }else if ([_buttonSring  isEqual: @"添加销售助理"]) {
     
        
        JCRequest_addGroupObserver *request = [[JCRequest_addGroupObserver alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":_workGrouplist.listIdentifier,
                                    @"number":[NSString stringWithFormat:@"%d",(int)data.dataIdentifier],
                                    @"type":@"2"
                                    };
        
        NSLog(@"%@",request.requestArgument);
        [request startWithBlockSuccess:^(__kindof JCRequest_addGroupObserver *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSLog(@"dic::::::::::::%@",dic);
            NSString *result = [dic objectForKey:@"result"];
            
            if ([result  isEqual: @"success"]) {
                [self showInfo:@"添加销售助理成功"];
            }
            [self readNewTableViewData];
            
            
        } failure:^(__kindof JCRequest_addGroupObserver *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }else {
        
        //添加新的组员
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealWorkGroupJoin.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        // 请求参数字典
        JCModel_pullGroupBase *base = [[JCModel_pullGroupBase alloc]init];
        
        base.command = @"start";
        base.type = @"pull";
        base.applicant = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
        JCModel_pullGroupWorkGroup *workGroup = [[JCModel_pullGroupWorkGroup alloc]init];
        workGroup.workGroupIdentifier = _workGrouplist.listIdentifier;
        base.workGroup = workGroup;
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
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    
                    [self showInfo:@"添加成功"];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
    }
    
}

-(void)NewMyGroupArray:(NSArray *)array {
    
    if (array.count > 0)
    {
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealWorkGroupCreate.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        // 请求参数字典
        JCModel_HomeToNewGroupBase *base = [[JCModel_HomeToNewGroupBase alloc]init];
        
        base.command = @"next";
        
        base.taskId = _taskIDstring;
        base.current = @"group_create_owner_check";
        base.isCreateCheckPass = YES;
        JCModel_HomeToNewGroupWorkGroup *workGroup = [[JCModel_HomeToNewGroupWorkGroup alloc]init];
        
        workGroup.workGroupIdentifier = _workGrouplist.listIdentifier;
        
        NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < array.count; i++) {
            JCModel_HomeToNewGroupGroupRelations *data = [[JCModel_HomeToNewGroupGroupRelations alloc]init];
            NSString *str = array[i];
            data.number = str.doubleValue;
            
            [array1 addObject:data];
        }
        
        workGroup.groupRelations = array1;
        
        
        base.workGroup = workGroup;
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
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                if ([result isEqualToString:@"success"]) {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    
                    [self showInfo:@"添加成功"];
                    [self.navigationController popViewControllerAnimated:YES];
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =msg;
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    NSLog(@"%@",array);
}

-(void)readNewTableViewData {
    JCRequest_getGroupObservers *request = [[JCRequest_getGroupObservers alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"gid":_workGrouplist.listIdentifier,
                                };
    
    NSLog(@"%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof JCRequest_getGroupObservers *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        NSLog(@"2::::::%@",dic);
       JCModel_GroupObservers2Base  *base = [[JCModel_GroupObservers2Base alloc]initWithDictionary:dic];
        _dataArray3 = base.data;
        
        [_tableView3 reloadData];
        [self addTableView3];
     
        
    } failure:^(__kindof JCRequest_getGroupObservers *request, NSError *error) {
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
