//
//  CooperationPointDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CooperationPointDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "JCRequest_searchCooPoint.h"
#import "DataModels.h"
#import "JCRequest_updateCooPointItemBack.h"
#import "MyCooperationPointViewController.h"
#import "NewCooperationViewController.h"
#import "NewCooperationPointViewController.h"
#import "RecyclingViewController.h"

@interface CooperationPointDetailsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *namaLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) JCModel_CooperationList *listData;
@property (nonatomic,strong) UILabel *buttonTitleLabel;


@end

@implementation CooperationPointDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"合作点详情";
    [self addViews];
    
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    
    UIToolbar*tools=[[UIToolbar alloc]initWithFrame:CGRectMake(5, 0, 80, 39)];

    
    NSMutableArray*buttons=[[NSMutableArray alloc]initWithCapacity:2];
//    UIBarButtonItem*button3=[[UIBarButtonItem alloc]i:[UIImage imageNamed:@"你的图片"] style: UIBarButtonItemStyleDone target:self action:@selector(press2)];
    UIBarButtonItem*button3=[[UIBarButtonItem alloc]initWithTitle:@"记录" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction1)];
    
    
    UIBarButtonItem*button2=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction2)];

    button3.tintColor=JCColorBlue;
    button2.tintColor=JCColorBlue;
    [buttons addObject:button3];
    [buttons addObject:button2];
    [tools setItems:buttons animated:NO];
    UIBarButtonItem*btn=[[UIBarButtonItem    alloc]initWithCustomView:tools];
    self.navigationItem.rightBarButtonItem=btn;
}

-(void)addViews {
    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    topView.backgroundColor = JCColorWithe;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(66));
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"默认头像男"];
    [topView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(topView.mas_left).offset(10);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
    
    _namaLabel = [[UILabel alloc]init];
    _namaLabel.font = JCFont16;
    _namaLabel.textColor = JCColorBlack;
    [topView addSubview:_namaLabel];
    [_namaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView).offset(9);
        make.left.equalTo(imageView.mas_right).offset(10);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont14;
    _phoneLabel.textColor = JCColorBlue;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_namaLabel.mas_bottom).offset(10);
        make.left.equalTo(_namaLabel);
    }];
    
 
    
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view).offset(-70);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(40));
    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _buttonTitleLabel = [[UILabel alloc]init];
    _buttonTitleLabel.font = JCFont15;
    _buttonTitleLabel.textColor = JCColorWithe;
    [button addSubview:_buttonTitleLabel];
    [_buttonTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"法人姓名";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.law;
    }
    
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"法人电话";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.lawPhone;
    }
    
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"地址";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.pointAddr;
    }
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"状态";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text =[NSString stringWithFormat:@"%d",(int)_listData.isCooperation];
    }
    if (indexPath.row == 4) {
        cell.titleLabel.text = @"时间";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.createTime;
    }
    if (indexPath.row == 5) {
        cell.titleLabel.text = @"业务员";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.guideName;
    }
    if (indexPath.row == 6) {
        cell.titleLabel.text = @"备注";
        cell.arrowImageView.hidden = YES;
        
        cell.contentLabel.text = _listData.remark;
    }
    
    
    
    
    return cell;
    
}
-(void)buttonAction1 {
    //记录  按钮
    MyCooperationPointViewController *vc = [[MyCooperationPointViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)buttonAction2 {
    // 编辑 按钮
    NewCooperationViewController *vc = [[NewCooperationViewController alloc]init];
    vc.listData = _listData;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)buttonAction {
    RecyclingViewController *vc = [[RecyclingViewController alloc]init];
    vc.idString = [NSString stringWithFormat:@"%d",(int)_listData.listIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readData {
    JCRequest_searchCooPoint *request = [[JCRequest_searchCooPoint alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":_cooperationPointSring
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchCooPoint *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_CooperationBase *base = [[JCModel_CooperationBase alloc]initWithDictionary:dic];
        
        JCModel_CooperationData *data = [[JCModel_CooperationData alloc]init];
        data = base.data;
        
        if (data.list.count > 0)
        {
            _listData = data.list[0];
            _namaLabel.text = _listData.pointName;
            _phoneLabel.text = _listData.pointPhone;
            _buttonTitleLabel.text = @"回收合作点设备";
        }
        
        [self.tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchCooPoint *request, NSError *error) {
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
