//
//  NewWorkGroupViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/2.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewWorkGroupViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "AttributeViewController.h"
#import "SGActionView.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
@interface NewWorkGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UILabel *typeButtonLabel;
@property (nonatomic,strong) UILabel *groupLeaderButtonLabel;
@property (nonatomic,strong) UITextField *remakeTextField;
@property (nonatomic,strong) NSString *groupLeaderId;

@end

@implementation NewWorkGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新建工作组";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
        make.top.equalTo(_tableView.mas_bottom).offset(20);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 0;
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"确定";
    lable.textColor = JCColorWithe;
    lable.font = JCFont14;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.centerX.equalTo(button);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"NewProbationCustomTableViewCell";
    // 1.缓存中取
    NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"姓名:";
        _nameTextField = cell.contentTextField;
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"类别:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 1;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _typeButtonLabel = cell.buttonLabel;
        
    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"组长:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 2;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _groupLeaderButtonLabel = cell.buttonLabel;
        
    }
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"备注:";
        _remakeTextField = cell.contentTextField;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
     if (indexPath.row == 1) {
         
         
         
     }
}

//确定
-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1)  {
        //选类型
        
        NSArray *array  = @[@"管理组",@"销售组",@"财务组",@"配送组"];
        [SGActionView showSheetWithTitle:@"选择类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _typeButtonLabel.text = array[index];
          
            
        }];

    }
    
    if (button.tag == 2) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
        
        for (int i = 0; i < _dataArray.count; i++) {
            JCModel_WorkGroupGroupRelations *workGroupRelations = _dataArray[i];
            [array addObject:workGroupRelations.name];
          
        }
        
        [SGActionView showSheetWithTitle:@"选择组长" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _groupLeaderButtonLabel.text = array[index];
            JCModel_WorkGroupGroupRelations *workGroupRelations = _dataArray[index];
            NSLog(@"%@",workGroupRelations);
            _groupLeaderId =[NSString stringWithFormat:@"%d",(int)workGroupRelations.number];
            
        }];
        
    }
    
    if (button.tag == 0) {
        
        if (_nameTextField.text.length == 0) {
            [self showInfo:@"需要填写组名"];
            return;
        }
        
        if ([_typeButtonLabel.text  isEqual: @"请选择"]) {
            [self showInfo:@"需要选择类型"];
            return;
        }
        
        if ([_groupLeaderButtonLabel.text  isEqual: @"请选择"]) {
            [self showInfo:@"需要选择组长"];
            return;
        }
        
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealWorkGroupCreate.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        
        // 请求参数字典
        JCModel_NewWorkingGroupBase*base = [[JCModel_NewWorkingGroupBase alloc]init];
        
        base.command = @"start";
        
        JCModel_NewWorkingGroupWorkGroup *workGroup = [[JCModel_NewWorkingGroupWorkGroup alloc]init];
        
        workGroup.name = _nameTextField.text;

        if ([_typeButtonLabel.text  isEqual: @"管理组"]) {
            workGroup.type = @"mgr";
        }
        
        if ([_typeButtonLabel.text  isEqual: @"销售组"]) {
             workGroup.type = @"sale";
        }
        
        if ([_typeButtonLabel.text  isEqual: @"财务组"]) {
            workGroup.type = @"finance";
        }
        
        if ([_typeButtonLabel.text  isEqual: @"配送组"]) {
            workGroup.type = @"distribution";
        }
        workGroup.org =  _workGrouplist.org;
        workGroup.owner = _groupLeaderId;
        workGroup.parent = [NSString stringWithFormat:@"%d",(int)_workGrouplist.parent];
        workGroup.parent = _workGrouplist.listIdentifier;

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
                    
                    [self showInfo:@"新建成功"];
                    
                    
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
